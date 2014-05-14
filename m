From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 May 2014 09:29:56 +0200
Subject: [Buildroot] [PATCH] libunwind: add patch to fix behavior for
	ARM < v6
In-Reply-To: <1400017657-12704-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 13 May 2014 23:47:37 +0200")
References: <1400017657-12704-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx8su8az.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since libatomic_ops does not implement real atomic operations for
 > ARMv4 and ARMv5, libunwind must define AO_REQUIRE_CAS do indicate it
 > requires compare-and-swap operations, even if not available as real
 > atomic operations for the current architecture. In this case,
 > libatomic_ops will rely on emulated atomic operations, which also
 > require linking against libatomic_ops, which was until now not done by
 > libunwind.

 > This fixes the mysterious ltrace build issue:

 >   http://autobuild.buildroot.org/results/e1b/e1b330abfa2d80f3f30bc3359428ea429c690eb8/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
