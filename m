From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 21:43:57 +0200
Subject: [Buildroot] [git commit] libssh: fix download location
In-Reply-To: <20180907111539.4516E81151@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 20 Aug 2018 23:56:14 +0200")
References: <20180907111539.4516E81151@busybox.osuosl.org>
Message-ID: <87y3bh1mgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=38c29b54380e68e8fb237c6132c014a5721d4e06
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The current download location fails, and Buildroot falls back to
 > sources.b.o:

 > --2018-08-20 23:41:39--  https://red.libssh.org/attachments/download/218/libssh-0.7.5.tar.xz
 > Resolving red.libssh.org (red.libssh.org)... 78.46.80.163
 > Connecting to red.libssh.org (red.libssh.org)|78.46.80.163|:443... connected.
 > The certificate's owner does not match hostname ??red.libssh.org??
 > --2018-08-20 23:41:39--  http://sources.buildroot.net/libssh/libssh-0.7.5.tar.xz
 > Resolving sources.buildroot.net
 > (sources.buildroot.net)... 104.25.211.19, 104.25.210.19,
 > 2400:cb00:2048:1::6819:d313, ...
 > Connecting to sources.buildroot.net (sources.buildroot.net)|104.25.211.19|:80... connected.
 > HTTP request sent, awaiting response... 200 OK
 > Length: 351632 (343K) [application/x-xz]

 > This commit fixes the download location:

 > --2018-08-20 23:43:04--  https://www.libssh.org/files/0.7/libssh-0.7.5.tar.xz
 > Resolving www.libssh.org (www.libssh.org)... 87.98.168.187, 2001:41d0:2:f80c::4
 > Connecting to www.libssh.org (www.libssh.org)|87.98.168.187|:443... connected.
 > HTTP request sent, awaiting response... 200 OK
 > Length: 351632 (343K) [application/x-tar]

 > This patch is extracted from a contribution from Bernd Kuhls who was
 > also bumping the package at the same time
 > (http://patchwork.ozlabs.org/patch/959192/).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
