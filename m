From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 11:02:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
 <20141012102554.39aa340a@free-electrons.com>
 <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
Message-ID: <20141012110213.5b7c6c8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sun, 12 Oct 2014 10:44:21 +0200, Angelo Compagnucci wrote:

> Yes, you are right, but changing runtime version means you have to
> recompile a lot of things. This way, you compile at first and simply
> removing .stap_target_installed, you can have free a new mono runtime
> version!
> If you think that it necessary to have them disabled at compile time,
> I'll do it!

Yes, please, that's how we do things for all packages: if a configure
option is there to not build something that is actually disabled in the
Buildroot configuration, then we use that.

> >> +ifneq ($(ASSEMBLY_INCLUDED),)
> >> +$(eval $(host-autotools-package))
> >> +endif
> >
> > Conditional not needed. I think we should ensure at least one runtime
> > version is enabled.
> 
> That's not always true. There is ways in mono to "freeze" the
> assemblies your application requires, so only the mono vm is required.
> Moreover, you can write an application that ships required assemblies
> in your project folder and not using the system wide installed.
> I think that having an option to only compile the vm is good!

Then, the conditional shouldn't be here, but around the dependency of
mono on host-mono.

That being said, I would recommend you to keep things simple for now,
and handle only this use case as a follow-up contribution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
