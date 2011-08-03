From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 3 Aug 2011 10:03:41 +0200
Subject: [Buildroot] [PATCH] Adding Fluxbox window manager
In-Reply-To: <20110803095632.72d84561@skate>
References: <20110802191004.66ae3ee3@gmail.com> <20110802204412.4be907e7@skate>
 <CAAXf6LWyzvEKG_us4XJtM5T_CgCPHkUM9oSBMyf7KWXVqO3NYA@mail.gmail.com>
 <20110803095632.72d84561@skate>
Message-ID: <CAAXf6LUqhDWKPOziVaPUFKvpk2xQMac=6UDN05WeRExT7kRYPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 3, 2011 at 9:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 3 Aug 2011 09:46:16 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> >> +FLUXBOX_VERSION:=1.3.1
>> >> +FLUXBOX_SOURCE:=fluxbox-$(FLUXBOX_VERSION).tar.bz2
>> >> +FLUXBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
>> >
>> > Please use = instead of :=.
>>
>> Just curious: why do you recommend against := ?
>> For example in the case of FLUXBOX_SOURCE, using := would avoid
>> unnecessary expansions of $(FLUXBOX_VERSION), each time FLUXBOX_SOURCE
>> is used.
>> For FLUXBOX_SITE it depends on whether BR2_SOURCEFORGE_MIRROR is
>> already defined or not, but I think it has, right?
>
> Peter Korsgaard said:
>
> """"
> := is only a performance advantage if variables are expensive to expand
> (use) and are used more than once - E.G. stuff involving $(shell) and
> similar, like the UPPERCASE macro we had calling tr.
>
> = has a number of advantages though. As it only gets expanded at the
> last possible moment you don't have to take care about variable
> ordering, E.G. when you use a variable like LIBGLIB2_HOST_BINARY on
> another package, whereas with := you do. This can also be interesting
> when the variable contains $(shell) or other functions, as you might
> only want to execute them if/when they are needed, and not right away
> when the Makefiles are parsed.
>
> I would prefer to use = by default, and only use := where it matters for
> correctness or performance.
> """"
>
> See:
>
> Subject: Re: [Buildroot] [PATCH 07/28] barebox: use = instead of := and re-indent
> Date: Tue, 05 Jul 2011 23:04:58 +0200
> Message-ID: <87sjqkv3ph.fsf@macbook.be.48ers.dk>

Ok, thanks.
Thomas

>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
