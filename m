From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 21:10:15 +0100
Subject: [Buildroot] [PATCH 4/4] package/qemu: Fix a regression in
 semihosting
In-Reply-To: <20200308183535.1206604-4-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 8 Mar 2020 19:35:35 +0100")
References: <20200308183535.1206604-1-romain.naour@smile.fr>
 <20200308183535.1206604-4-romain.naour@smile.fr>
Message-ID: <87d09msj4o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > From: Adrien Grassein <adrien.grassein@smile.fr>
 > The Buildroot's gitlab testing infra reported a build issue
 > with the qemu_arm_vexpress_tz_defconfig due to host-python3
 > modules issues [1]. Thoses issues has been fixed by the
 > previous patch.

 > But the defconfig doesn't boot with the current master
 > (2020.02-rc3).

 > It turn out that is an Qemu 4.2.0 regression that was
 > fixed upstream by [2]. This issue was found by using
 > git bisect old/new.

 > Fixes:
 > $ ../host/bin/qemu-system-arm -machine virt -machine secure=on -cpu cortex-a15 -smp 1 -s -m 1024 -d unimp -serial stdio -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic -semihosting-config enable,target=native -bios bl1.bin
 > NOTICE:  Booting Trusted Firmware
 > NOTICE:  BL1: v2.0(release):2020.02-rc3-43-g9abf171ea6
 > NOTICE:  BL1: Built : 12:44:52, Mar  8 2020
 > ERROR:   Failed to load BL2 firmware.

 > After fixing host-python3 issue from [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/456818689
 > [2] https://github.com/qemu/qemu/commit/21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db

 > Signed-off-by: Adrien Grassein <adrien.grassein@smile.fr>
 > [Romain:
 >   - improve commit log
 >   - add upstream link
 > ]
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Etienne Carriere <etienne.carriere@linaro.org>
 > Cc: Gerome Burlats <gerome.burlats@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
