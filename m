From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:01:01 +0100
Subject: [Buildroot] [PATCH 1/1] libmicrohttpd: fix build on riscv
In-Reply-To: <20181110160028.22033-1-fontaine.fabrice@gmail.com>
References: <20181110160028.22033-1-fontaine.fabrice@gmail.com>
Message-ID: <20181111220101.02bdfec7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Mark Corbin in Cc.

On Sat, 10 Nov 2018 17:00:28 +0100, Fabrice Fontaine wrote:
> Define _REENTRANT like already done for ARC otherwise pthread detection
> will fail
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/910dc7164312637bf4dcd89e4cb476ae198466c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmicrohttpd/libmicrohttpd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Mark: could you report upstream to the RISC-V gcc developers that the
gcc port should define _REENTRANT when -pthread is passed ?

I.E, most platforms do some variations of:

#define SUBTARGET_CPP_SPEC  "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"

in their gcc/config/<ARCH>/linux.h file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
