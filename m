From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Feb 2011 21:47:15 +0100
Subject: [Buildroot] Strange hang while executing commands
In-Reply-To: <AANLkTikvXk7qzFov-25Xu_MmUXdkYMdwkKkGtsRzhUwA@mail.gmail.com>
	(Martin Hicks's message of "Mon, 14 Feb 2011 14:18:17 -0500")
References: <AANLkTikvXk7qzFov-25Xu_MmUXdkYMdwkKkGtsRzhUwA@mail.gmail.com>
Message-ID: <87sjvm75ik.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:

 Martin> Hi,
 Martin> Does anyone have any clues where I might start looking for the reason
 Martin> behind commands within the procps package just hanging?

Hanging or crashing?

 Martin> mprotect(0xffa9000, 16384, PROT_READ)   = 0 <0.000104>
 Martin> mprotect(0x4802e000, 4096, PROT_READ)   = 0 <0.000077>
 Martin> munmap(0x4801f000, 64)                  = 0 <0.000098>
 Martin> uname({sys="Linux", node="targa4v2", ...}) = 0 <0.000115>
 Martin> --- SIGINT (Interrupt) @ 0 (0) ---
 Martin> +++ killed by SIGINT +++

This looks like a crash (a null pointer access). On what arch / with
what configuration is this?

-- 
Bye, Peter Korsgaard
