From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 09:24:19 +0200
Subject: [Buildroot] [PATCH 2/3] python3: ncurses condition for
 libselinux enabled
In-Reply-To: <CANQCQpZXUjETb4oT7UDF8kQ7OC3+RvEffiXNGfAL8mg4cy1bew@mail.gmail.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1492056974-1773-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20170413222710.419f6cd1@free-electrons.com>
 <CANQCQpb4ySf=NtgNbWShus4YUrJDFqhqTgB0b_oc++Ov3xrmsw@mail.gmail.com>
 <36801d5f-fd50-c2ec-8f42-0ec15544cef4@mind.be>
 <CANQCQpZXUjETb4oT7UDF8kQ7OC3+RvEffiXNGfAL8mg4cy1bew@mail.gmail.com>
Message-ID: <20170414092419.14a74161@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 21:29:09 -0500, Matthew Weber wrote:

> >  Alternatively, we could cut the ncurses->busybox dependency. That only exists
> > to make sure that ncurses tools overwrite busybox tools. IIRC busybox will not
> > overwrite existing tools, so the reverse should work as well. Or else remove
> > these things from the busybox config.
> 
> Good idea.  I checked busybox/ncurses and only the ncurse's
> "clear"/reset tools overlap.  I'll pull something together removing
> the dependency and doing a CONFIG_CLEAR/RESET disable as part of
> busybox configuration tweaks.

Isn't it a bit annoying to no longer have clear/reset compiled as part
of Busybox?

Perhaps we should enable the clear/reset applets in Busybox if ncurses
is disabled, and disable the clear/reset applets in Busybox if ncurses
is enabled. This way, we keep the existing functionality, but we can
break the ncurses->busybox dependency.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
