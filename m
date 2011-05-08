From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 May 2011 21:59:49 +0200
Subject: [Buildroot] [PATCH 1/1] external-toolchain: fix support
In-Reply-To: <c066155381297965b19106d4cd05524af58c771c.1304873537.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 8 May 2011 18:52:27 +0200")
References: <cover.1304873537.git.thomas.petazzoni@free-electrons.com>
	<cover.1304873537.git.thomas.petazzoni@free-electrons.com>
	<c066155381297965b19106d4cd05524af58c771c.1304873537.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcxlj74a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The recent commit adding the external toolchain wrapper has broken the
 Thomas> support for external toolchain. The check_arm_eabi, check_cplusplus
 Thomas> and check_cross_compiler_exists functions were using TARGET_CC, which
 Thomas> points to the toolchain wrapper, but at the moment those functions are
 Thomas> called, the wrapper hasn't been generated yet.

 Thomas> We fix this by passing to these functions the path to the C or C++
 Thomas> compiler they should use for their tests.

Thanks, committed. I don't quite know how I could have forgotten about
them in the commit. I do remember looking them over when I fixed the
ones in ext-tool.mk.

The commit would have been a bit smaller if we simply replaced TARGET_CC
with TOOLCHAIN_EXTERNAL_CC (and same for C++) as we only use these
macros from ex-tool.mk anyway, but ok.

-- 
Bye, Peter Korsgaard
