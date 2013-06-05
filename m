From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jun 2013 00:00:09 +0200
Subject: [Buildroot] [PATCH] p11-kit: fix argp_standalone build error
In-Reply-To: <1370456263-17708-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 5 Jun 2013 15:17:43 -0300")
References: <1370456263-17708-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gi8b4ly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When BR2_PACKAGE_ARGP_STANDALONE is enabled and built before p11-kit the
 Gustavo> configure script detects it and a conflict arises because libc already
 Gustavo> includes and defines program_invocation_short_name.
 Gustavo> Avoid this by forcing the detection to true otherwise the configure
 Gustavo> script tries to use argp-standalone and it clashes with libc. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/a39/a39fe81a356b922a891d4225a56ce2427ab5bca7/

Hmm, still doesn't seem to work:

http://autobuild.buildroot.net/results/cc8/cc861f5a034a0922a90fb6f22835a1fe8205d497/build-end.log

-- 
Bye, Peter Korsgaard
