From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 1 Dec 2018 23:30:21 +0100
Subject: [Buildroot] [PATCH 1/1] quagga: fix static build with musl
In-Reply-To: <20181201231905.0bc5820e@windsurf.home>
References: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
 <20181201231905.0bc5820e@windsurf.home>
Message-ID: <CAPi7W83q=2kP3-bvKKvxM7W2QaR6Ud4qiS_O7LmyTOD_M10Thw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Le sam. 1 d?c. 2018 ? 23:19, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  1 Dec 2018 22:59:53 +0100, Fabrice Fontaine wrote:
>
> > ++AC_ARG_ENABLE(embedded-getopt,
> > ++    AS_HELP_STRING([--disable-embedded-getopt], [disable embedded getopt functions]))
>
> Instead of another --enable option, what about auto-detecting if the C
> library provides getopt() ?
>
> Isn't AC_CHECK_FUNC([getopt]) sufficient ?
This was also my first idea but then I saw this comment in their source code:

"The operating system may or may not provide getopt_long(), and if
so it may or may not be a version we are willing to use. Our
strategy is to declare getopt here, and then provide code unless
the supplied version is adequate. The difficult case is when a
declaration for getopt is provided, as our declaration must match.

XXX Arguably this version should be named differently, and the
local names defined to refer to the system version when we choose
to use the system version."

On the other side, this code is very old so I'll just ask for their
feedback by filling a bug on their bugzilla, perhaps we could just
remove all this code.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
