From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 17:23:21 +0200
Subject: [Buildroot] About static linking
In-Reply-To: <20140423225243.38a542c0@skate> (Thomas Petazzoni's message of
 "Wed, 23 Apr 2014 22:52:43 +0200")
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
 <20140423225243.38a542c0@skate>
Message-ID: <87tx9i21li.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Baruch Siach,
 > On Wed, 23 Apr 2014 22:59:59 +0300, Baruch Siach wrote:

 >> +DHCPDUMP_LIBS = -lpcap
 >> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 >> +DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
 >> +endif

 > This is not at all against your patch specifically, but I'm a bit
 > worried about all the static linking related kludges we add all over
 > the place. Is this normal? Shouldn't we fix the packages themselves and
 > submit patches upstream?

It would certainly be nice to get these things handled upstream, but
it's similar to the special-archs/nommu/uClibc stuff, E.G. not something
"normal" people gets affected by (and something we have decided to
support), so I don't think there's much else we can do.

-- 
Bye, Peter Korsgaard
