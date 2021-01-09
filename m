From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Jan 2021 16:08:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: set
 OPENVPN_CPE_ID_VENDOR
In-Reply-To: <20210108175300.537545-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Jan 2021 18:53:00 +0100")
References: <20210108175300.537545-1-fontaine.fabrice@gmail.com>
Message-ID: <874kjqxi53.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/openvpn/openvpn.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
 > index 53f332534d..913235679a 100644
 > --- a/package/openvpn/openvpn.mk
 > +++ b/package/openvpn/openvpn.mk
 > @@ -10,6 +10,7 @@ OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 >  OPENVPN_DEPENDENCIES = host-pkgconf
 >  OPENVPN_LICENSE = GPL-2.0
 >  OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 > +OPENVPN_CPE_ID_VENDOR = $(OPENVPN_NAME)

I am not sure why we do this obfuscation with the _NAME variable instead
of just "openvpn" -  But ok, a bunch of other packages do so as well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
