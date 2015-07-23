From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jul 2015 00:10:00 +0200
Subject: [Buildroot] [PATCH v2] Add support for MIPS Codescape MTI GNU
	Linux toolchain
In-Reply-To: <1437675584-3604-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1437675584-3604-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150723221000.GB3530@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-07-23 20:19 +0200, Vicente Olivert Riera spake thusly:
> - Add support for MIPS Codescape MTI GNU Linux toolchain
> - Add a hash value
> - Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
>   ARCH_SYSROOT_DIR sit side by side instead of nested.
> - Add logic for creating the side-by-side symlink as a post install
>   hook.
> - Add logic to allow Buildroot finding the toolchain binaries under
>   $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Still, I ahve a question for Thomas...

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 5ce4d33..f762dbc 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -144,6 +144,8 @@ endif
>  else
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
> +TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin

I wonder if we could not just use the _STRIP_COMPONENTS variable to get
rid of that extra level...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
