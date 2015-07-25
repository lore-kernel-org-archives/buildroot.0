From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 12:16:01 +0200
Subject: [Buildroot] [PATCH v7 1/1] rtl8821au: new package
In-Reply-To: <1437777122-28383-1-git-send-email-christian@paral.in>
References: <1437777122-28383-1-git-send-email-christian@paral.in>
Message-ID: <20150725101601.GB3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, Luca, All,

Luca, a licensing question for you... ;-)

On 2015-07-24 15:32 -0700, Christian Stewart spake thusly:
> This patch adds the rtl8821au wifi driver. The driver is sourced from
> ulli-kroll's work on GitHub, which includes various fixes and better LED
> handling. Currently USB3 support is broken in this driver - it will
> only connect to the EHCI controller in a USB3 port.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> new file mode 100644
> index 0000000..d54d3c3
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -0,0 +1 @@
> +sha256 93beaf608880ecbca03bbeb8251b91d16e17724b36158b0571d1cebb7b4e5914  rtl8821au-f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d.tar.gz
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> new file mode 100644
> index 0000000..42f4cdd
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# rtl8821au
> +#
> +################################################################################
> +
> +RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
> +RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

You forgot the licensing information:

    RTL8821AU_LICENSE = GPLv2
    RTL8821AU_LICENSE_FILES = COPYING

Luca:

Also, two firmware blobs are installed, and we have no licensing info
for those two; usually it's a proprietary license.

I wonder if/how we can reflect this in the licensing info above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
