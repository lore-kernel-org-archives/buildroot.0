From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 21:56:29 +0200
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
 <20150418143654.021fa104@free-electrons.com>
 <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
Message-ID: <55394E6D.8000404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 05:02, Santhosh Ramani wrote:
> Hello Thomas,
> 
> Thanks for your reply - I was able to use 'udevadm monitor' to look at udev
> events. Every time the USB is inserted, I do see udev messages indicate 'add'.
> These are the scripts and rules I have in the system - may be I'm doing
> something wrong here...
> 
> I have added a rule in /etc/udev/rules.d/ and it has the following single line.
> 
> /# cat /etc/udev/rules.d/99-usb-detection.rules/*
> SUBSYSTEM=="usb", ACTION=="add", KERNEL=="sda*", RUN+="/etc/hcc/usb-detected"*

 If it's a scsi device, the subsystem is block, not usb, right?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
