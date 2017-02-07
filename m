From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 14:42:42 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "tslib: needs kernel headers
	3.12"
In-Reply-To: <1486466728-24435-2-git-send-email-martin.kepplinger@ginzinger.com>
 (Martin Kepplinger's message of "Tue, 7 Feb 2017 12:25:28 +0100")
References: <20170207101458.c5uhhasch73sihfx@tarshish>
 <1486466728-24435-1-git-send-email-martin.kepplinger@ginzinger.com>
 <1486466728-24435-2-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <87o9yerub1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > This reverts commit 7c60211ce38273580f1f8bf5886771406f9899ca.
 > tslib-1.4 removes this dependency.

I did a quick test build with the following config (3.5.4 headers):

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_TSLIB=y

input-raw.c: In function 'ts_input_read_mt':
input-raw.c:520:11: error: 'ABS_MT_TOOL_X' undeclared (first use in this function)
input-raw.c:520:11: note: each undeclared identifier is reported only once for each function it appears in
input-raw.c:525:11: error: 'ABS_MT_TOOL_Y' undeclared (first use in this function)
Makefile:825: recipe for target 'input-raw.lo' failed
make[4]: *** [input-raw.lo] Error 1
make[4]: *** Waiting for unfinished jobs....

So it seems like this still isn't fixed.

-- 
Bye, Peter Korsgaard
