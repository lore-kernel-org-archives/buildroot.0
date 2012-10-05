From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Oct 2012 07:26:13 +0200
Subject: [Buildroot] Building FFMPEG fails
In-Reply-To: <B8BCA720FEFB473BBD1EACE9016F23C5@JohanW7> (Sagaert Johan's
 message of "Fri, 5 Oct 2012 00:53:45 +0200")
References: <B8BCA720FEFB473BBD1EACE9016F23C5@JohanW7>
Message-ID: <87fw5tzdze.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> context  latest git pull target A8 (imx53 )
 
 Sagaert> Does this have someting to do with the selected Thread library (NTPL now)

I don't think so. We default to NTPL and I have recently built ffmpeg
without any problems (and so have the autobuilders).

 Sagaert> ...
 Sagaert> ...
 Sagaert> CC	libavformat/vocdec.o
 Sagaert> libavformat/udp.c:41:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c:71:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c:324:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c: In function 'udp_open':
 Sagaert> libavformat/udp.c:529:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c:555:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c: In function 'udp_read':
 Sagaert> libavformat/udp.c:574:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> libavformat/udp.c: In function 'udp_close':
 Sagaert> libavformat/udp.c:655:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> CC	libavformat/vocenc.o
 Sagaert> CC	libavformat/vorbiscomment.o
 Sagaert> CC	libavformat/vqf.o
 Sagaert> CC	libavformat/wav.o
 Sagaert> CC	libavformat/wc3movie.o
 Sagaert> CC	libavformat/westwood_aud.o
 Sagaert> CC	libavformat/westwood_vqa.o
 Sagaert> CC	libavformat/wtv.o
 Sagaert> CC	libavformat/wtvdec.o
 Sagaert> CC	libavformat/wtvenc.o
 Sagaert> CC	libavformat/wv.o
 Sagaert> CC	libavformat/xa.o
 Sagaert> CC	libavformat/xmv.o
 Sagaert> CC	libavformat/xwma.o
 Sagaert> CC	libavformat/yop.o
 Sagaert> CC	libavformat/yuv4mpeg.o
 Sagaert> AR	libavformat/libavformat.a
 Sagaert> make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
 Sagaert> make[1]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1'
 Sagaert> make: *** [/home/buildroot12git/output/build/mplayer-1.1/.stamp_built] Error 2

So this is mplayer('s internal ffmpeg) failing, not the ffmpeg
package. You haven't pasted enough output to actually show an error, so
It's hard to say what the problem is.

Please provide more info (error, buildroot config, ..)

-- 
Bye, Peter Korsgaard
