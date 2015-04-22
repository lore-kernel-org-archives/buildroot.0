From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Apr 2015 23:04:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/dhcpcd: Fix ipv6-related build
	error
References: <1429456975-17889-1-git-send-email-bernd.kuhls@t-online.de>
 <1429456975-17889-2-git-send-email-bernd.kuhls@t-online.de>
 <20150420225837.02ddde6b@free-electrons.com>
Message-ID: <XnsA484EAC255A71berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150420225837.02ddde6b at free-electrons.com:

> Do you have an explanation of why this build failure happens with
> certain uClibc toolchains and not others?

Hi Thomas,

sorry, I have no idea.

"struct in6_pktinfo" is encapsulated in include/netinet/in.h by

#ifdef __USE_GNU

It looked weird for me that dhcpcd want to add -D_BSD_SOURCE to cflags on 
linux*, so I tried to change it, and voila, the code compiled.

Regards, Bernd
