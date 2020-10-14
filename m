From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:17:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] tpm2-tss: bump version to 3.0.1
In-Reply-To: <LTX1nraBUAtkxzJfofN3gcjMI1lgPwo4mbFffGKs5sSFz7uttVsIIataPlRjU4fZ-AerudU8-aQ_sURQ5zYspa10BKG6raTbq7Vhpr2RHH4=@protonmail.com>
References: <LTX1nraBUAtkxzJfofN3gcjMI1lgPwo4mbFffGKs5sSFz7uttVsIIataPlRjU4fZ-AerudU8-aQ_sURQ5zYspa10BKG6raTbq7Vhpr2RHH4=@protonmail.com>
Message-ID: <20201014191754.4ca8cc54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yair,

Thanks for your patch.

On Wed, 14 Oct 2020 15:02:17 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> - 0001-Temporary-fix-for-build-without-C.patch, AC_PROG_CXX line
>   number changed.
> - Makefile-fuzz-generated.am now in size zero.
> - json-c, libcurl: new dependencies since tpm2-tss version 2.4.0
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

Your patch unfortunately does not apply:

$ git pwam 1382206
Applying patch #1382206 using "git am -s"
Description: [v3,1/1] tpm2-tss: bump version to 3.0.1
Applying: tpm2-tss: bump version to 3.0.1
error: patch failed: package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch:23
error: package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch: patch does not apply
Patch failed at 0001 tpm2-tss: bump version to 3.0.1
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128


In addition, the dependencies on json-c and libcurl are not mandatory,
they are only needed if FAPI is enabled. It is the case by default, but
it's a new feature since tpm2-tss, and I suppose it would make sense to
not enable it by default.

Can we make that a sub-option of tpm2-tss ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
