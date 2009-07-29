From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jul 2009 20:59:35 +0200
Subject: [Buildroot] linux .config : override: reassigning to symbol
	AEABI
In-Reply-To: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	(Damien Courousse's message of "Wed\,
	29 Jul 2009 14\:59\:14 +0200")
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
Message-ID: <87vdlbxqlk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Courousse, Damien <damien.courousse@logica.com> writes:

 Damien> The kernel loading gets stuck after mounting the NFS root : 
 Damien> ================================================================
 Damien> ....
 Damien> IP-Config: Complete:
 Damien>      device=eth0, addr=10.84.34.8, mask=255.255.255.192, gw=10.84.34.1,
 Damien>      host=debian_test, domain=, nis-domain=(none),
 Damien>      bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
 Damien> Looking up port of RPC 100003/2 on 10.84.34.52
 Damien> Looking up port of RPC 100005/1 on 10.84.34.52
 Damien> VFS: Mounted root (nfs filesystem).
 Damien> Freeing init memory: 116K
 Damien> Kernel panic - not syncing: Attempted to kill init!

Do you use softfloat or fpu emulation in the kernel? (check
BR2_SOFT_FLOAT).

-- 
Bye, Peter Korsgaard
