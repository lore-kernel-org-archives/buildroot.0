From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Oct 2015 08:07:24 +0300
Subject: [Buildroot] [PATCH 1/1] luvi: new package
In-Reply-To: <1444763952-29583-1-git-send-email-joerg.krause@embedded.rocks>
References: <1444763952-29583-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151014050724.GA2391@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Tue, Oct 13, 2015 at 09:19:12PM +0200, J?rg Krause wrote:
> +# Dispatch all architectures of LuaJIT
> +ifeq ($(BR2_i386),y)
> +TARGET_ARCH = x86
> +else ifeq ($(BR2_x86_64),y)
> +TARGET_ARCH = x64
> +else ifeq ($(BR2_powerpc),y)
> +TARGET_ARCH = ppc
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +TARGET_ARCH = arm
> +else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> +TARGET_ARCH = mips
> +else
> +TARGET_ARCH = $(BR2_ARCH)
> +endif

TARGET_ARCH is too generic for a Makefile variable. It might conflict with 
something else since the Makefile namespace is global. Please use something 
like LUVI_TARGET_ARCH.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
