From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:33:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: set WANT_SWIG
In-Reply-To: <20191015061128.5986-1-fontaine.fabrice@gmail.com>
References: <20191015061128.5986-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026123300.732da108@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 08:11:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set WANT_SWIG={ON,OFF} to {en,dis}able swig and avoid a random build
> failures probably due to parallel build issue when extracting
> pre-generated tarball:
> 
> CMake Error: Problem with archive_write_header(): Can't unlink already-existing object
> CMake Error: Current file: swigpyrun.h
> CMake Error: Problem extracting tar: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/znc-1.7.5/modules/modpython/generated.tar.gz
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f3394de616cea4f474b6d5887aa0d5f5dff05281
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/znc/znc.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
