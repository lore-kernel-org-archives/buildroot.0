From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 23:16:35 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <5445656E.9010404@mind.be>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
 <543AD090.3000107@zacarias.com.ar> <543EA87A.2050204@mind.be>
 <543FCDD6.9070104@zacarias.com.ar> <54419C9C.7050705@mind.be>
 <5441BEDE.1000102@zacarias.com.ar> <54441E9F.8080802@mind.be>
 <20141019225451.3aa6176e@free-electrons.com>
 <54446B1B.2090201@zacarias.com.ar> <5445656E.9010404@mind.be>
Message-ID: <20141020231635.5e5e2cf8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 20 Oct 2014 21:41:34 +0200, Arnout Vandecappelle wrote:

>  Well, there was nobody to provide counter-arguments. That's why I started the
> discussion on the list.
> 
>  It's very clear that version selection is needed. It's not so clear that a
> separate version is really needed for host-qemu-system and host-qemu-user, because:
> 
>  - there's a slightly larger chance that both system and user are broken;
>  - we currently anyway don't have version selection for user;
>  - we can change it later if required.
> 
>  On the other hand, it's also possible to merge the qemu-system package now and
> refactor it back into a single package later. It wouldn't even require legacy
> handling because the config symbols already start with BR2_PACKAGE_QEMU.
> 
>  So I'd propose to give Yann some time to produce a unified qemu package, but if
> it doesn't come we can still merge your original patch.

I agree. Nothing is set in stone. At first sight, I don't really see a
reason to have a separate version for host-qemu-user and
host-qemu-system, so let's implement something that uses the same
version for both, and if reality proves that it was a bad choice, it
will also be time to change.

> > The side effect is that it pushes my motivation to contribute to
> > buildroot to an all-time low (read that as you wish, in fact it may not
> > even matter).
> 
>  Since you're the #1 buildroot contributor and have been for some time now, it
> really does matter!

Yes, it clearly matters. I'm a bit sad to see that this specific story
has affected your motivation. However, on this story, you had your own
idea, and basically rejected the comments that were made. That's not
really the best way to push things forward: maybe doing a concession
sometimes helps, and thanks to this concession, you might prove at a
later point that people were wrong and you were right from the
beginning :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
