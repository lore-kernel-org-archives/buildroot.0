From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 23:29:06 +0200
Subject: [Buildroot] [PATCH 1/4] trace-cmd: fix largefile build problem
In-Reply-To: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 30 Sep 2013 23:20:44 +0200")
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738oku1ct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The source files of trace-cmd already define _LARGEFILE64_SOURCE, but
 Thomas> Buildroot passes it again on the build command line through CFLAGS,
 Thomas> which causes a build error. We fix this by filtering out our
 Thomas> definition of _LARGEFILE64_SOURCE from the CFLAGS before passing them
 Thomas> to the trace-cmd Makefile.

 Thomas> Fixes the warning visible at:

 Thomas>  http://autobuild.buildroot.net/results/1c4567a230940a5287d03e2a5c2c7afbdc64cd36/build-end.log

It's just a warning, but ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
