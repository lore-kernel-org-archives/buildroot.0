From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Apr 2014 00:01:49 +0200
Subject: [Buildroot] About static linking
In-Reply-To: <87tx9i21li.fsf@dell.be.48ers.dk>
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
 <20140423225243.38a542c0@skate> <87tx9i21li.fsf@dell.be.48ers.dk>
Message-ID: <535989CD.9090105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 17:23, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Baruch Siach,
>  > On Wed, 23 Apr 2014 22:59:59 +0300, Baruch Siach wrote:
> 
>  >> +DHCPDUMP_LIBS = -lpcap
>  >> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  >> +DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
>  >> +endif
> 
>  > This is not at all against your patch specifically, but I'm a bit
>  > worried about all the static linking related kludges we add all over
>  > the place. Is this normal? Shouldn't we fix the packages themselves and
>  > submit patches upstream?
> 
> It would certainly be nice to get these things handled upstream, but
> it's similar to the special-archs/nommu/uClibc stuff, E.G. not something
> "normal" people gets affected by (and something we have decided to
> support), so I don't think there's much else we can do.

 Still, I expect that upstreams are more likely to be willing to accept
patches for linking against a static library than patches for exotic
systems. Especially since the former is usually only a config patch,
while the special-archs/nommu/uClibc stuff is more likely to affect the
code itself.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
