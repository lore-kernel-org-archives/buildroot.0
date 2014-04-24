From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Apr 2014 07:29:11 +0300
Subject: [Buildroot] About static linking
In-Reply-To: <20140423225243.38a542c0@skate>
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
 <20140423225243.38a542c0@skate>
Message-ID: <20140424042911.GD22908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 23, 2014 at 10:52:43PM +0200, Thomas Petazzoni wrote:
> On Wed, 23 Apr 2014 22:59:59 +0300, Baruch Siach wrote:
> > +DHCPDUMP_LIBS = -lpcap
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
> > +endif
> 
> This is not at all against your patch specifically, but I'm a bit
> worried about all the static linking related kludges we add all over
> the place. Is this normal? Shouldn't we fix the packages themselves and
> submit patches upstream?

Upstream submission is of course preferable. In this case upstream does not 
appear to be very active. The current release is from 2008, while development 
started at 2007.

Do you prefer a Makefile patch that could theoretically be upstreamed?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
