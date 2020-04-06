From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Apr 2020 17:19:12 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-kernel-headers.sh: do
 not print error for loose checks
In-Reply-To: <20200321135220.341529-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 21 Mar 2020 14:52:19 +0100")
References: <20200321135220.341529-1-thomas.petazzoni@bootlin.com>
 <20200321135220.341529-2-thomas.petazzoni@bootlin.com>
Message-ID: <87eet0y74f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The C program inside check-kernel-headers.sh has two checking mode: a
 > strict and a loose one.

 > In strict mode, we want the kernel headers version declared by the
 > user to match exactly the one of the toolchain.

 > In loose mode, we want the kernel headers version of the toolchain to
 > be greater than or equal to the one declared by the user: this is used
 > when we have a toolchain that has newer headers than the latest
 > version known by Buildroot.

 > However, in loose mode, we continue to show the "Incorrect kernel
 > headers version" message, even though we then return a zero error
 > code. This is very confusing: you see an error displayed on the
 > terminal, but the build goes on.

 > We fix that by first doing the loose check first, and returning 0 if
 > it succeeds. And then we move on with the strict check where we want
 > the version to be identical.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
