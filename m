From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jan 2020 10:26:51 +1000
Subject: [Buildroot] [PATCH 2/3] package/xen: security bump to version
 4.12.2
In-Reply-To: <20200119170358.5408-2-peter@korsgaard.com>
References: <20200119170358.5408-1-peter@korsgaard.com>
 <20200119170358.5408-2-peter@korsgaard.com>
Message-ID: <CAKmqyKM5aRoXBv1mhZSY6HU8i1C8OQgUmgB7=5cHsbxcfGYgCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 20, 2020 at 3:04 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> The 4.12.2 release brings a large number of fixes:
>
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/xen-project-4-12-2/
>
> Including a number of security fixes:
>
> XSA-296: VCPUOP_initialise DoS (CVE-2019-18420)
> XSA-298: missing descriptor table limit checking in x86 PV emulation
>          (CVE-2019-18425)
> XSA-299: Issues with restartable PV type change operations (CVE-2019-18421)
> XSA-301: add-to-physmap can be abused to DoS Arm hosts (CVE-2019-18423)
> XSA-302: passed through PCI devices may corrupt host memory after
>          deassignment (CVE-2019-18424)
> XSA-303: ARM: Interrupts are unconditionally unmasked in exception handlers
>          (CVE-2019-18422)
> XSA-304: x86: Machine Check Error on Page Size Change DoS (CVE-2018-12207)
> XSA-305: TSX Asynchronous Abort speculative side channel (CVE-2019-11135)
> XSA-306: Device quarantine for alternate pci assignment methods
>          (CVE-2019-19579)
> XSA-307: find_next_bit() issues (CVE-2019-19581 CVE-2019-19582)
> XSA-308: VMX: VMentry failure with debug exceptions and blocked states
>          (CVE-2019-19583)
> XSA-309: Linear pagetable use / entry miscounts (CVE-2019-19578)
> XSA-310: Further issues with restartable PV type change operations
>          (CVE-2019-19580)
> XSA-311: Bugs in dynamic height handling for AMD IOMMU pagetables
>          (CVE-2019-19577)
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/xen/xen.hash | 2 +-
>  package/xen/xen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index a15bc7d852..ad6220d94b 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 5450a85497b84167df1d229b3ab98fb24ef4d6b0510dce522798c13c1b090159 xen-4.12.1.tar.gz
> +sha256 1c75cbe728dfabf02b7f9a17ce96ee7d202d2fd4b4689490018d3a28b63f9fa3 xen-4.12.2.tar.gz
>  sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 167f0ad638..7eb2643343 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -XEN_VERSION = 4.12.1
> +XEN_VERSION = 4.12.2
>  XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>  XEN_LICENSE = GPL-2.0
>  XEN_LICENSE_FILES = COPYING
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
