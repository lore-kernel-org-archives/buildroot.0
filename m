From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 21:16:17 +0100
Subject: [Buildroot] [PATCH 2/3] infozip: fix cross-compilation issues
In-Reply-To: <CAAHaz6Gu=hK8VaLx8fBxZ6i1X533bPgU_Sp0gWzJO8LBpbRaSw@mail.gmail.com>
 (Alexander Lukichev's message of "Sun, 2 Feb 2014 20:40:24 +0200")
References: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
 <CAAHaz6Gu=hK8VaLx8fBxZ6i1X533bPgU_Sp0gWzJO8LBpbRaSw@mail.gmail.com>
Message-ID: <87ob2pp8xa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > Hello Naour, all,
 > 2014-01-31 Romain Naour <romain.naour@openwide.fr>:
 > (...)

 >     +Signed-off-by: Romain Naour <romain.naour@openwide.fr>

 > (...)

 >     +-CFLAGS = -O2 $(CFLAGS_NOOPT)
 >     ++CFLAGS ?= -02 $(CFLAGS_NOOPT)


 > Excuse me, is it -02 that's meant here?

Good catch. Actually in the context of Buildroot we don't want the
package to hardcode the optimization level, so I will simply drop it.

-- 
Bye, Peter Korsgaard
