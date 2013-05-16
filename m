From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 May 2013 15:05:21 +0300
Subject: [Buildroot] [PATCH] poco: not available for all architectures
In-Reply-To: <5194CAB9.8020102@zacarias.com.ar>
References: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
 <20130516115453.GF4709@tarshish> <5194CAB9.8020102@zacarias.com.ar>
Message-ID: <20130516120521.GG4709@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, May 16, 2013 at 09:02:01AM -0300, Gustavo Zacarias wrote:
> On 05/16/2013 08:54 AM, Baruch Siach wrote:
> >>  comment "poco requires a toolchain with WCHAR, threads, and C++ support"
> >>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
> >>  		|| !BR2_TOOLCHAIN_HAS_THREADS
> >> +	depends on !(BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
> > 
> > Enabling this comment when it is the architecture that is not supported might 
> > confuse the user. Maybe we should add another comment? How is this handled in 
> > other packages?
> 
> I'm actually disabling the comment if it's not a supported architecture
> with that line (same as the option itself).

Ah, right. I always get confused by reverse logic.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
