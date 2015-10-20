From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 21:32:57 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <20151020205728.6f2d2332@gmx.net> (Peter Seiderer's message of
 "Tue, 20 Oct 2015 20:57:28 +0200")
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 <20151020205728.6f2d2332@gmx.net>
Message-ID: <877fmhl4ie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> SYSLOG_NG_CONF_OPTS += --disable-smtp
 >> endif

 > The buildroot package libestmp provides a libesmtp-config script, but
 > it is installed into

 > 	host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/libesmtp-config

 > where it is not found by the syslog-ng configure script... 

Yes, $(STAGING_DIR)/usr/bin, similar to the other *-config scripts.

 > Would a more portable solution be to add this search path (or fix the install
 > location of libestmp-config) for the syslog-ng configure call (libesmtp-config
 > --libs gives '-pthread -L[...]/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
 > -lesmtp -lssl -lcrypto -ldl')?

$(STAGING_DIR)/usr/bin contains binaries for the target (and *-config
scripts), so it shouldn't be added to the path, but another approach is
indeed to fix the configure script to look elsewhere for the script,
similar to how a bunch of packages allow the path to sdl-config to be
overridden through the SDL_CONFIG environment variable.

-- 
Bye, Peter Korsgaard
