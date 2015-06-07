From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 7 Jun 2015 06:22:35 +0300
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <20150607032235.GA2671@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 07, 2015 at 12:20:37AM +0200, Yann E. MORIN wrote:
> +################################################################################
> +# inner-kernel-module -- generates the make targets needed to support building
> +# a kernel module
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages

What is the meaning of building "host" kernel module? These are the target 
kernel headers we are using here. Besides, you do not provide a 
host-kernel-module macro, at least in this patch.

> +#  argument 4 is the type (always 'target')

And here only target is allowed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
