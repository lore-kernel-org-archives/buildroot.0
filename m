From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 10:37:48 +0100
Subject: [Buildroot] [PATCH] sdl: fix autoreconf timing issue
In-Reply-To: <1392109955-742-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 11 Feb 2014 10:12:35 +0100")
References: <1392109955-742-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <874n46vvkj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Context:
 > The autobuilders were failing on the symbol _XData32 being in conflicts.
 > A patch had been added to SDL to add a check to the configure.in

 > Problem:
 > Sometimes, the build would fail, because of an _XData32 symbol being in
 > conflicts eventhrough the patch was here.

 > What was happening:
 > Following the classic buildroot workflow:
 >    - Extract
 >    - [...]
 >    - Apply 001 patch, which touches configure.in AND configure
 >    - Apply 002 patch, which touches configure.in
 >    - Invoke autogen.sh
 >    - [...]

 > Right before running autogen.sh, we have configure.in which is more
 > recent than configure, which is fine.
 > We then, execute autogen.sh which, basically, runs autoconf.

 > If your machine was lighty loaded, the time difference between
 > configure.in and configure was really tiny (ms order), which seems to be
 > neglected by autoconf.
 > The results was that the configure was *NOT* generated. And our second
 > patch was taken into account.

NOT taken.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
