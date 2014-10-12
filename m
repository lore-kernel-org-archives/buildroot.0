From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Oct 2014 10:44:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <20141012102554.39aa340a@free-electrons.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
 <20141012102554.39aa340a@free-electrons.com>
Message-ID: <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> That being said, are you sure this dance is really needed? There are
> some configure options to Mono to enable or disable the various
> versions of the runtime.

Yes, you are right, but changing runtime version means you have to
recompile a lot of things. This way, you compile at first and simply
removing .stap_target_installed, you can have free a new mono runtime
version!
If you think that it necessary to have them disabled at compile time,
I'll do it!

>
>> +ifneq ($(ASSEMBLY_INCLUDED),)
>> +$(eval $(host-autotools-package))
>> +endif
>
> Conditional not needed. I think we should ensure at least one runtime
> version is enabled.

That's not always true. There is ways in mono to "freeze" the
assemblies your application requires, so only the mono vm is required.
Moreover, you can write an application that ships required assemblies
in your project folder and not using the system wide installed.
I think that having an option to only compile the vm is good!

Thank you again for your time!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
