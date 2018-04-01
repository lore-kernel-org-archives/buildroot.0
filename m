From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 14:18:33 +0200
Subject: [Buildroot] [PATCH v1] quotatool: new package
In-Reply-To: <20180203220733.15255-1-ps.report@gmx.net>
References: <20180203220733.15255-1-ps.report@gmx.net>
Message-ID: <20180401141833.6f0306c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Feb 2018 23:07:33 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  ...x-missing-__P-definition-for-musl-compile.patch | 36 ++++++++++++++++++++++
>  package/quotatool/Config.in                        |  7 +++++
>  package/quotatool/quotatool.hash                   |  5 +++
>  package/quotatool/quotatool.mk                     | 18 +++++++++++
>  6 files changed, 68 insertions(+)
>  create mode 100644 package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
>  create mode 100644 package/quotatool/Config.in
>  create mode 100644 package/quotatool/quotatool.hash
>  create mode 100644 package/quotatool/quotatool.mk

Applied to master with the change to use QUOTATOOL_INSTALL_TARGET_OPTS,
as suggested by Romain.

Romain also suggested to remove __P instead of using <sys/cdefs.h>, but
since it would result in a patch of the same size, I was too lazy to
change to removing __P. The fact that upstream hasn't committed
anything since 2013 is also not very encouraging in terms of getting
patches accepted. So I've kept your patch as-is.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
