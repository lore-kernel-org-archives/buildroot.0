From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Fri, 25 Sep 2020 07:31:31 +0200
Subject: [Buildroot] [PATCH v4 05/12] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <20200924214901.GC11621@scaer>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
 <20200917040802.846896-6-egorenar@linux.ibm.com>
 <20200924214901.GC11621@scaer>
Message-ID: <873636e824.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

>> +++ b/board/qemu/s390x/readme.txt
>> @@ -0,0 +1,8 @@
>> +Run the emulation with:
>> +
>> +  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
>> +    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
>> +    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
>> +    -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 # qemu_s390x_defconfig
>
> I saw no reason to force the network IP,so I dropped it. Also, there is
> no sshd running, so there is no need to do a port forwarding either, so
> dropped too.
>
> Applied to master with those minor fixes, thanks!
>
> Regards,
> Yann E. MORIN.
>

Tested, works great :)
Thank you very much.

Regards
Alex
