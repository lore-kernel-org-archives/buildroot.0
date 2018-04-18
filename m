From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 10:52:25 +0200
Subject: [Buildroot] [PATCH 0/4] support/download: make the git backend
 more robust
In-Reply-To: <20180418104021.14be6fe9@windsurf.numericable.fr>
References: <cover.1523983687.git.yann.morin.1998@free.fr>
 <20180418104021.14be6fe9@windsurf.numericable.fr>
Message-ID: <20180418105225.747e611e@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 10:40:21 +0200, Thomas Petazzoni wrote:

> I have not yet tested with this patch series applied, but with the
> current master, I see a difference in behavior between what happens on
> my machine (recent Fedora system) and my build server (ancient Debian).

No change with the patch series applied. It does a full clone, but
fails after that:

test at build:~/buildroot$ rm -rf ~/dl/squashfs/
test at build:~/buildroot$ make host-squashfs-extract
>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Downloading
Initialized empty Git repository in /home/test/dl/squashfs/git/.git/
Fetching all references 
remote: Counting objects: 8972, done.
remote: Total 8972 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (8972/8972), 1.56 MiB | 2.51 MiB/s, done.
Resolving deltas: 100% (6544/6544), done.
From https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools
 * [new branch]      lz4        -> origin/lz4
 * [new branch]      master     -> origin/master
 * [new branch]      stable     -> origin/stable
Could not fetch special ref 'e38956b92f738518c29734399629e7cdb33072d3'; assuming it is not special.
ERROR: squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz has wrong sha256 hash:
ERROR: expected: bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779
ERROR: got     : c7a61e3bcabb716b268f5a341055ac5ecda8b9f2b42025f82926f201ff5c8881
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2018-04-18 08:41:14--  http://sources.buildroot.net/squashfs/squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48, 104.27.167.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-04-18 08:41:14 ERROR 404: Not Found.

--2018-04-18 08:41:14--  http://sources.buildroot.net/squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48, 104.27.167.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-04-18 08:41:14 ERROR 404: Not Found.

make: *** [/home/test/buildroot/output/build/host-squashfs-e38956b92f738518c29734399629e7cdb33072d3/.stamp_downloaded] Error 1

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
