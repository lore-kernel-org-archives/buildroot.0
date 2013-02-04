From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Feb 2013 23:35:34 +0100
Subject: [Buildroot] [PATCH] gdb: build gdbserver with TARGET_MAKE_ENV
In-Reply-To: <1359894622-4783-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Feb 2013 13:30:22 +0100")
References: <1359894622-4783-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871ucv3dxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit fixes the exact same problem than
 Thomas> 21a0c11a90f9ff19c78a5f32e0a2e9064fd28054, but for the gdbserver
 Thomas> build. The problem is that when you use the Crosstool-NG toolchain
 Thomas> backend, gawk gets built as a dependency of Crosstool-NG. So the gdb
 Thomas> configure scripts detects it, and assumes it is in the PATH (because
 Thomas> the gdb configure step gets run with TARGET_MAKE_ENV).

 Thomas> But then, the build fails, because it tries to run gawk, but gawk
 Thomas> isn't in the PATH, because we forget to use this TARGET_MAKE_ENV
 Thomas> variable when building gdbserver.

Committed, thanks.

-- 
Bye, Peter Korsgaard
