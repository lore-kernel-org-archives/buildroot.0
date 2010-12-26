From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 08:15:22 -0600
Subject: [Buildroot] continued issues with AR
In-Reply-To: <1293296176.4625.87.camel@coalu.atr>
References: <20101225102011.66586l6anzqeak0s@www.home.zuerker.org>
	<1293296176.4625.87.camel@coalu.atr>
Message-ID: <20101226081522.9979373ky6jfze80@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Lionel Landwerlin <llandwerlin@gmail.com>:

> Le samedi 25 d?cembre 2010 ? 10:20 -0600, Heiko Zuerker a ?crit :
>> Hey,
>>
>> it seems like I keep running into issues where it tries to use my
>> local ar, instead of the one from the external toolchain.
>> I'm not familiar with the workings behind the scenes of buildroot, but
>> is it possible that something is missing somewhere?
>> Do we need to always set i.e. AR=$(TARGET_AR) ?
>> Could the same be happening for other files like ld,gcc and so on?
>>
>
> Yup,
>
> As some others packages, lvm2 does not use automake. So makefiles
> remains mostly "hand written"...
>
> With fully autotooled packages, we define CC/AR/LD/etc... variables at
> configure time, so the configure script generates the makefiles with
> proper CC/AR/LD/etc... variables definitions.
> With semi autotooled packages as lvm2, we rely on what as been written
> by the lvm2 developers.
>
> One solution could be to define a kind of Makefile.half.autotool.in top
> makefile to handle these specials cases (which do not seem that special
> after all), in which we would define AR/CC/LD/etc... at build time (most
> of them are defined in TARGET_CONFIGURE_OPTS already).
>
> What do you think ?

Wouldn't it make sense to always define the variables, using a subset  
of TARGET_CONFIGURE_OPTS? Don't we always need them to point to the  
cross compiler?

Or maybe some configuration variable you could specify in the  
Makefile, which then takes care of all the magic.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
