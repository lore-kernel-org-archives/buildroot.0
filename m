From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jan 2012 20:27:20 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <201201161845.51186.arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 16 Jan 2012 18:45:50 +0100")
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <1326726276-8442-2-git-send-email-yegorslists@googlemail.com>
 <201201161845.51186.arnout@mind.be>
Message-ID: <8739bfcusn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Monday 16 January 2012 16:04:36 yegorslists at googlemail.com wrote:
 >> diff --git a/package/kmod/Config.in b/package/kmod/Config.in
 >> new file mode 100644
 >> index 0000000..f83237e
 >> --- /dev/null
 >> +++ b/package/kmod/Config.in
 >> @@ -0,0 +1,7 @@
 >> +config BR2_PACKAGE_KMOD
 >> +	bool "kmod"
 >> +	help
 >> +	  handle kernel modules
 >> +
 >> +	  http://git.profusion.mobi/cgit.cgi/kmod.git/

 Arnout>  It would be nice if there was a config option to disable installing
 Arnout> the tools, in case you want to use it as a library (which is probably
 Arnout> the primary intention).

True. /usr/bin/kmod is 88k, so not huge - But ok.

 Arnout>  That option should set
 Arnout> KMOD_INSTALL_STAGING = NO

Why would you not install into staging?

 Arnout> KMOD_CONF_OPT += --disable-tools

-- 
Bye, Peter Korsgaard
