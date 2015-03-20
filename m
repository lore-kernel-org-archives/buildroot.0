From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 16:10:16 -0400
Subject: [Buildroot] [PATCH v2 23/25] avahi: systemd cleanups
In-Reply-To: <20150320204150.4169961f@free-electrons.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-24-git-send-email-mike@mikebwilliams.com>
 <20150320204150.4169961f@free-electrons.com>
Message-ID: <CANPyyuPHqnwtSFKBcf=Qk2os+Oz6DYtPc12e2Ak6c_GbJgHqtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 20, 2015 at 3:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Fri, 20 Mar 2015 15:14:14 -0400, Mike Williams wrote:
>
>> +ifneq ($(BR2_PACKAGE_SYSTEMD),y)
>> +AVAHI_CFLAGS += -DDISABLE_SYSTEMD
>> +endif
>
> Seriously, do you test the patches you send? I really value the
> contributions you're making around systemd support: it's great to have
> someone finally picking up this topic and doing some
> cleanup/refactoring. But please, test your patches at least minimally.

Yes, I built, booted it, and verified that systemd started it without
error. I mistakenly assumed that meant it the patch was working
correctly; I don't use avahi for anything and have no experience with
it.

> The <pkg>_CFLAGS variable does not exist and has no effect.

I see that now. I fgrep'd for _CFLAGS initially to find out how other
packages were doing it, and didn't realize this common convention
wasn't part of buildroot.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
