From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 11:10:57 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add config for enabling SMP
 for 3.x
In-Reply-To: <CAKfV1Cb9E2Aw6jGPSrb14s6AXST0BYu2O9TrcRWO1Ni-63rtFQ@mail.gmail.com>
References: <20170406234657.31813-1-sikor6@gmail.com>
 <16e3dbf6-416b-6e7a-8e69-143fafad4bba@mind.be>
 <CAKfV1Cb9E2Aw6jGPSrb14s6AXST0BYu2O9TrcRWO1Ni-63rtFQ@mail.gmail.com>
Message-ID: <082176d6-afb1-a98b-aa97-9bdbee2d1c7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 01:07, Pawel Sikora wrote:
> Hi,
> 
> 2017-04-07 13:22 GMT+02:00 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>>:
> 
> 
> 
>     On 07-04-17 01:46, Pawel Sikora wrote:
[snip]
>     > +ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
>     > +XENOMAI_CONF_OPTS += --enable-smp
> 
>      Can you add an explicit --disable-smp in the else branch? Or does that not
>     work?
> 
> 
> On Xenomai 3 default it is disabled, so it will not make any difference, but for
> 2.x will.

 We want explicit options even if they are the default, because:

- it is possible that the default changes after a version bump, and that's hard
to notice;

- someone looking at the .mk file doesn't know what the default is, so it's good
to make it explicit.

 Regards,
 Arnout


> So ok, as it is a valid option I added it also.
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
