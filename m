From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 11 Jun 2015 09:37:17 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <5578B394.1010503@mind.be>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be>
Message-ID: <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2015-06-11 00:00, Arnout Vandecappelle a ?crit?:
>  The reason to export is, is to pass it to sub-makes that make use of 
> the same
> mechanism, e.g. the kernel.
> 
>  However, there's something to be said for exporting it only if V=1.

Is it OK to export it when defined? i.e.:

ifndef VERBOSE
   export VERBOSE = 1
endif

This is the local fix I'm using.


>> NB: All other variables in that list seems to always be not empty.

Replying to myself: No, most of them are also exported empty, but it is 
alright. Only VERBOSE will have a special meaning when defined empty.


>  The thing is, the working of CMAKE_NO_VERBOSE is not intuitive either 
> (because
> it can still be combined with VERBOSE=1).

The different kinds of verbose modes seem to be neither intuitive nor 
documented...


Thank you,

-- 
C?dric
