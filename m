From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 00:54:44 +0200
Subject: [Buildroot] [PATCHv5] Add support for MIPS Codescape MTI GNU
	Linux toolchain
In-Reply-To: <1441207287-37761-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441207287-37761-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150902225444.GE7845@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2015-09-02 16:21 +0100, Vicente Olivert Riera spake thusly:
> - Add support for MIPS Codescape MTI GNU Linux toolchain
> - Add a hash value
> - Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
>   ARCH_SYSROOT_DIR sit side by side instead of nested.
> - Add logic for creating the side-by-side symlink as a post install
>   hook.
> - Add logic to allow Buildroot finding the toolchain binaries under
>   $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-05/bin.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I've included that new toolchain in the series I just sent:
    http://lists.busybox.net/pipermail/buildroot/2015-September/138624.html

[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 3cb59c6..7a3b1d7 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -144,6 +144,8 @@ endif
>  else
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
> +TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-05/bin

I've dropped this hunk, since it is no longer needed now that we can use
the generic extract commands with the strip-componnents.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
