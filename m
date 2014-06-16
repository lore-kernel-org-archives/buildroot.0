From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jun 2014 09:24:22 +0200
Subject: [Buildroot] [git commit] hdparm: prevent package makefile from
	stripping the hdparm binary
In-Reply-To: <539E822C.5040708@mind.be> (Arnout Vandecappelle's message of
 "Mon, 16 Jun 2014 07:35:40 +0200")
References: <20140611210500.36A4A9CFCA@busybox.osuosl.org>
 <539E822C.5040708@mind.be>
Message-ID: <87d2e9co61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06/11/14 23:03, Peter Korsgaard wrote:

 >> +++ b/package/hdparm/hdparm.mk
 >> @@ -12,7 +12,8 @@ HDPARM_LICENSE_FILES = LICENSE.TXT
 >> define HDPARM_BUILD_CMDS
 >> $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 >> CFLAGS="$(TARGET_CFLAGS)" \
 >> -		LDFLAGS="$(TARGET_LDFLAGS)"
 >> +		LDFLAGS="$(TARGET_LDFLAGS)" \
 >> +		STRIP=/bin/true

 >  Perhaps for consistency we should rename $(TARGET_CROSS)strip to
 > $(TARGET_CROSS)real-strip and symlink $(TARGET_CROSS)strip to /bin/true?

Most of these packages presumably default to 'strip' and not
'$(TARGET_CROSS)strip', so it won't help much.

 >  While looking at this, I also notice that in some cases we _do_ pass the real
 > strip, e.g. in fltk, qt (but not qt5). I guess that's historical accident?

I would think so. For fltk atleast it dates back from 2008. I'll take a
look at fixing it up, thanks.

-- 
Bye, Peter Korsgaard 
