From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 14 Apr 2017 06:07:01 -0500
Subject: [Buildroot] [PATCH 2/3] python3: ncurses condition for
	libselinux enabled
In-Reply-To: <CANQCQpbtX9ciJhtCSuA0k5Y9tFqtOuziZqpDYbjbz1viaPu6cg@mail.gmail.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1492056974-1773-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20170413222710.419f6cd1@free-electrons.com>
 <CANQCQpb4ySf=NtgNbWShus4YUrJDFqhqTgB0b_oc++Ov3xrmsw@mail.gmail.com>
 <36801d5f-fd50-c2ec-8f42-0ec15544cef4@mind.be>
 <CANQCQpZXUjETb4oT7UDF8kQ7OC3+RvEffiXNGfAL8mg4cy1bew@mail.gmail.com>
 <20170414092419.14a74161@free-electrons.com>
 <CANQCQpb+0UX5C8npsCXNVMOvR89mdF1jZ1jATLwTufK_633kWw@mail.gmail.com>
 <CANQCQpbtX9ciJhtCSuA0k5Y9tFqtOuziZqpDYbjbz1viaPu6cg@mail.gmail.com>
Message-ID: <CANQCQpZKNp-GCWjtXYa-RuHtDhu=ZykG8kh-dHqmfiyYMELZJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Apr 14, 2017 2:24 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Thu, 13 Apr 2017 21:29:09 -0500, Matthew Weber wrote:

> >  Alternatively, we could cut the ncurses->busybox dependency. That only
exists
> > to make sure that ncurses tools overwrite busybox tools. IIRC busybox
will not
> > overwrite existing tools, so the reverse should work as well. Or else
remove
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


Currently the buildroot default busybox config has the two tools which
would be missing if ncurses was disabled, enabled by default. So I think
that's ok, (not the cleanest though).



Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170414/7908d1e9/attachment.html>
