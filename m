From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 16:20:15 +0200
Subject: [Buildroot] [PATCH] boost: fix build on 64-bit target after
	bump to 1.54.0
In-Reply-To: <1381938598-19420-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 16 Oct 2013 17:49:58 +0200")
References: <1381938598-19420-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <878uxlcrq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Fixes compilation error with aarch64 target:
 > ./boost/atomic/atomic.hpp: At global scope:
 > ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in this scope
 >  typedef atomic<uintptr_t> atomic_uintptr_t;
 >                 ^
 > ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
 >  typedef atomic<uintptr_t> atomic_uintptr_t;
 >                          ^
 > ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before ';' token
 >  typedef atomic<uintptr_t> atomic_uintptr_t;
 >                                            ^

 > Fixes http://autobuild.buildroot.net/results/0b69d7b33dc16ea27e395a949cefbd0a35c92f61/

 > Reported here: https://svn.boost.org/trac/boost/ticket/8973
 > Fix reported here: https://svn.boost.org/trac/boost/ticket/8731

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Backported-from: https://svn.boost.org/trac/boost/changeset/84950

Committed, thanks.

-- 
Bye, Peter Korsgaard
