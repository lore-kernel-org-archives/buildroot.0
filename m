From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:04:21 +0200
Subject: [Buildroot] [PATCH 1/1] mutt: fix static build with libidn2 and
 libunistring
In-Reply-To: <20180820170807.21070-1-fontaine.fabrice@gmail.com>
References: <20180820170807.21070-1-fontaine.fabrice@gmail.com>
Message-ID: <20180820230421.26bda7a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 19:08:07 +0200, Fabrice Fontaine wrote:
> When libidn2 is statically build with libunistring support, mutt needs
> to add -lunistring to LIBS.
> To do that, add a call to PKG_CHECK_MODULES to retrieve this information
> from libidn2.pc
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/177da8f4798f69298db5385957184f1c53cca923
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...tatic-build-with-libidn2-and-libunistring.patch | 36 ++++++++++++++++++++++
>  package/mutt/mutt.mk                               |  4 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch

Thanks for doing the right thing here by using pkg-config! Could you
submit this patch upstream ?

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
