From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 May 2012 21:59:12 +0200
Subject: [Buildroot] [PATCH] mrouted: fix bcopy patch oops
In-Reply-To: <1336045609-29418-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 May 2012 08:46:49 -0300")
References: <1336045609-29418-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87aa1p11f3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The bcopy patch just changes bcopy for memmove which is
 Gustavo> incorrect since bcopy and memmove use reversed src and dest
 Gustavo> parameters between them.  Oops!

Oops indeed. Seems to have been introduced with the 3.9.4 bump.

Committed, thanks.

-- 
Bye, Peter Korsgaard
