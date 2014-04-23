From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 22:52:43 +0200
Subject: [Buildroot] About static linking
In-Reply-To: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
Message-ID: <20140423225243.38a542c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 23 Apr 2014 22:59:59 +0300, Baruch Siach wrote:

> +DHCPDUMP_LIBS = -lpcap
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
> +endif

This is not at all against your patch specifically, but I'm a bit
worried about all the static linking related kludges we add all over
the place. Is this normal? Shouldn't we fix the packages themselves and
submit patches upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
