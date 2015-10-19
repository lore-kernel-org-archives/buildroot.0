From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 00:21:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] ntp: add ntptime option
In-Reply-To: <1444866333-4256-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Wed, 14 Oct 2015 19:45:33 -0400")
References: <1444866333-4256-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87wpui1ov8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > Allow the `ntptime` utility to be included on a target.
 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > ---
 > Changes v1 -> v2:
 >   - In order to support C libraries other than glibc, a change has been
 >      made to NTP's autoconf (and the introduction of `NTP_AUTORECONF` to
 >      the package). The `ntptime` utility requires ntp system calls to
 >      build. The NTP code already supports falling back to inline calls
 >      which make use of the `adjtimex` method (supported by uClibc and
 >      musl; see 'include/sys/timex.h'). This adjustment flags the
 >      configuration that ntp system calls are supported when `adjtimex`
 >      or `__adjtimex` are defined (issue brought up by Thomas Petazzoni
 >      when the initial ntptime support patch failed to build). For more
 >      information, see:
 >       https://bugs.ntp.org/show_bug.cgi?id=769
 > ---
 > +++ b/package/ntp/ntp.mk
 > @@ -17,6 +17,7 @@ NTP_CONF_OPTS = \
 >  	--disable-tickadj \
 >  	--with-yielding-select=yes \
 >  	--disable-local-libevent
 > +NTP_AUTORECONF = YES

We normally add a comment above the AUTORECONF line explaining why it is
needed - Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
