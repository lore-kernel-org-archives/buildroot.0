From: Courousse, Damien <damien.courousse@logica.com>
Date: Wed, 29 Jul 2009 14:59:14 +0200
Subject: [Buildroot] linux .config : override: reassigning to symbol AEABI
Message-ID: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildrooters!

I am trying to use buildroot for the ATEB9200 board form Embest. It is somewhat similar to the AT91rm9200dk/ek configs, including the CPU arm920t.

I am using the kernel v2.6.28, patched with the Atmel patched automatically applied by buildroot.
I am using buildroot v2009-05.

The kernel loading gets stuck after mounting the NFS root : 
================================================================
....
IP-Config: Complete:
     device=eth0, addr=10.84.34.8, mask=255.255.255.192, gw=10.84.34.1,
     host=debian_test, domain=, nis-domain=(none),
     bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
Looking up port of RPC 100003/2 on 10.84.34.52
Looking up port of RPC 100005/1 on 10.84.34.52
VFS: Mounted root (nfs filesystem).
Freeing init memory: 116K
Kernel panic - not syncing: Attempted to kill init!
================================================================

I have configured buildroot to avoid EABI, and everything seems OK on this side in the config files.

I guess my problem comes from the kernel config, where the EABI symbol is overridden during buildroot compilation: 
=================================================================
make[1]: entrant dans le r?pertoire ? /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28 ?
scripts/kconfig/conf -o arch/arm/Kconfig
.config:1344:warning: override: reassigning to symbol AEABI
.config:1345:warning: override: reassigning to symbol IPV6
================================================================

I give to the kernel the following command line: 
root=/dev/nfs rw nfsroot=10.84.34.52:/mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/root ip=10.84.34.8:10.84.34.52:10.84.34.1:255.255.255.192:debian_test:eth0:off init=/bin/sh

Do you think this is a normal behaviour, knowing that I did *not* configure buildroot, uclibc and the kernel for EABI?
Please let me know if you see options to dig into this problem.

Thanks for any help,
Damien 

Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.
