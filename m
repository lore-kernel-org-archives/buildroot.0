From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Apr 2016 07:49:09 +0300
Subject: [Buildroot] gutenprint: fix host build when libusb found
In-Reply-To: <20160402184733.GA8155@waldemar-brodkorb.de>
References: <20160402184733.GA8155@waldemar-brodkorb.de>
Message-ID: <20160415044908.GG2092@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sat, Apr 02, 2016 at 08:47:33PM +0200, Waldemar Brodkorb wrote:
> Allow to disable USB support, otherwise host build breaks when
> libusb is found as installation tries to install to /usr.
> Fixes following autobuild error:
> http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Tested-by: Baruch Siach <baruch@tkos.co.il>

> ---
>  .../0004-build-usb-backends-conditional.patch      | 23 ++++++++++++++++++++++
>  package/gutenprint/gutenprint.mk                   |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 package/gutenprint/0004-build-usb-backends-conditional.patch
> 
> diff --git a/package/gutenprint/0004-build-usb-backends-conditional.patch b/package/gutenprint/0004-build-usb-backends-conditional.patch
> new file mode 100644
> index 0000000..db44a12
> --- /dev/null
> +++ b/package/gutenprint/0004-build-usb-backends-conditional.patch
> @@ -0,0 +1,23 @@
> +Allow to disable USB backend
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Have you tried to upstream this patch?

Since we would now be patching also configure.ac, please updated the 
AUTORECONF comment in gutenprint.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
