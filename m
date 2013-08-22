From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 22 Aug 2013 10:26:39 +0800
Subject: [Buildroot] locale supports in buildroot (segment fault)
Message-ID: <20130822022639.GA6009@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to build locale support for my local langauge. Then I enabled
BR2_GENERATE_LOCALE="en_US zh_CN zh_CN.gbk".  In the progress of
building (after post-build script), it begins to report errors:

Generating locale en_US.en_US
character map file `en_US' not found: No such file or directory
/bin/sh: line 1:  7006 Segmentation fault
I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
/home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
--prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
"LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
${locale}
Generating locale zh_CN.zh_CN
character map file `zh_CN' not found: No such file or directory
/bin/sh: line 1:  7041 Segmentation fault
I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
/home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
--prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
"LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
${locale}
Generating locale zh_CN.gbk
character map file `gbk' not found: No such file or directory
/bin/sh: line 1:  7074 Segmentation fault
I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
/home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
--prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
"LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
${locale}


How should I dod it correct?  Thanks.


-- 
I can't go back to yesterday - because I was a different person then
