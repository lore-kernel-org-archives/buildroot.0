From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 7 Mar 2015 18:20:39 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150307172039.GI3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> uClibc-ng does not support linuxthreads or linuxthreads.old on
> architectures that have NPTL support. This creates another complicated
> dependency: dependeing on the uClibc version being used, not the same
> thread implementations are available.
> 
> In order to handle this situation, this patch introduces three hidden
> booleans:
> 
>  - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  - BR2_UCLIBC_VERSION_SUPPORTS_NPTL
> 
> They are selected by the different uClibc versions, depending on which
> thread implementation they support on the different architectures.
> 
> Then, the choice of the thread implementation can rely on those
> booleans to know if a given thread implementation is available in the
> current architecture / uClibc version selection.

Looks good to me so far.
I am still unsatisfied about the ARC situation.
If you use this branch of gcc:
https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-4.8-tls

You get a working toolchain with TLS support and can use uClibc-git
or uClibc-ng 1.0.0 with NPTL.

best regards
 Waldemar
