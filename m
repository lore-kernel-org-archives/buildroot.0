From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:24:00 +0200
Subject: [Buildroot] [PATCH] php: fix emalloc/efree/estrdup/...
 undefined references
In-Reply-To: <20180405210622.27836-1-thomas.petazzoni@bootlin.com>
References: <20180405210622.27836-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180409112400.48924369@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 Apr 2018 23:06:22 +0200, Thomas Petazzoni wrote:
> zend_alloc.h defines some macros such as:
> 
> Where _estrdup is the actual function implemented by the PHP core. If
> this header file is not included, and some code uses estrdup, one ends
> up with an undefined reference. This happens when libexpat support is
> enabled. This commit adds a PHP patch that fixes this issue. The patch
> has been submitted upstream through a Github pull request.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/889d2c1f509c035cd506e36061939bfddc8f1500/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-expat_compat.h-add-missing-php.h-include.patch | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
