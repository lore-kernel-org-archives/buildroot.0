From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 19:30:31 +0100
Subject: [Buildroot] [PATCH 1/3] gst1-libav: fix build for xtensa
In-Reply-To: <a67ba774d66c31310b47f233cdc1d9970db094cf.1392128329.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 11 Feb 2014 16:25:20 +0200")
References: <cover.1392128329.git.baruch@tkos.co.il>
 <a67ba774d66c31310b47f233cdc1d9970db094cf.1392128329.git.baruch@tkos.co.il>
Message-ID: <878uthv6wo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > gst1-libav needs the same fix for xtensa like ffmpeg got in commit
 > 4ec35e76b8a3 (ffmpeg: fix build for xtensa).

 > Fixes:
 > http://autobuild.buildroot.net/results/33f/33fcbb79809719f68f3ee2cdb0fcacad82b9e0eb/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/gstreamer1/gst1-libav/gst1-libav.mk | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
 > index 1c45acc7377a..a498f9ca257d 100644
 > --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
 > +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
 > @@ -83,4 +83,12 @@ endif
 >  GST1_LIBAV_CONF_OPT = \
 >  	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
 
 > +GST1_LIBAV_CFLAGS = $(TARGET_CFLAGS)
 > +
 > +ifeq ($(BR2_xtensa),y)
 > +GST1_LIBAV_CFLAGS += -mtext-section-literals
 > +endif
 > +
 > +GST1_LIBAV_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"

Committed with this fixed to use GST1_LIBAV_CFLAGS, thanks.

-- 
Bye, Peter Korsgaard
