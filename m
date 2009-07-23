From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jul 2009 07:43:52 +0200
Subject: [Buildroot] [git commit] linux26: do not set CFLAGS_KERNEL to
	TARGET_CFLAGS
In-Reply-To: <20090722232415.1a437f3a@surf> (Thomas Petazzoni's message of
	"Wed\, 22 Jul 2009 23\:24\:15 +0200")
References: <20090722204437.752507781D@busybox.osuosl.org>
	<20090722232415.1a437f3a@surf>
Message-ID: <87y6qgar8n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> I'm not using Buildroot to build kernels, so I'm not sure,
 Thomas> but I think that this commit might break the kernel build
 Thomas> with external toolchain.  With external toolchain, the
 Thomas> --sysroot option must be passed to allow gcc to find the
 Thomas> headers and libraries. And the --sysroot option is precisely
 Thomas> inside $(TARGET_CFLAGS).

But the kernel doesn't use any userspace headers/libraries, so that
afaik shouldn't be a problem.

-- 
Bye, Peter Korsgaard
