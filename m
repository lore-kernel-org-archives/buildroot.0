From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Feb 2015 09:20:50 +0100
Subject: [Buildroot] [PATCHv2 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1424186973-7838-3-git-send-email-patrickdepinguin@gmail.com>
References: <1424186973-7838-1-git-send-email-patrickdepinguin@gmail.com>
 <1424186973-7838-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LXYqRLJU153ULJd_izzLuY0mC0LPOxEzN9QbeuDOEFC7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 17, 2015 at 4:29 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Currently, following symbolic links are created in both target and
> staging directories:
> - lib(32|64) --> lib
> - usr/lib(32|64) --> lib
>
> The decision for lib32 or lib64 is based on the target architecture
> configuration in buildroot (BR2_ARCH_IS_64).
>
> In at least one case this is not correct: when building for a Cavium Octeon III
> processor using the toolchain from the Cavium Networks SDK, and specifying
> -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected in directory
> 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).

These lines are a bit too long, seems my git-based workflow is not yet
100% ok :-o

I will resubmit later...
