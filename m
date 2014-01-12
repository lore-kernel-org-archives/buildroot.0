From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 12 Jan 2014 11:45:45 +0200 (IST)
Subject: [Buildroot] [PATCH] coreutils: fix build with uClibc
In-Reply-To: <20140112093913.GD4659@sapphire.tkos.co.il>
References: <fb99be0f4d3d7d7e92f0e3948d923c624730f1a4.1388492301.git.baruch@tkos.co.il>
 <8761pr77v2.fsf@dell.be.48ers.dk> <20140112093913.GD4659@sapphire.tkos.co.il>
Message-ID: <alpine.DEB.2.02.1401121144450.17519@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jan 2014, Baruch Siach wrote:

> Date: Sun, 12 Jan 2014 11:39:13 +0200
> From: Baruch Siach <baruch@tkos.co.il>
> To: Peter Korsgaard <jacmet@uclibc.org>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] coreutils: fix build with uClibc
> 
> Hi Peter,
>
> On Sat, Jan 11, 2014 at 12:08:33AM +0100, Peter Korsgaard wrote:
>>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>> > +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>> > +COREUTILS_LDFLAGS += -lrt
>> > +COREUTILS_CONF_ENV += ac_cv_func_posix_spawn=yes \
>> > +		ac_cv_search_timer_settime=-lrt
>>
>> Hmm, this is only for uClibc snapshot, right? My 0.9.33 doesn't seem to
>> have posix_spawn, so this breaks the build.
>
> Correct. posix_spawn support was added in uClibc after 0.9.33. I posted
> recently a patch series with a better fix in uClibc
> (http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/73863, first patch).
> Since then, however, patches 2 and 3 (but not 1) were applied to uClibc
> master.  I'll send an update series that bumps the xtnesa uClibc snapshot

Read as "xtensa uClibc snapshot".

  - yba


> version instead.
>
> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
