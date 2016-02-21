From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:38:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: add optional support for
 xz
In-Reply-To: <1456007514-29695-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007514-29695-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221143850.579fae60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:31:54 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_XZ),y)
> +# fixes broken check for xz when cross-compiling:
> +# checking for lzma_code in -llzma...
> +# ./configure: line 4712: ac_fn_c_try_link: command not found
> +KEXEC_CONF_ENV += ac_cv_lib_lzma_lzma_code=yes

Instead of this, I've added a bump to version 2.0.11, which contains an
upstream commit that fixes this issue. Yes, it's a version bump on
master, but it's a minor version bump, so I think it's reasonable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
