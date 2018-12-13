From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:15:39 +0100
Subject: [Buildroot] [PATCH] trinity: fix build with kernel headers v4.19
In-Reply-To: <8e600f4b5c8ef661080050b5b3af7e8ec9b8744a.1544641625.git.baruch@tkos.co.il>
References: <8e600f4b5c8ef661080050b5b3af7e8ec9b8744a.1544641625.git.baruch@tkos.co.il>
Message-ID: <20181213211539.5b63a6cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 21:07:05 +0200, Baruch Siach wrote:
> Kernel v4.19 introduced a change in linux/rds.h UAPI header that causes
> networking definitions collision with libc headers. Add a patch fixing
> that be reordering the include list.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b30/b30993de10c909602ec2e9098a91e400fa9c91f6/
> http://autobuild.buildroot.net/results/96d/96deb94e5f959c844060d449fae5668c5f3c5571/
> http://autobuild.buildroot.net/results/c7a/c7aa75fd8faad7ac49492497807d1a7fe4c4f955/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...s-include-libc-network-headers-first.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/trinity/0006-proto-rds-include-libc-network-headers-first.patch

Applied to master after renumbering from 0006 to 0005 because there was
no 0005 patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
