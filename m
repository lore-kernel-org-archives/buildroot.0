From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Oct 2017 18:51:19 +0000
Subject: [Buildroot] [Bug 10451] libpcap 1.8.x and 1.7x does not compile on
	PPC
In-Reply-To: <bug-10451-163@https.bugs.busybox.net/>
References: <bug-10451-163@https.bugs.busybox.net/>
Message-ID: <bug-10451-163-O09rhSv1ZV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10451

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> ---
Internal compiler error, so ideally you should report this to upstream GCC. I
would first of all try playing with the command line options like -O3 and -fpic
(replace with e.g. -fPIC) and the -mfloat-gprs and -Wa,-me500x2 options. You
can also try to strip down pcap.c to the minimal thing that exposes the issue -
that is needed for reporting the bug to GCC.

I do assume that the patches in ../../projects/92107-110/br_patches do not
affect libpcap or gcc?

You can also try with an unpatched GCC:
make host-gcc-final-dirclean
make host-gcc-final-extract
mv output/build/host-gcc-final-*/ /tmp/
make HOST_GCC_FINAL_OVERRIDE_SRCDIR=/tmp/host-gcc-final-* libpcap

-- 
You are receiving this mail because:
You are on the CC list for the bug.
