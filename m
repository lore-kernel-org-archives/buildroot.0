From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Sep 2012 22:12:48 +0200
Subject: [Buildroot] [PATCH] cjson: bug fix - use -fPIC instead of -fpic
In-Reply-To: <1346119086-3465-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 27 Aug 2012 21:58:06 -0400")
References: <1346119086-3465-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <878vcm52rj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> This change is to fix the autobuild failure at:
 Danomi> http://autobuild.buildroot.net/results/45e2c08d5e3c868b2d7fdf26a7c5f88de5ff8f61/build-end.log
 Danomi> I can't actually reproduce this bug, because my machine cannot
 Danomi> run the 64-bit microblaze toolchain.  However, the log makes
 Danomi> it clear that -fPIC is needed, and grepping for fPIC and fpic
 Danomi> under packages makes it clear that cjson should have used -fPIC
 Danomi> anyway.  So even if the bug isn't fixed, it must surely be improved.

Sounds similar to the recent libpcap fix. Committed, thanks.

-- 
Bye, Peter Korsgaard
