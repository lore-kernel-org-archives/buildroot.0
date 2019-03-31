From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:01:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/8] package/rpm: security bump to 4.14.2.1
In-Reply-To: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
References: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331150109.2bf17527@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 15:49:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first and second patches (already in version)
> - Remove third and fourth patches (not needed since:
>   https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c)
> - Add hash for license file
> - Drop autoreconf (as configure.ac is not patched anymore)
> - Use new --with-crypto option
> - Restrict symlink following on installation (CVE-2017-7500,
>   CVE-2017-7501)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Put bump as the first patch in the serie

Applied to master, thanks. However, it seems like since bfd.h is no
longer needed, there is no longer any optional dependency on binutils.
Could you check this ? If it's the case, then it should be removed from
rpm.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
