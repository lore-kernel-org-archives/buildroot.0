From: Mirza Krak <mirza.krak@northern.tech>
Date: Tue, 28 Aug 2018 19:12:19 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
Message-ID: <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2018 at 7:01 PM, Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
> Build fails due to missing // +build ppc64le in ioctl_64_bit.go
>
> Add patch to append ppc64le to // +build list.
>
> Fixes
> http://autobuild.buildroot.net/results/f22/f222b4389f9308363c386da25ec22a0919bc29fb//
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...001-ioctl-allow-building-for-ppc64le.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/mender/0001-ioctl-allow-building-for-ppc64le.patch
>
> diff --git a/package/mender/0001-ioctl-allow-building-for-ppc64le.patch b/package/mender/0001-ioctl-allow-building-for-ppc64le.patch

Note that the 1.5.0 release of Mender also contains this patch [1],
and updating the package to 1.5.0 will also fix the build problem on
ppc64le.

Note that there will soon (1-2 weeks) be a new Mender release (1.6.0)
that also contains this patch and updating to that will also fix the
build problem on pppc64le.

[1]. https://github.com/mendersoftware/mender/commit/d7064c82c66cb7e4093c71c44b2c976c0caac8a2
-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
