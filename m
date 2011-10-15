From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 12:50:55 +0200
Subject: [Buildroot] [PATCH v5 1/3] New package: ImLib2
In-Reply-To: <1318584328-6080-2-git-send-email-yegorslists@googlemail.com>
References: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
 <1318584328-6080-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110151250.56914.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I tried your patch series and it didn't work :-(

 I have an ARCH=i386 config with the following options:
BR2_PACKAGE_IMLIB2=y
# BR2_PACKAGE_IMLIB2_JPEG is not set
BR2_PACKAGE_IMLIB2_PNG=y
# BR2_PACKAGE_IMLIB2_GIF is not set
# BR2_PACKAGE_IMLIB2_TIFF is not set
# BR2_PACKAGE_IMLIB2_FREETYPE is not set
# BR2_PACKAGE_IMLIB2_ID3 is not set
BR2_PACKAGE_IMLIB2_X=y

 Building imlib2 gives me:
api.c:30:22: error: ft2build.h: No such file or directory
api.c:31:10: error: #include expects "FILENAME" or <FILENAME>

api.c:31 is
#include FT_FREETYPE_H


 If I select BR2_PACKAGE_IMLIB2_FREETYPE it goes through without problem.
My guess is that the --without-freetype option doesn't really work.  So
I'd suggest to make the dependency on freetype a hard one and be done with it.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/2dd8e614/attachment.html>
