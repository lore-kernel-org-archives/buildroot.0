From: Martin Hicks <mort@bork.org>
Date: Thu, 17 Feb 2011 15:49:39 -0500
Subject: [Buildroot] Strange hang while executing commands
In-Reply-To: <87sjvm75ik.fsf@macbook.be.48ers.dk>
References: <AANLkTikvXk7qzFov-25Xu_MmUXdkYMdwkKkGtsRzhUwA@mail.gmail.com>
	<87sjvm75ik.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTim0HL1qMmkS7tNaYmoEeyg4pZXLr3FztfAVPoXq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 17, 2011 at 3:47 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:
>
> ?Martin> Hi,
> ?Martin> Does anyone have any clues where I might start looking for the reason
> ?Martin> behind commands within the procps package just hanging?
>
> Hanging or crashing?

Hang.

>
> ?Martin> mprotect(0xffa9000, 16384, PROT_READ) ? = 0 <0.000104>
> ?Martin> mprotect(0x4802e000, 4096, PROT_READ) ? = 0 <0.000077>
> ?Martin> munmap(0x4801f000, 64) ? ? ? ? ? ? ? ? ?= 0 <0.000098>
> ?Martin> uname({sys="Linux", node="targa4v2", ...}) = 0 <0.000115>
> ?Martin> --- SIGINT (Interrupt) @ 0 (0) ---
> ?Martin> +++ killed by SIGINT +++
>
> This looks like a crash (a null pointer access). On what arch / with
> what configuration is this?

The last two lines are me hitting ^C.  It hangs after the uname() forever.

This is a custom board based on MPC8379ERDB.  Compiled using the code
sourcery toolchain.
(glibc, linux-2.7.37)
mh

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
