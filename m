From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Feb 2019 13:32:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix static build
 with openssl
In-Reply-To: <87a7ikg7ey.fsf@dell.be.48ers.dk>
References: <20190216112319.4769-1-fontaine.fabrice@gmail.com>
 <87a7ikg7ey.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W8152uxi=E=rTZbGKFgKFeTGovay_O+zuYrmmux7+8w5sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,
Le dim. 24 f?vr. 2019 ? 23:15, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > gf_mul is already defined in libcrypto (openssl) so rename it into
>  > ibrdtn_gf_mul to fix the following build failure in ibrdtnd package:
>
>  > /home/buildroot/autobuild/instance-3/output/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(f_impl.o):
>  > In function `gf_mul':
>  > f_impl.c:(.text+0x0): multiple definition of `gf_mul'
>  > /home/buildroot/autobuild/instance-3/output/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libibrcommon.a(gf128mul.o):gf128mul.cpp:(.text+0x30):
>  > first defined here
>  > collect2: error: ld returned 1 exit status
>  > Makefile:560: recipe for target 'dtnd' failed
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> The DOS newlines unfortunately got stripped by the mailing list, so the
> patch no longer applies. I have manually fixed that up now.
Thanks for fixing the issue, there is also the same problem with
host-cryptopp's patch:
http://autobuild.buildroot.net/results/e8f/e8fad6fe97391276df0bbb3deb9d4ab90ce043d1/build-end.log.
Could you also fix the issue?
Next time, I'll try to add a warning in the commit message.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
