From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:01:23 +0100
Subject: [Buildroot] [PATCH 2/3] infozip: fix cross-compilation issues
In-Reply-To: <52EF60BC.4040600@gmail.com> (Alexander Lukichev's message of
 "Mon, 03 Feb 2014 11:26:20 +0200")
References: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
 <CAAHaz6Gu=hK8VaLx8fBxZ6i1X533bPgU_Sp0gWzJO8LBpbRaSw@mail.gmail.com>
 <87ob2pp8xa.fsf@dell.be.48ers.dk> <52EF60BC.4040600@gmail.com>
Message-ID: <877g9bmeu4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > Hi Peter, Romain, all,
 > On 02/02/2014 10:16 PM, Peter Korsgaard wrote:
 >>>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:
 >> >     +-CFLAGS = -O2 $(CFLAGS_NOOPT)
 >> >     ++CFLAGS ?= -02 $(CFLAGS_NOOPT)
 >> > Excuse me, is it -02 that's meant here?
 >> Good catch. Actually in the context of Buildroot we don't want the
 >> package to hardcode the optimization level, so I will simply drop it.

 > Just out of curiosity, I have not seen an -0<N> gcc optimization
 > flag (as opposed to -O<N>, zero vs. a big O). Is it somewhere on
 > gcc manual?

No, I believe the 0 vs O was just a typo.

-- 
Bye, Peter Korsgaard
