From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:31:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/python3: uClibc-ng doesn't set
 errno when encryption method is not available
In-Reply-To: <20201111233429.2245255-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 12 Nov 2020 00:34:28 +0100")
References: <20201111233429.2245255-1-romain.naour@gmail.com>
Message-ID: <87lff6i7nu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Since commit [1] in cpython, an exception is raised when an encryption method
 > is not available. This eception is handled only if errno is set to EINVAL by
 > crypt() but uClibc-ng doesn't set errno in crypt() [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981961
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979

 > [1] https://github.com/python/cpython/commit/0d3fe8ae4961bf551e7d5e42559e2ede1a08fd7c
 > [2] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

I've applied this for master to fix the issue for 2020.11, but it would
really be good if uClibc-ng could be fixed to set errno to something
sensible.

Romain, don't forget to submit the python patch upstream.

-- 
Bye, Peter Korsgaard
