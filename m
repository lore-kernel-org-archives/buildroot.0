From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 23:05:37 +0100
Subject: [Buildroot] [PATCH 1/2] perf: Add support for Linux 3.13
In-Reply-To: <1390914640-18160-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Tue, 28 Jan 2014 14:10:40 +0100")
References: <1390914640-18160-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87r47lnpam.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 > The Makefile has been renamed to Makefile.perf; so now we check
 > both Makefiles to support 3.7 - 3.12 and 3.13 - beyond.

 > Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
 > ---
 >  package/perf/perf.mk |    2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/perf/perf.mk b/package/perf/perf.mk
 > index d7898d0..ffe18bc 100644
 > --- a/package/perf/perf.mk
 > +++ b/package/perf/perf.mk
 > @@ -35,7 +35,7 @@ define PERF_BUILD_CMDS
 >  		exit 1 ; \
 >  	fi
 >  	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
 > -		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
 > +		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile $(LINUX_DIR)/tools/perf/Makefile.perf ; then \

Hmm, does that really work? I would expect grep to error out when either
Makefile or Makefile.perf isn't available.

What about simply checking Makefile* instead?

-- 
Bye, Peter Korsgaard
