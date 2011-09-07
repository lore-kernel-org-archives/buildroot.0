From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Sep 2011 21:48:27 +0200
Subject: [Buildroot] [PATCH 1/3] new package: gssdp
In-Reply-To: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 10 Aug 2011 10:41:05 +0200")
References: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87mxegjfqs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> GSSDP implements resource discovery and announcement over SSDP.

Thanks, but it doesn't build on uClibc with default configs:

gssdp-client.c:45:21: error: ifaddrs.h: No such file or directory

ifaddrs.h is only provided if CONFIG_SUPPORT_AI_ADDRCONFIG is enabled,
which it isn't by default. We'll probably need to add something like
BR2_USE_WCHAR, but I'll do a test build to see what the performance
impact is.

-- 
Bye, Peter Korsgaard
