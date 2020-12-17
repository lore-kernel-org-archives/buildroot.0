From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 17 Dec 2020 01:30:06 +0100
Subject: [Buildroot] Patch for linux-headers
Message-ID: <20201217003006.GA343694@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I wonder if it's allowed to add patch to add patch for linux-headers.
There would have to be more versions for the patch (due headers being built for
more versions). I'd like to use my upstreamed patch [1] which fixes
"redefinition of struct sysinfo" build failure on MUSL.
This so far required to patch affected packages or simply disable them
(depends on !BR2_TOOLCHAIN_USES_MUSL).

Actually, much simpler patch from Khem Raj could be used [2].

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a85cbe6159ffc973e5702f70a3bd5185f8f3c38d
[2] https://git.alpinelinux.org/aports/tree/main/linux-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
