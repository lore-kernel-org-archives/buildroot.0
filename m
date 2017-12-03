From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 14:50:41 +0100
Subject: [Buildroot] [PATCH 1/2] kvm-unit-tests: bump to
 kvm-unit-tests-20171020
In-Reply-To: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
Message-ID: <20171203145041.7792e3ac@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 21:33:20 -0600, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

A better commit log would have been:

    kvm-unit-tests: bump to kvm-unit-tests-20171020
    
    - 0001-Makefile-remove-Werror-to-avoid-build-failures.patch is
      adjusted to apply to the new version of kvm-unit-tests
    
    - 0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch is
      removed, as it has been merged upstream as of commit
      45276b5860522921c77fb3ccc1458ff5f223c3c6.
    
    Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 27b22f4f0f..b6504210d3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -443,7 +443,7 @@ F:	package/znc/
>  
>  N:	Cyril Bur <cyrilbur@gmail.com>
>  F:	arch/Config.in.powerpc
> -F:	package/kvm-unit-tests
> +F:	package/kvm-unit-tests/

Change is not related, should have been in a separate patch, so I've
removed it before applying.

> diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> index b1ea09272e..699be171d0 100644
> --- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> +++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> @@ -1,26 +1,27 @@
> -From 08e14a662b9e75daec29722e49150869952ba1b6 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Mon, 20 Nov 2017 22:09:39 +0100
> +From e9490197169d146060a26e96eca2901375d5cd5e Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Sat, 2 Dec 2017 21:24:30 -0600

No reason to change the author of the patch here...

>  Subject: [PATCH] Makefile: remove -Werror to avoid build failures
>  
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

... and to drop the SoB.

I've applied to master after fixing those issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
