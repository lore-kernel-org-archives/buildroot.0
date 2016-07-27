From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 15:06:31 +0200
Subject: [Buildroot] [PATCH v2] qt5imageformats: fix AArch64 compile
In-Reply-To: <1469558961-13147-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Tue, 26 Jul 2016 20:49:21 +0200")
References: <1469558961-13147-1-git-send-email-ps.report@gmx.net>
Message-ID: <87eg6fxmaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fix libwebp.pri arm64/neon detection using upstream patch [1].
 > Fixes bug reported by Uwe Hermann [2] and [3], [4], [5]:

 >   .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/dec.o: In function `VP8DspInit':
 >   dec.c:(.text+0x2b28): undefined reference to `VP8DspInitNEON'
 >   .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/enc.o: In function `VP8EncDspInit':
 >   enc.c:(.text+0x1970): undefined reference to `VP8EncDspInitNEON'
 >   ../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/lossless.o: In function `VP8LDspInit':
 >   lossless.c:(.text+0x2b18): undefined reference to `VP8LDspInitNEON'
 >   .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/upsampling.o: In function `WebPInitUpsamplers':
 >   upsampling.c:(.text+0x41e0): undefined reference to `WebPInitUpsamplersNEON'

 > [1] https://code.qt.io/cgit/qt/qtimageformats.git/patch/?id=e4c1d9ece74de212ebe5c55b134de7cb23469e2d
 > [2] https://bugs.busybox.net/show_bug.cgi?id=8986
 > [3] http://autobuild.buildroot.net/results/0e5/0e577a70bb88e2ba685ccde28576a6857c99876c
 > [4] http://autobuild.buildroot.net/results/c85/c85f0445151171548cf7c39999ef00d1638871e0
 > [5] http://autobuild.buildroot.net/results/ae7/ae74f93f09e61151553a54b9d3a6b19946e42938

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 --> v2:
 >   - use upstream patch (suggested by Thomas Petazzoni)

Committed, thanks.

-- 
Bye, Peter Korsgaard
