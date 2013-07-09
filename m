From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 9 Jul 2013 10:22:25 -0500
Subject: [Buildroot] Cape firmware in /lib/firmware
In-Reply-To: <CA+-urNSTk=U5uOCSnmPLd0iziW7Lh_HTb9Zb+eR2aaBByi=WtQ@mail.gmail.com>
References: <CA+-urNSTk=U5uOCSnmPLd0iziW7Lh_HTb9Zb+eR2aaBByi=WtQ@mail.gmail.com>
Message-ID: <CAEBucnBRDa2CZ2RDBtkX3rT=d57bcVaGnsxvh6X1-QJTchs-MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

I'm respond to the mailing list as many people could find this
information useful.

> I just double checked whether the eMMC would work when the cape dtbos
> were not compiled into the kernel (I was also trying out your patches
> too), and it's not looking like it is working.
>
> Just to make sure that we're doing the same thing, I assume that you have:
>
> # CONFIG_FIRMWARE_IN_KERNEL is not set
>
> in your kernel config. Do you have any other changes? As far as I can
> tell, the dtbos are installed correctly.

Unfortunately, I have the CONFIG_FIRMWARE_IN_KERNEL set to y.  So, I
am not actually performing the firmware loads as I had thought.  Thank
you for pointing me towards this issue.

> To be honest, I don't understand how eMMC is working for you if you
> don't build cape-bone-2g-emmc1.dtbo into the kernel. It seems like the
> firmware request just comes too early.
>
> Anyway, if it does work, I'd like to change my setup to more closely
> mirror yours since having the dtbos not compiled into the kernel seems
> like the right way to go.

So, If I disable CONFIG_FIRMWARE_IN_KERNEL option and boot from the
sdcard.  The following firmware loading is observed but only slot-5 is
successfully loaded.

beaglebone login: [   61.502280] bone-capemgr bone_capemgr.8: failed
to load firmware 'cape-bone-2g-emmc1.dtbo'
[   61.510994] bone-capemgr bone_capemgr.8: loader: failed to load
slot-4 BB-BONE-EMMC-2G:00A0 (prio 1)
[   61.520998] bone-capemgr bone_capemgr.8: slot #5: Requesting
firmware 'cape-boneblack-hdmi-00A0.dtbo' for board-name
'Bone-Black-HDMI', version '00A0'
[   61.535117] bone-capemgr bone_capemgr.8: loader: check slot-6
BB-BONELT-HDMIN:00A0 (prio 2)
[   61.553375] bone-capemgr bone_capemgr.8: slot #5: dtbo
'cape-boneblack-hdmi-00A0.dtbo' loaded; converting to live tree
[   61.565195] bone-capemgr bone_capemgr.8: slot #5: #4 overlays
[   61.576715] platform 4830e000.fb: alias fck already exists
[   61.596648] bone-capemgr bone_capemgr.8: slot #5: Applied #4 overlays.
[   61.603577] bone-capemgr bone_capemgr.8: loader: done slot-5
BB-BONELT-HDMI:00A0 (prio 1)
[   61.612492] bone-capemgr bone_capemgr.8: loader: check slot-6
BB-BONELT-HDMIN:00A0 (prio 2)
[   61.625585] bone-capemgr bone_capemgr.8: loader: after slot-6
BB-BONELT-HDMIN:00A0 (prio 2)
[   61.634998] bone-capemgr bone_capemgr.8: slot #6: Requesting
firmware 'cape-boneblack-hdmin-00A0.dtbo' for board-name
'Bone-Black-HDMIN', version '00A0'
[   61.652387] bone-capemgr bone_capemgr.8: slot #6: dtbo
'cape-boneblack-hdmin-00A0.dtbo' loaded; converting to live tree
[   61.664160] bone-capemgr bone_capemgr.8: slot #6: BB-BONELT-HDMIN
conflict P8.45 (#5:BB-BONELT-HDMI)
[   61.673749] bone-capemgr bone_capemgr.8: slot #6: Failed verification
[   61.680499] bone-capemgr bone_capemgr.8: loader: failed to load
slot-6 BB-BONELT-HDMIN:00A0 (prio 2)

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
