From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 19:55:53 +0200
Subject: [Buildroot] [PATCH 2/5] x11r7: make package globally visible
In-Reply-To: <c909524d6b4a5f5d13cbb577d124a0aa456fd123.1316465857.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:57:38 +0200")
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <c909524d6b4a5f5d13cbb577d124a0aa456fd123.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aa9fpbkm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> All x11r7 .mk files were only included into the global chain of
 Thomas> makefile includes if the BR2_PACKAGE_XORG7 option was enabled. This is
 Thomas> not the standard way to do things in Buildroot, and it even breaks
 Thomas> things like running "make <pkg>-*" for a x11r7 package even if X.org
 Thomas> is not selected.

I was a bit concerned about the performance impact of parsing all those
x11 files, but it still seems ok as 'make help' went from 1.8s to 2.8s
on my old laptop.

Committed, thanks.

-- 
Bye, Peter Korsgaard
