From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Wed, 16 Sep 2020 07:58:00 +0200
Subject: [Buildroot] [PATCH v2 05/12] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <9f65f4f7-91f4-fd71-c15a-f6327bf3194b@gmail.com>
References: <20200913113254.1955447-1-egorenar@linux.ibm.com>
 <20200913113254.1955447-6-egorenar@linux.ibm.com>
 <9f65f4f7-91f4-fd71-c15a-f6327bf3194b@gmail.com>
Message-ID: <87k0wu5klz.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain Naour <romain.naour@gmail.com> writes:

>> +BR2_s390x=y
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>
> Other qemu defconfig doesn't select eudev, it doesn't seems mandatory.
>

If i do this, then the Ethernet device stops working and no IP can be
assigned via DHCP.

>
> The kernel needs openssl support:
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>
> https://gitlab.com/kubu93/buildroot/-/jobs/739439450
>
> I tested the series locally:
>
> Tested-by: Romain Naour <romain.naour@gmail.com>
>

Fixed.


Thank you
Regards
Alex
