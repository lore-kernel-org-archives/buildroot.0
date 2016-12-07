From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:37:23 +0100
Subject: [Buildroot] [PATCH v2] Makefile: generate
 KBUILD_BUILD_TIMESTAMP date whith LC_ALL=C
In-Reply-To: <1481124042-25089-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
References: <1481124042-25089-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
Message-ID: <20161207233723.57cae911@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Dec 2016 16:20:42 +0100, Jean-Baptiste Tr?dez wrote:
> Fix kernel reproducible build if LANG=fr_FR.UTF-8 or LC_ALL=fr_FR.UTF-8 in host system.
> 
> when building linux kernel, scripts/gen_initramfs_list.sh do 'date -d"$KBUILD_BUILD_TIMESTAMP" +%s'
> In buildroot makefile, KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
> if LANG=fr_FR.UTF-8 in host system, it does not work :
> - LC_ALL=C date -d"$(LC_ALL=C date)" : ok
> - LC_ALL=C date -d"$(LC_ALL=fr_FR.UTF-8 date)" : error
> 
> LANG/LC_ALL variables exported in the main Makefiles are not used in the $(shell ...) sub-shells.
> 
> Signed-off-by: Jean-Baptiste Tr?dez <jean-baptiste.tredez@basystemes.fr>
> ---
> Changes in v2:
> 	- use LC_ALL=C instead of LANG=C

Applied to master, after tweaking the commit title and commit log a bit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
