From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 08:55:30 +0100
Subject: [Buildroot] [PATCH] package/mono: fix crosscompilation error on
 ppc64
In-Reply-To: <1517780708-1738-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Sun, 4 Feb 2018 22:45:08 +0100")
References: <1517780708-1738-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87zi3qdi8d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Mono for powerpc64 could not, at least at the moment, cross compile
 > for a powerpc architecture.

 > Fixes:
 > http://autobuild.buildroot.net/results/9713b9976c4aa3b9345609ef6fcdf663a994fb4d/

The failure is in building host-mono, so I'm not sure why you think the
target architecture would matter?

I have sent a patch to simply unconditionally only make mono available
if you are building on a x86/x86-64 host, similar to how we recently did
for erlang.

https://patchwork.ozlabs.org/patch/880358/

-- 
Bye, Peter Korsgaard
