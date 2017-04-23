From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun, 23 Apr 2017 19:21:11 +0530
Subject: [Buildroot] [PATCH v3] package: protobuf/python-protobuf: bump
	to v3.2.0.
In-Reply-To: <20170423115940.GA12996@scaer>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <20170421160637.6206-1-mrugiero@gmail.com>
 <20170423115940.GA12996@scaer>
Message-ID: <CA+NV+V=XoYZToDU23_A+FhtDyNrHobYjfB1vOLTqe+Bq8sUAeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 23, 2017 at 5:29 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Mario, All,
>
> On 2017-04-21 13:06 -0300, mrugiero at gmail.com spake thusly:
>> From: "Mario J. Rugiero" <mrugiero@gmail.com>
>>
>> Both packages are coupled, so both were bumped and build-tested.
>> The atomics' support patch is no longer needed, and neither is
>> the autoreconf option, and SPARC64 is no longer broken.
>> To make sure of this, one config of each of the following archs
>> was tested (base defconfig in parens):
>> PowerPC (qemu_ppc_g3beige_defconfig)
>> SPARC (qemu_sparc_ss10_defconfig)
>> SPARC64 (qemu_sparc64_sun4u_defconfig)
>
> This is causing a truckload of build failures:
>
>     http://autobuild.buildroot.org/?reason=host-protobuf-3.2.0
>
>     http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
>     http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
>     http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/
>
> And so on...
>
> Note however that all build failures occur on Thomas' autobuilder
> instance, which is running quite an old distro (on purpose).

Is it running a CentOS ? There is upstream commit which may fix these
build issues.
https://github.com/google/protobuf/commit/a83ac8663fb8042a881bc60b12a8bd3a0c03a3ff

Thanks,
Rahul
