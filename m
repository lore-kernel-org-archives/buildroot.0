From: Steve James <ste@junkomatic.net>
Date: Thu, 19 Feb 2015 13:02:17 +0000
Subject: [Buildroot] Use case: legacy kernel with modern user-space?
Message-ID: <201502191302.17430.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

We are using Buildroot with a vendor supplied 2.6 kernel and drivers, but I 
wish to include some modern user-space tools. The problem is that these 
require a newer GCC version that the one that was contemporary when the kernel 
and drivers were written. The team is reluctant to move GCC forward (from 
4.5.3 to 4.7.4) for fear that this may expose subtle bugs in the vendor's 
drivers.

Can I invite your thought on how to resolve this?

1. I have attempted to persuade the team that the risk to upgrading the 
compiler is acceptably small, that this is a difficult argument to win.

2. I have proposed that we build only the kernel space with the old GCC and 
build user-space with the new GCC. I realise this is going off piste for 
Buildroot. What are the obstacles to this approach? Is it worth a try?

If it matters, we are building stock GCC with crostool-NG but I'd be receptive 
to alternative methods if it helped.

Thanks for your attention,
Steve.
