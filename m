From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2013 10:19:45 +0100
Subject: [Buildroot] [PATCH] util-linux: Add config switches for some
	more binaries
In-Reply-To: <8738lnjhx4.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 20 Dec 2013 23:07:03 +0100")
References: <1387242735-4670-1-git-send-email-paul@crapouillou.net>
 <8738lnjhx4.fsf@dell.be.48ers.dk>
Message-ID: <87y53dfdji.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:
 >> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>

 > Committed, thanks.

Hmm, we have a number of autobuild failures because of missing libpam:

http://autobuild.buildroot.net/results/df5/df5a4929e5039722d9c1fe1265bbd4f7593c4264/build-end.log

Looking closer, I also see some overlap between the existing "login
utilities" and your patch - E.G. you've added LAST as a seperate option,
but it never does anything as "login utilities" adds an
enable/disable-last afterwards.

I don't have a problem with splitting up login utilities if there's a
need, but then we should imho do it for everything enabled by it (and
add proper Config.in.legacy handling).

Care to take a look and send a patch? Thanks.

-- 
Bye, Peter Korsgaard
