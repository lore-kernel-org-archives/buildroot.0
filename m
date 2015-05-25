From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:03:49 +0200
Subject: [Buildroot] [PATCH] package/php: fix build without threads and
	pcre
In-Reply-To: <1432385876-13578-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 23 May 2015 14:57:56 +0200")
References: <1432385876-13578-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mw0szaoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The pcre library bundled in php is not configurable through the usual
 > --enable/disable options, but wants to be thread-safe by default, so it
 > wants to use pthreads (uncludes pthread.h and uses pthread_* functions).

 > So, just override the default configuration to explicitly require the
 > bundled pcre library be single-threaded when we have no thread and are
 > not using the external pcre library.

 > Fixes:
 >     http://autobuild.buildroot.org/results/f50/f50f4e569466ad74e49a3eac9ea2e6cfc4dd30e3/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Floris Bos <bos@je-eigen-domein.nl>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
