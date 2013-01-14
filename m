From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 14:02:10 +0100
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <CAKcgs2wLk-cOK7qUDJ23TidHSyESJF-vCoL+JezDSL2q0H1c0w@mail.gmail.com>
 (Gilles Talis's message of "Sun, 13 Jan 2013 16:47:50 -0800")
References: <1358036972-10406-1-git-send-email-gilles.talis@gmail.com>
 <20130113120500.0ad7be3a@skate>
 <CAKcgs2xk-=iG-3Ezmc1upEPBjhSGcmgg9WSwn=1E3+OKDT05fg@mail.gmail.com>
 <CAKcgs2wLk-cOK7qUDJ23TidHSyESJF-vCoL+JezDSL2q0H1c0w@mail.gmail.com>
Message-ID: <87ehhnudd9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> I forgot to copy mailing list.
 Gilles> Sorry about that and thanks for your help.
 Gilles> Gilles.

 Gilles> 2013/1/13 Gilles Talis <gilles.talis@gmail.com>

 Gilles>     Dear Thomas,

 Gilles>     I thought I knew Makefiles better than that. Well, I was wrong :-).
 Gilles>     The reason why TARGET_CONFIGURE_OPTS does not work in this case is because
 Gilles>     it overrides the original Makefile's CFLAGS variable (that should be kept
 Gilles>     in order for target to compile). Apart from adding "override" in the
 Gilles>     package Makefile, I actually do not see how to use TARGET_CONFIGURE_OPTS
 Gilles>     and still keep Makefile CFLAGS. Any hint?
 Gilles>     This will surely help me for future patches/projects.

That's indeed how it is normally done.

override CFLAGS += ..

-- 
Bye, Peter Korsgaard
