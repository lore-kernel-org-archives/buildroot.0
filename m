From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Nov 2015 20:56:20 +0200
Subject: [Buildroot] [PATCH] libpcap: fix sparc64 build, -fPIC required
In-Reply-To: <20151103171735.GA32079@waldemar-brodkorb.de>
References: <20151103171735.GA32079@waldemar-brodkorb.de>
Message-ID: <20151103185620.GZ3352@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Tue, Nov 03, 2015 at 06:17:35PM +0100, Waldemar Brodkorb wrote:
> -# microblaze needs -fPIC instead of -fpic
> -ifeq ($(BR2_microblaze),y)
> +# microblaze/sparc64 needs -fPIC instead of -fpic

s/needs/need/

> +ifeq ($(BR2_microblaze)$(BR2_sparc64),y)
>  LIBPCAP_CFLAGS += -fPIC
>  endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
