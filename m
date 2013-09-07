From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Sep 2013 11:15:52 +0200
Subject: [Buildroot] Two or three stages gcc build?
In-Reply-To: <EEBE54E3-BD6F-4BB5-88C4-CB3B51CC1FCC@gmail.com>
References: <20130705233831.12030038@skate>
 <9C6FE6D2-322A-41E7-8B82-C623B5C1F754@gmail.com>
 <20130906145821.4ce0ab13@skate>
 <EEBE54E3-BD6F-4BB5-88C4-CB3B51CC1FCC@gmail.com>
Message-ID: <20130907111552.0d646140@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Khem Raj,

On Fri, 6 Sep 2013 09:59:34 -0700, Khem Raj wrote:

> > In the mean time, I've experimented a bit and actually implemented it.
> > The patch hasn't been merged yet in Buildroot, but it has been posted:
> > http://lists.busybox.net/pipermail/buildroot/2013-September/077344.html.
> > 
> > Don't hesitate to have a look and tell me what you think.
> 
> OK. The patch looks ok to me. one thing
> 
> Do you need to support multiple toolchains ? and how far do you want to go back ? I would much rather not
> have THREE_STAGE_BUILD options at all.

We do need to support building gcc 4.2.x, because that's the only
version for which thee AVR32 architecture is supported. I'm hoping that
in a year or two we can drop AVR32 support (the architecture has been
deprecated by Atmel), and therefore simplify a few things, but for now,
I believe we need to be able to support older gcc versions than 4.7/4.8.

Thanks for having a look at the patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
