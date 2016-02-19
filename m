From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2016 16:37:22 +0100
Subject: [Buildroot] [PATCH v1] fbterm: fix musl compile (missing
	string.h include)
In-Reply-To: <1455832018-17573-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 18 Feb 2016 22:46:58 +0100")
References: <1455832018-17573-1-git-send-email-ps.report@gmx.net>
Message-ID: <87twl4hft9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >   mouse.cpp: In function 's32 open_gpm(Gpm_Connect*)':
 >   mouse.cpp:58:37: error: 'memset' was not declared in this scope
 >     memset((s8 *)&addr, 0, sizeof(addr));
 >                                      ^
 >   mouse.cpp:60:64: error: 'strncpy' was not declared in this scope
 >     strncpy(addr.sun_path, GPM_NODE_CTL, sizeof(addr.sun_path) - 1);

 > in case BR2_PACKAGE_GPM is defined.

 > Add proper gpm dependency and configure option too.

 > [1] http://autobuild.buildroot.net/results/a60/a602d61e68f662217ad868de79711a8ea892a3a9

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
