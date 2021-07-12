From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 22:46:36 +0200
Subject: [Buildroot] [PATCH 1/1] boot/grub2: workaround breakage with
 -O2, -O3 build
In-Reply-To: <20210625114251.1762419-1-andreas.hilse@googlemail.com> (Andreas
 Hilse via buildroot's message of "Fri,
 25 Jun 2021 13:42:51 +0200")
References: <20210625114251.1762419-1-andreas.hilse@googlemail.com>
Message-ID: <8735sjxntf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Hilse via buildroot <buildroot@busybox.net> writes:

 > When grub2 (i386-pc) is built with -O2 or -O3 it is unable to boot
 > and the system will reboot in a loop.

 > Tony Battersby has bisected [0] the error down to this security bugfix:
 > boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch
 > There is also a bug report by Peter Seiderer about this [1].

 > As discussed on the mailing list [2], this patch introduces a workaround
 > in the grub2.mk overriding the global optimization settings with -Os
 > which results in a booting system.

 > References:
 > [0] https://savannah.gnu.org/bugs/?60458
 > [1] https://bugs.busybox.net/show_bug.cgi?id=13586
 > [2] http://lists.busybox.net/pipermail/buildroot/2021-May/311524.html

 > Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
