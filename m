From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 23:02:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/tzdata: install missing files
In-Reply-To: <3b142a58ad10114cbfa9c8ea271e644bb2efd8fb.1399219226.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 4 May 2014 18:01:27 +0200")
References: <cover.1399219226.git.yann.morin.1998@free.fr>
 <3b142a58ad10114cbfa9c8ea271e644bb2efd8fb.1399219226.git.yann.morin.1998@free.fr>
Message-ID: <87a9axjlzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Install two files:
 >   - zone.tab   : {country-code,coordinates,timezone} tuples
 >   - iso3166.tab: {country-code,country} tuples

 > Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/tzdata/tzdata.mk | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
 > index 05a82a2..411d424 100644
 > --- a/package/tzdata/tzdata.mk
 > +++ b/package/tzdata/tzdata.mk
 > @@ -37,7 +37,8 @@ define TZDATA_BUILD_CMDS
 >  endef
 
 >  define TZDATA_INSTALL_TARGET_CMDS
 > -	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
 > +	$(INSTALL) -D -m 0644 $(@D)/zone.tab $(TARGET_DIR)/usr/share/zoneinfo/zone.tab
 > +	$(INSTALL) -D -m 0644 $(@D)/iso3166.tab $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 >  	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo

It's imho nicer to just copy it together with the rest, so I've just
added $(@D)/*.tab to the above cp -a line and committed, thanks.

-- 
Bye, Peter Korsgaard
