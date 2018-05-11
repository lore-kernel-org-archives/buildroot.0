From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:38:29 +0200
Subject: [Buildroot] [PATCH] strace: disable (again) mpers for musl
In-Reply-To: <60b22528a49993d727f4d3f45f761af03e7a8736.1525966932.git.baruch@tkos.co.il>
References: <60b22528a49993d727f4d3f45f761af03e7a8736.1525966932.git.baruch@tkos.co.il>
Message-ID: <20180511223829.63afd3db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 May 2018 18:42:12 +0300, Baruch Siach wrote:
> It turns out that mpers support in strace still does not play nicely
> with musl libc. As explained in commit 7892a778b (package/strace:
> disable libmpers with musl toolchains) headers mixup causes gcc header
> to be included, instead of the musl one, resulting in conflicting types.
> Commit 1088372941 (strace: bump to version 4.21) incorrectly enabled
> mpers for musl. Revert that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/345/3452419498c074ca66f36f0f87263fa10662ac86/
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
