From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Feb 2020 09:52:13 +0100
Subject: [Buildroot] [PATCH/next 2/2] replace MESA_EGL_NO_X11_HEADERS
 hack with upstream EGL_NO_X11
References: <20200220185917.37908-1-bernd.kuhls@t-online.de>
 <20200220185917.37908-2-bernd.kuhls@t-online.de>
 <20200223084120.GJ8743@scaer>
Message-ID: <t2r9igxv9o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 23 Feb 2020 09:41:20 +0100 schrieb Yann E. MORIN:

> Bernd, All,
> 
> On 2020-02-20 19:59 +0100, Bernd Kuhls spake thusly:
>> Mesa3d 20.0.0 deprecated MESA_EGL_NO_X11_HEADERS:
>> https://cgit.freedesktop.org/mesa/mesa/commit/?
id=6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> 
> I think this change should be folded in the previous commit: indeed,
> that's the bump of mesa3d that causes the trouble.

Hi Yann,

even with mesa being bumped to 20.x old code still builds, mesa3d 20.0.0
just added a warning about the old define being deprecated. Splitting 
both topics, version bump and EGL_NO_X11, still creates a bisectable 
history and makes it easier to pinpoint problems to either one of these 
topics so I would still vote for two patches.

Regards, Bernd

PS: Only sent to mailing list via gmane because of mail delivery errors:

<yann.morin.1998@free.fr>: host mx1.free.fr[212.27.48.6] said: 451 too 
many
    errors from your ip (194.25.134.21), please visit
    http://postmaster.free.fr/ (in reply to DATA command)
