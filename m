From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 31 Oct 2008 14:03:55 -0400
Subject: [Buildroot] my first patch !
In-Reply-To: <20081031171037.GF27517@mx.loc>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAIMsuCDiF8RCojvQ+E2NNJQBAAAAAA==@cimeq.qc.ca>
	<20081031171037.GF27517@mx.loc>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAPwkCc3TmKtGu5F8XdCF1qkBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mmm,

I have replaced my old files by the one in you git. Now I get this:


(cd /buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/net-snmp-5.4.1; rm -f
config.cache; \
                ac_cv_NETSNMP_CAN_USE_SYSCTL=yes \
                 \
                 \
 
--with-cc=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/
bin/avr32-linux-uclibc-gcc \
 
--with-linkcc=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/
usr/bin/avr32-linux-uclibc-gcc \
 
--with-ar=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/
bin/avr32-linux-uclibc-ar \
                --with-cflags="-Os
-I/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/include
-I/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/include
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" \
 
--with-ldflags="-L/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_
dir/lib
-L/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/lib" \
                --with-endianness=big \
                --with-persistent-directory=/var/lib/snmp \
                --enable-ucd-snmp-compatibility \
                --enable-shared \
                --disable-static \
                --with-logfile=none \
                --without-rpm \
 
--with-openssl=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir
/usr/include/openssl \
                --disable-manuals \
                --disable-embedded-perl --disable-perl-cc-checks
--without-perl-modules \
                --without-dmalloc \
                --without-efence \
                --without-rsaref \
                --with-sys-contact="root" \
                --with-sys-location="Unknown" \
                --with-mib-modules="host smux ucd-snmp/dlmod" \
                --with-out-transports=" IPX" \
                --with-defaults \
                --disable-debugging \
                --prefix=/usr \
                --sysconfdir=/etc \
                --enable-mini-agent \
                --without-kmem-usage \
                 \
        )
/bin/bash: line 1:
--with-cc=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/
bin/avr32-linux-uclibc-gcc: No such file or directory
make: ***
[/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/net-snmp-5.4.1/.configure
d] Error 127

if I do
=/buildroot/buildroot-avr32-v2.2.0-rc6/build_avr32/staging_dir/usr/bin/avr32
-linux-uclibc-gcc

I have the no input file message. So the avr32-linux-uclibc-gcc is there.

Jonathan


-----Message d'origine-----
De?: Bernhard Reutner-Fischer [mailto:rep.dot.nop at gmail.com] 
Envoy??: 31 octobre 2008 13:11
??: Jonathan Dumaresq
Cc?: buildroot at uclibc.org
Objet?: Re: [Buildroot] my first patch !

On Fri, Oct 31, 2008 at 11:05:58AM -0400, Jonathan Dumaresq wrote:
>Hi all,
>
>I have a small patch for net-snmp to add the avr32 build to the machine
>availability. 
>
>This is the first patch that I make. So if I need to modify the way of
doing
>it, please let me know. 

Hi and welcome.
The gnuconfig stuff is handled a bit differently, see CONFIG_UPDATE

To spare you sime time, svn carries a way outdated netsnmp package, let
me point you to
http://repo.or.cz/w/buildroot.git?a=tree;f=package/netsnmp;hb=HEAD
respectively it's history.

HTH,
>
>Index: net-snmp-5.1.2/config.sub
>===================================================================
>--- net-snmp-5.1.2.orig/config.sub      2008-10-31 10:26:47.000000000 -0400
>+++ net-snmp-5.1.2/config.sub   2008-10-31 10:28:27.000000000 -0400
>@@ -228,7 +228,7 @@
>        | a29k \
>        | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
>        | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
>alpha64pca5[67] \
>-       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
avr
>\
>+       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
avr
>| avr32 \
>        | clipper \
>        | d10v | d30v | dlx | dsp16xx \
>        | fr30 | frv \
>
>Jonathan

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
