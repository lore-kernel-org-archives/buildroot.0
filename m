From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jul 2015 14:21:41 +0200
Subject: [Buildroot] [git commit] ntpd: drop unneeded uClibc workaround
	for refclock_pcf.c
In-Reply-To: <CANxTyt5E9GdPNWOz=8bngGQKcW0a7ZWrX-cy5N7MgFMf=KgbbQ@mail.gmail.com>
 (Danomi Manchego's message of "Mon, 6 Jul 2015 07:37:44 -0400")
References: <20150706080825.BCE3E7FBCC@busybox.osuosl.org>
 <CANxTyt5E9GdPNWOz=8bngGQKcW0a7ZWrX-cy5N7MgFMf=KgbbQ@mail.gmail.com>
Message-ID: <87io9xpjca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

>> -define NTP_PATCH_FIXUPS
 >> -       $(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
 >> -endef

 > So then - you can also drop this line too, I think:

 > NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS

Crap, thanks for noticing!

-- 
Venlig hilsen,
Peter Korsgaard 
