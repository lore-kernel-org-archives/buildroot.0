From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 11:07:36 +0200
Subject: [Buildroot] [PATCH] uclibc: fix duplicate vfork problems when
 static linking
In-Reply-To: <20140901200606.GA14078@waldemar-brodkorb.de>
References: <20140901200606.GA14078@waldemar-brodkorb.de>
Message-ID: <20140907110736.7bb9919e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 1 Sep 2014 22:06:06 +0200, Waldemar Brodkorb wrote:
> Reported on uClibc mailinglist by Thomas Petazzoni
> Should fix:
> * SuperH
>  http://autobuild.buildroot.org/results/a81/a810c2f27dee1978808461c05cbdcbf51a214e09/build-end.log
> * i386
>  http://autobuild.buildroot.org/results/f83/f83b65bfc6ea7c7406a02e92afda43e4c5db6e7c/build-end.log
> * x86-64
>  http://autobuild.buildroot.org/results/64f/64f418f54885e8b5093dc8949c2d1d1ff3c938ea/build-end.log
> * powerpc
>  http://autobuild.buildroot.org/results/d5b/d5b7ac84dde0e4e26cd7cc46d79e66c39ed5cd53/build-end.log
> 
> Tested with i386 static build of alsa-utils.
> Patch will be send to uClibc soon, need to finish test-suite run.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...nptl-remove-duplicate-vfork-in-libpthread.patch |  691 ++++++++++++++++++++
>  1 file changed, 691 insertions(+)
>  create mode 100644 package/uclibc/0.9.33.2/uclibc-0062-nptl-remove-duplicate-vfork-in-libpthread.patch

Thanks a lot for working on this!

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(Built tested on i386, x86-64 and PowerPC. Statically linking alsa-lib
now works fine. I didn't test SuperH because our internal toolchain
backend is currently broken for SuperH.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
