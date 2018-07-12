From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 12 Jul 2018 06:44:42 -0500
Subject: [Buildroot] [PATCH 0/6] Hardening Flag Bugfix/Enhancement
In-Reply-To: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpabgJO30ghCH8jVaD2uxr6QE-gcpArByWPJcDYHqiC64g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Jul 11, 2018 at 9:31 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> This series pulls together a few pending patches required for hardening
> flag bug-fixes.  Additionally a tool is added with Buildroot test cases
> to validate that the hardening options are working correctly.

I forgot to mention the goal of this series is to fix and complete
testing of the existing approach.  I do like the concept of changing
to the wrapper and evaluating if we can use GCC spec files, however, I
was hoping we could establish a working baseline first.  Then propose
changes to possibly use a more elegant approach.

>
> Stefan S?ena
> http://patchwork.ozlabs.org/patch/904057/  (Bugfix)
> http://patchwork.ozlabs.org/patch/904034/  (Bugfix)
>
>
> Matt Weber (Both have been marked as superseded)
> http://patchwork.ozlabs.org/patch/907093/  (Bugfix)
> http://patchwork.ozlabs.org/patch/932853/  (New checksec tool)
>
> A unrelated patch was also included which adds proxy env support for the runtests script.
>
> Matt Weber (2):
>   support/testing: runtest proxy support
>   support/testing/tests/core: SSP & hardening flags
>
> Paresh Chaudhary (1):
>   package/checksec: new package
>
> Stefan S?rensen (3):
>   package/Makefile.in: Do not use CPPFLAGS for hardening options
>   package/Makefile.in: Add missing options to LDFLAGS for full RELRO
>     build
>   package/Makefile.in: Use gcc spec files for PIE build flags
>
>  package/Config.in.host                        |   1 +
>  package/Makefile.in                           |  18 +--
>  ...cksec-Fixed-issue-with-relative-path.patch |  43 ++++++++
>  package/checksec/Config.in.host               |  16 +++
>  package/checksec/checksec.hash                |   3 +
>  package/checksec/checksec.mk                  |  16 +++
>  support/testing/infra/builder.py              |   6 +
>  support/testing/tests/core/test_hardening.py  | 104 ++++++++++++++++++
>  toolchain/gcc-specs-pie-cc1                   |   2 +
>  toolchain/gcc-specs-pie-ld                    |   2 +
>  10 files changed, 202 insertions(+), 9 deletions(-)
>  create mode 100644 package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
>  create mode 100644 package/checksec/Config.in.host
>  create mode 100644 package/checksec/checksec.hash
>  create mode 100644 package/checksec/checksec.mk
>  create mode 100644 support/testing/tests/core/test_hardening.py
>  create mode 100644 toolchain/gcc-specs-pie-cc1
>  create mode 100644 toolchain/gcc-specs-pie-ld
>
> --
> 2.17.0
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
