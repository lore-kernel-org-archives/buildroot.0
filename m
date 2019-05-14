From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix build of 8.0.1 with
 glibc 2.29
In-Reply-To: <20190513211537.11741-1-fontaine.fabrice@gmail.com>
References: <20190513211537.11741-1-fontaine.fabrice@gmail.com>
Message-ID: <20190514182505.2782412a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 23:15:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Between glibc 2.28 and glibc 2.29, commit
> 89983cb37c9319806a551e8fe9f3a11ff8f973e1 ("Update siginfo constants
> from Linux kernel (bug 21286)") was merged. This commit moved the
> TRAP_HWBKPT definition from an IA64-specific header to an
> architecture-agnostic header.
> 
> This change exhibited a build issue that until then was only visible
> on IA64 (which Buildroot does not support). This Buildroot commit
> backports a patch from gdb upstream (which is in gdb since 8.2) which
> mentions IA64 because it was originally meant to fix only the
> IA64-related issue. But the glibc change, this change has become
> visible on all architectures.
> 
> Fixes:
>  - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...P_HWBKPT-before-including-gdb_wait-h.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/gdb/8.0.1/0006-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
