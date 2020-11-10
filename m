From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 09:54:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 dvbsubenc needs gcc 4.9
In-Reply-To: <20201109213856.610071-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 Nov 2020 22:38:56 +0100")
References: <20201109213856.610071-1-fontaine.fabrice@gmail.com>
Message-ID: <87imadpp61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > dvbsubenc fails to build with gcc 4.8 due to restrict keyword and for
 > loop declarations:

 > ../gst/dvbsubenc/libimagequant/blur.c:10:46: error: expected ';', ',' or ')' before 'src'
 >  transposing_1d_blur (unsigned char *restrict src, unsigned char *restrict dst,
 >                                               ^
 > ../gst/dvbsubenc/libimagequant/blur.c: In function 'liq_min3':
 > ../gst/dvbsubenc/libimagequant/blur.c:101:5: error: 'for' loop initial declarations are only allowed in C99 mode
 >      for (unsigned int i = 0; i < width - 1; i++) {
 >      ^

I have instead pushed a commit to pass -std=c99 in CFLAGS. The festival
plugin also had issues with this toolchain because of the old glibc
version, so I pushed another commit to fix that as well.

-- 
Bye, Peter Korsgaard
