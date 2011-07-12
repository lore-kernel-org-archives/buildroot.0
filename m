From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jul 2011 22:31:55 +0200
Subject: [Buildroot] ccache valgrind build errors / disabling ccache per
	package
In-Reply-To: <BANLkTikkDg9tiZZs5OdNHoD0jw7hUK4_BQ@mail.gmail.com> (Mike
 Williams's message of "Fri, 27 May 2011 10:36:07 -0400")
References: <BANLkTikkDg9tiZZs5OdNHoD0jw7hUK4_BQ@mail.gmail.com>
Message-ID: <87sjqbgs04.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:

 Mike> All,
 Mike> I'm working on updating the valgrind package based on a couple of
 Mike> other patches floating around. However, I get the following error when
 Mike> compiling:

 Mike> /opt/buildroot/buildroot-git/output/host/usr/bin/ccache: invalid option -- t

 Mike> Manually editing the Makefiles to remove ccache usage results in the
 Mike> compile succeeding. Googling has not revealed an obvious solution to
 Mike> this problem. Any advice?

probably something isn't quoting TARGET_CC correctly. With ccache
TARGET_CC is "ccache cross-gcc".

Notice that I yesterday merged a patch from Thomas to update valgrind.

 Mike> As a side question, is there a flag for disabling ccache per package?

No, and I would rather fix problems if any rather than adding such a
workaround.


-- 
Bye, Peter Korsgaard
