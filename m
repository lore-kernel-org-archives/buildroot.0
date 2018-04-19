From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:39:56 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180417071246.12046-1-ricardo.martincoski@gmail.com>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
 <20180417071246.12046-1-ricardo.martincoski@gmail.com>
Message-ID: <20180419233956.6bfdde64@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 04:12:46 -0300, Ricardo Martincoski wrote:
> The current logic that removes 5 files at random to force the download
> to be tested eventually ends up removing files from the git
> repositories used as cache by the download infra.
> 
> When a file that was previously checked out in a git cache is removed,
> the next 'git checkout' succeeds but does not checkout that file. The
> repo remains with 'Changes not staged for commit', the tarball is
> generated and the hash mismatches, causing a build failure.
> 
> Ensure only the tarballs are removed by excluding any file inside a git
> repository from the list of potential files to remove.
> The download infra for git method uses 'git fetch' when regenerating the
> tarball, this command fails as expected if the upstream location
> changed.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2: (after review by Thomas Petazzoni)
>   - add comment to the code to clarify why we test for '.git' and not
>     'git';
>   - use the most correct syntax: del;

I've applied to buildroot-test since a few days, forgot to notify you
and the mailing list, sorry about that. See
https://git.buildroot.org/buildroot-test/commit/?id=cb1c4829b1d1ab660736811101fb6d988a8d14e7

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
