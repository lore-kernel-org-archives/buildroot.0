From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 10:00:14 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
	failure
In-Reply-To: <20170228000123.66658172@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Feb 2017 00:01:23 +0100")
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170228000123.66658172@free-electrons.com>
Message-ID: <87r32ik7vl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > The strace (which was added by me), give:

 > read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0V\0\0\0\0\0\0"..., 832) = 832
 > fstat(3, {st_mode=S_IFREG|0644, st_size=1088952, ...}) = 0
 > mmap(NULL, 3178744, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8df2576000
 > mprotect(0x7f8df267e000, 2093056, PROT_NONE) = 0
 > mmap(0x7f8df287d000, 8192, PROT_READ|PROT_WRITE,
 > MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x107000) = 0x7f8df287d000
 > close(3)                                = 0
 > mprotect(0x7f8df287d000, 4096, PROT_READ) = 0
 > mprotect(0x7f8df361b000, 4096, PROT_READ) = 0
 > mprotect(0x7f8df556d000, 4096, PROT_READ) = 0
 > --- SIGILL {si_signo=SIGILL, si_code=ILL_ILLOPN, si_addr=0x7f8df3d26f02} ---
 > +++ killed by SIGILL +++

Is that the complete strace output? Where is fd 3 getting opened? I
would imagine the problem is caused by some kind of host/target
libraries mixup.

-- 
Bye, Peter Korsgaard
