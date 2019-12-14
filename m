From: zhou qi <atmgnd@outlook.com>
Date: Sat, 14 Dec 2019 14:59:54 +0000
Subject: [Buildroot] PATCH 2019.11 stable release,
 glibc/gcc busybox incompatible
In-Reply-To: <87eex7ez8f.fsf@dell.be.48ers.dk>
References: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 <87d0csgt79.fsf@dell.be.48ers.dk>
 <TY2PR02MB3727BA639496E684AE9AF4F2C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 <TY2PR02MB3727225FD240605F44F32D6DC9540@TY2PR02MB3727.apcprd02.prod.outlook.com>,
 <87eex7ez8f.fsf@dell.be.48ers.dk>
Message-ID: <HK0PR02MB3716FC9A68E4F5D53BA7300FC9570@HK0PR02MB3716.apcprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don?t so, I tested using a real i3 cpu(6th), get this error too.
traps: xxx[xxx] general protection ip ...

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=550986> for Windows 10

________________________________
From: Peter Korsgaard <jacmet@gmail.com> on behalf of Peter Korsgaard <peter@korsgaard.com>
Sent: Saturday, December 14, 2019 10:52:16 PM
To: zhou qi <atmgnd@outlook.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>
Subject: Re: PATCH 2019.11 stable release, glibc/gcc busybox incompatible

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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191214/266129b3/attachment.html>
