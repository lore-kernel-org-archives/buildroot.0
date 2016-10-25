From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 19:52:43 +0200
Subject: [Buildroot] [PATCH] rsyslog: not available on musl
In-Reply-To: <1477410539-13478-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Tue, 25 Oct 2016 21:18:59 +0530")
References: <1477410539-13478-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <87zilsjoyc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > With musl C library, we get following error when building rsyslog:
 >   imfile.c: In function 'in_setupFileWatchStatic':
 >   imfile.c:1614:28: error: 'GLOB_BRACE' undeclared (first use in this function)
 >         GLOB_MARK|GLOB_NOSORT|GLOB_BRACE, NULL, &files);
 >                               ^
 > flag GLOB_BRACE is not available on musl. Since package uses it
 > unconditionally, we mark it not available for musl.

 > Fixes:
 >   http://autobuild.buildroot.net/results/6d4/6d480bb1e1466809d8ff119f6b35bb91df00785c/

 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
