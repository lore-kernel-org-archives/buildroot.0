From: =?utf-8?Q?Peter_Katzmann?= <peter.katzmann@edag.de>
Date: Mon, 28 Nov 2011 18:08:16 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
 builds libs to lib64 dir
Message-ID: <zarafa.4ed3c000.2af5.444b2d795dbc1c99@jedmail.edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
i have a OpenSuse 12.1 64 Bit dev machine and building an armeb tree.
Now when tries to build mtd:
/usr2/new/Source-ast18/build_env/buildroot/project_build_armeb/host/usr/lib64/gcc/armeb-unknown-linux-uclibcgnueabi/4.6.2/../../../../armeb-unknown-linux-uclibcgnueabi/bin/ld: cannot find -llzo2
collect2: ld returned 1 exit status

The lzo lib was build but it seems that some libraries are under lib and some are under lib64 :
pet at linux-06u7:/usr2/new/Source-ast18/build_env/buildroot> file project_build_armeb/target/usr/lib/
libgomp.so        libgomp.so.1.0.0  libtiff.so.3      libz.a            libz.so.1         pkgconfig/        
libgomp.so.1      libtiff.so        libtiff.so.3.9.4  libz.so           libz.so.1.2.5     
pet at linux-06u7:/usr2/new/Source-ast18/build_env/buildroot> file project_build_armeb/target/usr/lib64/lib
libatomic_ops.a      libjpeg.a            libjpeg.so           libjpeg.so.8.3.0     liblzo2.la           liblzo2.so.2         
libatomic_ops_gpl.a  libjpeg.la           libjpeg.so.8         liblzo2.a            liblzo2.so           liblzo2.so.2.0.0     

But they are 32 bit arm builds.

peter

EDAG GmbH & Co.KG aA
Steinauer Stra?e 20 
36100 Petersberg
Tel.: +49 - (0)661 / 6000 - 9444
Fax: +49 - (0)661 / 6000 - 1116208
E-Mail: Peter.Katzmann at edag.de
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
