From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Nov 2009 09:26:40 +0200
Subject: [Buildroot] Building a usable ImageMagick
Message-ID: <20091104072640.GC10219@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

I'm trying to produce a working ImageMagick installation under Buildroot.  
According to my test ImageMagick depends on having *.la files in the 
/usr/lib/ImageMagick-6.4.8/modules-Q16/coders/ directory in order to find its 
codecs at run-time. Unfortunately, the target-finalize target in the main 
Makefile includes the following line:

find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f

which means that all *.la file get removed from the target. What is the best 
approach to solve this issue?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
