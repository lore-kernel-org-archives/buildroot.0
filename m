From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 26 Feb 2021 23:12:34 +0100
Subject: [Buildroot] [PATCH] package/qemu: disable tests
In-Reply-To: <87ft1jusq9.fsf@dell.be.48ers.dk>
References: <20210220172102.14174-1-romain.naour@gmail.com>
 <87ft1jusq9.fsf@dell.be.48ers.dk>
Message-ID: <b8da047b-00b7-96f3-586d-bc376c45f060@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 26/02/2021 ? 09:40, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > tests/fp/fp-bench.c use fenv.h that is not always provided
>  > by the libc (uClibc).
> 
>  > To workaround this issue, add an new meson option to
>  > disable tests while building Qemu.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  > ---
>  >  .../qemu/0004-meson-add-tests-option.patch    | 92 +++++++++++++++++++
>  >  package/qemu/qemu.mk                          |  2 +
>  >  2 files changed, 94 insertions(+)
>  >  create mode 100644 package/qemu/0004-meson-add-tests-option.patch
> 
>  > diff --git a/package/qemu/0004-meson-add-tests-option.patch b/package/qemu/0004-meson-add-tests-option.patch
>  > new file mode 100644
>  > index 0000000000..aff8a0f9fc
>  > --- /dev/null
>  > +++ b/package/qemu/0004-meson-add-tests-option.patch
>  > @@ -0,0 +1,92 @@
>  > +From c24f6cc8f847a4f90cd8fe0f94604862c5ac4a5e Mon Sep 17 00:00:00 2001
>  > +From: Romain Naour <romain.naour@gmail.com>
>  > +Date: Mon, 21 Dec 2020 22:12:14 +0100
> 
> I see you wrote this 2 months ago, but I don't seem to find it in qemu
> git or the mailing list. Did you submit it upstream? If not, please do
> so.

The patch was started at that time but not finished.
I just sent the patch on the mailing list.

Best regards,
Romain


> 
> Committed, thanks.
> 
