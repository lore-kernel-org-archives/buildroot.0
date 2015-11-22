From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:48:25 +0100
Subject: [Buildroot] [PATCH 1/1] libxml2: security bump to version 2.9.3
In-Reply-To: <1448156308-2562-1-git-send-email-danomimanchego123@gmail.com>
References: <1448156308-2562-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20151122134825.65a90eab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 21 Nov 2015 20:38:28 -0500, Danomi Manchego wrote:
> - Fixes:
>   - CVE-2015-5312 - Another entity expansion issue
>   - CVE-2015-7497 - Avoid an heap buffer overflow in xmlDictComputeFastQKey
>   - CVE-2015-7500 - Fix memory access error due to incorrect entities boundaries
>   - CVE-2015-8242 - Buffer overead with HTML parser in push mode
> 
> - Incorporates upstreamed patches as well, which also fixed:
>   - CVE-2015-1819 - The xmlreader in libxml allows remote attackers to cause
>     a denial of service (memory consumption) via crafted XML data, related
>     to an XML Entity Expansion (XEE) attack.
>   - CVE-2015-7941 - out-of-bounds memory access.
>   - CVE-2015-7942 - heap-buffer-overflow in xmlParseConditionalSections.
>   - CVE-2015-8035 - DoS via crafted xz file.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  ...onfig.cmake.in-update-include-directories.patch |  28 ----
>  ...s-use-forward-declarations-only-for-glibc.patch |  52 ------
>  package/libxml2/0003-fix-CVE-2015-1819.patch       | 178 ---------------------
>  package/libxml2/0004-fix-CVE-2015-7941-1.patch     |  34 ----
>  package/libxml2/0005-fix-CVE-2015-7941-2.patch     |  51 ------
>  package/libxml2/0006-fix-CVE-2015-7942-1.patch     |  34 ----
>  package/libxml2/0007-fix-CVE-2015-7942-2.patch     |  30 ----
>  package/libxml2/0008-fix-CVE-2015-8035.patch       |  33 ----
>  package/libxml2/libxml2.hash                       |   2 +-
>  package/libxml2/libxml2.mk                         |   2 +-
>  10 files changed, 2 insertions(+), 442 deletions(-)
>  delete mode 100644 package/libxml2/0001-libxml2-config.cmake.in-update-include-directories.patch
>  delete mode 100644 package/libxml2/0002-threads-use-forward-declarations-only-for-glibc.patch
>  delete mode 100644 package/libxml2/0003-fix-CVE-2015-1819.patch
>  delete mode 100644 package/libxml2/0004-fix-CVE-2015-7941-1.patch
>  delete mode 100644 package/libxml2/0005-fix-CVE-2015-7941-2.patch
>  delete mode 100644 package/libxml2/0006-fix-CVE-2015-7942-1.patch
>  delete mode 100644 package/libxml2/0007-fix-CVE-2015-7942-2.patch
>  delete mode 100644 package/libxml2/0008-fix-CVE-2015-8035.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
