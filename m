From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Feb 2018 18:55:24 +0100
Subject: [Buildroot] [PATCH next v2 0/5] New pkg-stats script,
 with version information
In-Reply-To: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
References: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
Message-ID: <bc56171d-08ad-6b1f-ac80-edc80e5a07db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-02-18 23:13, Thomas Petazzoni wrote:
>  - Pass BR2_HAVE_DOT_CONFIG=y when calling make, in order to fake
>    having a .config. This allows "printvars" to dump all variables
>    even without a .config.

 Perhaps it would make more sense to do this directly in the top-level Makefile:

# Some targets require the package information but don't really require a
# .config. Force BR2_HAVE_DOT_CONFIG=y for these so the packages get included.
ifneq ($(filter printvars,$(MAKECMDGOALS),)
BR2_HAVE_DOT_CONFIG = y
endif


 There are probably more targets in addition to printvars that could benefit
from this (though I can't immediately think of any).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
