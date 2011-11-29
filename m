From: =?utf-8?Q?Peter_Katzmann?= <peter.katzmann@edag.de>
Date: Tue, 29 Nov 2011 16:38:52 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
 builds libs to lib64 dir
Message-ID: <zarafa.4ed4fc8c.6718.529f03446f9d00b0@jedmail.edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
it seems that some configure scripts needs a little help to know where to place the library's.
The following small patch fixes the problem for me, but i don't know if it is a good idea for all platforms to insist that the libdir is /usr/lib .
peter

diff -urwb buildroot-2011.11-rc3/package/Makefile.autotools.in /usr2/new/Source-ast18/build_env/buildroot/package/Makefile.autotools.in
--- buildroot-2011.11-rc3/package/Makefile.autotools.in 2011-11-26 22:05:20.000000000 +0100
+++ /usr2/new/Source-ast18/build_env/buildroot/package/Makefile.autotools.in    2011-11-29 15:45:18.247834872 +0100
@@ -117,6 +117,7 @@
                --exec-prefix=/usr \
                --sysconfdir=/etc \
                --program-prefix="" \
+               --libdir=/usr/lib \
                $$(DISABLE_DOCUMENTATION) \
                $$(DISABLE_NLS) \
                $$(DISABLE_LARGEFILE) \
@@ -137,6 +138,7 @@
                ./configure \
                --prefix="$$(HOST_DIR)/usr" \
                --sysconfdir="$$(HOST_DIR)/etc" \
+               --libdir="$$(HOST_DIR)/usr/lib" \
                --enable-shared --disable-static \
                $$($$(PKG)_CONF_OPT) \
        )




-----Urspr?ngliche Nachricht-----
An:	Peter Katzmann <peter.katzmann@edag.de>; 
Von:	Trevor Woerner <twoerner@gmail.com>
Gesendet:	Di 29.11.2011 13:07
Betreff:	Re: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb builds libs to lib64 dir
> Hi Peter,
> 
> As an aside, I'm have an openSUSE 12.1 related build problem too (with
> crosstool-NG) which worked fine with openSUSE 11.4.
> 
> http://sourceware.org/ml/crossgcc/2011-11/msg00197.html
> 
> It's the same problem you're seeing: that which was put into a .../lib
> directory is now being put into a .../lib64 directory.
> 
> Best regards,
>     Trevor
> 
>
?Die n?chsten Messeauftritte der EDAG Group:
Business of Design Week in Hongkong vom 01.-03.12.2011 in der Inspiration Hall, Stand 3D-C09
Auto Expo in Neu Delhi vom 05.-11.01.2012
Internationaler Automobilsalon in Genf vom 06.-18.03.2012 in Halle 2, Stand 2158

The EDAG Group's next exhibitions: 
Business of Design Week in Hongkong, 1 to 3 December 2011 at Inspiration Hall, Stand 3D-C09
Auto Expo in Neu Delhi, 5 to 11 January 2012
International Motor Show in Geneva, 6 to 18 March 2012 at Stand 2158, Hall 2

Mehr News und Informationen aus der Welt der EDAG Group k?nnen Sie in unserem interaktiven EMAG-Magazin (http://www.edag.de/pr/Newsletter/) nachlesen! Wir freuen uns auf Ihren Besuch!

------------------------------------------------------------------------------
Court of jurisdiction: Amtsgericht Fulda, HRB 1075     USt.-Id: DE 112 402 594
Gesch?ftsf?hrung / Executive Board: J?rg Ohlsen: Gesch?ftsf?hrer / CEO, Manfred Hahl: Gesch?ftsf?hrer / COO, Rainer Bauer: Gesch?ftsf?hrer / CFO
Aufsichtsratsvorsitzender / Chairman of the Supervisory Board: Dr. Lutz Helmig
Pers?nlich haftende Gesellschafterin / General partner: EDAG Gesellschaft mbH, Wien, Handelsgericht Wien, FN 297836 W
Headquarters: EDAG GmbH & Co. KGaA, Reesbergstra?e 1, 36039 Fulda, Germany  /  www.edag.com

This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorised copying, disclosure or distribution of the material in this e-mail is strictly forbidden.
