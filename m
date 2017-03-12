From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:57:22 +0100
Subject: [Buildroot] [PATCH 1/4] libscrypt: New package
In-Reply-To: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
Message-ID: <20170312235722.78481baf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 14:45:55 +0100, Stefan S?rensen wrote:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/Config.in                |  1 +
>  package/libscrypt/Config.in      |  7 +++++++
>  package/libscrypt/libscrypt.hash |  2 ++
>  package/libscrypt/libscrypt.mk   | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/libscrypt/Config.in
>  create mode 100644 package/libscrypt/libscrypt.hash
>  create mode 100644 package/libscrypt/libscrypt.mk

Thanks for your contribution, I've applied to master, after doing the
following changes:

    [Thomas:
     - Add entry to DEVELOPERS file for the new package
     - Add dependency on !BR2_STATIC_LIBS, because the Makefile
       unconditionally builds a shared library
     - Use the "github" helper function to define <pkg>_SITE, get rid of
       <pkg>_SOURCE.
     - License is BSD-2c, not just BSD.
     - Add <pkg>_LICENSE_FILES variable.
     - Define LIBSCRYPT_DISABLE_STACK_PROTECTOR inside the
       BR2_TOOLCHAIN_HAS_SSP condition, and move from a
       LIBSCRYPT_POST_EXTRACT_HOOKS to a LIBSCRYPT_POST_PATCH_HOOKS.
     - Pass $(TARGET_CONFIGURE_OPTS) instead of just passing CC.
     - Pass $(TARGET_MAKE_ENV) when calling $(MAKE).]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
