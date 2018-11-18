From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:43:30 +0100
Subject: [Buildroot] [PATCH 1/1] wireshark: fix static build with snappy
In-Reply-To: <20181113221424.6607-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 13 Nov 2018 23:14:24 +0100")
References: <20181113221424.6607-1-fontaine.fabrice@gmail.com>
Message-ID: <87wopamasd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9089e74c0f8428d28953ae037a84aa8a08db7ded

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/wireshark/wireshark.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
 > index 7c7dc784fe..4720960e59 100644
 > --- a/package/wireshark/wireshark.mk
 > +++ b/package/wireshark/wireshark.mk
 > @@ -138,6 +138,9 @@ endif
 >  ifeq ($(BR2_PACKAGE_SNAPPY),y)
 >  WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
 >  WIRESHARK_DEPENDENCIES += snappy
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +WIRESHARK_CONF_ENV += LIBS=-lstdc++

This isn't really nice, but as long as snappy doesn't provide a .pc file
I guess we cannot do much else. Committed, thanks.

-- 
Bye, Peter Korsgaard
