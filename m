From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:06:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/gensio: add libgensio.pc
In-Reply-To: <20200216200242.1414766-1-fontaine.fabrice@gmail.com>
References: <20200216200242.1414766-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412230640.00081e39@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 16 Feb 2020 21:02:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gensio/0002-Add-libgensio.pc.patch | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 package/gensio/0002-Add-libgensio.pc.patch

So, your patch was merged in upstream gensio:

  https://github.com/cminyard/gensio/commit/cd7fcd3197722910bfe6be3da4f55b28b8880dc3#diff-8afe8fc980005e7f95dba9eb6fd3747c

Which is now part of the 2.0.1 version of gensio that Buildroot is
using.

However, upstream has applied another patch on top, which drops the
Libs.private entry of your .pc.in:

  https://github.com/cminyard/gensio/commit/6f9ac3bca6dd17f12fc319d888d0875814a07878#diff-8afe8fc980005e7f95dba9eb6fd3747c

In Buildroot, we have added a work-around to link against openssl in
ser2net:

  https://git.buildroot.org/buildroot/commit/package/ser2net?id=a5feea5ea3c3e8b0c8c7e92ec5cefb145215d2c6

So, ideally this work-around should no longer be needed. And indeed, it
does build fine without it. But how come it works since openssl is not
in gensio.pc Libs.private ?

Could you have a look at this whole story ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
