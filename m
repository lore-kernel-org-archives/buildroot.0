From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Dec 2019 15:52:16 +0100
Subject: [Buildroot] PATCH 2019.11 stable release,
 glibc/gcc busybox incompatible
In-Reply-To: <TY2PR02MB3727225FD240605F44F32D6DC9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 (zhou qi's message of "Fri, 13 Dec 2019 15:41:17 +0000")
References: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 <87d0csgt79.fsf@dell.be.48ers.dk>
 <TY2PR02MB3727BA639496E684AE9AF4F2C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 <TY2PR02MB3727225FD240605F44F32D6DC9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
Message-ID: <87eex7ez8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "zhou" == zhou qi <atmgnd@outlook.com> writes:

 > And Yes, the CPU variant or E.G.
 > Only arch to i386, libc to glibc

Interesting. I can reproduce it as well, but only with
-enable-kvm. Without -enable-kvm it works fine here. Maybe it is a bug
in kvm?

Notice that we do have a dedicated i386 qemu defconfig
(qemu_x86_defconfig). I just tried building that with glibc and that
runs without issues here with/without -enable-kvm.

-- 
Bye, Peter Korsgaard
