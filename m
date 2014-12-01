From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 10:14:19 +0000
Subject: [Buildroot] [PATCH v3] Add a defconfig for MIPS Creator CI20
In-Reply-To: <87wq6ejtsz.fsf@dell.be.48ers.dk>
References: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>
 <87wq6ejtsz.fsf@dell.be.48ers.dk>
Message-ID: <547C3F7B.3060804@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 11/29/2014 08:27 AM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > MIPS Creator CI20 is a Linux and Android development system from
>  > MIPS/Imagination Technologies. It incorporates an Ingenic JZ4780 SoC
>  > which includes a 1.2GHz dual core MIPS32 processor and Imagination
>  > PowerVR SGX540 GPU.
> 
>  > More information can be found at:
>  >   http://elinux.org/MIPS_Creator_CI20
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Committed to next, thanks.

Thanks :-)

> I do have one question though:
> 
>> +# system
>  > +BR2_KERNEL_HEADERS_VERSION=y
>  > +BR2_DEFAULT_KERNEL_VERSION="3.0.8"
>  > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
>  > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> 
> Is mdev in any way required? We normally only enable the basic stuff
> needed to get a booting system in the defconfigs.

I have added mdev to the defconfig in order to get it working out of the
box, because the kernel defconfig we are using doesn't have
DEVTMPFS_MOUNT support, so if you rely on the default /dev management
option (Dynamic using devtmpfs only) it will not work.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
