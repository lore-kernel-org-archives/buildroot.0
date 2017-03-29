From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Mar 2017 23:28:56 +0200
Subject: [Buildroot] [PATCH 4/5] package/mesa3d: explicitely disable asm
In-Reply-To: <hgqrqdxivc.ln2@ID-313208.user.individual.net>
References: <20170326162853.3022-1-romain.naour@gmail.com>
 <20170326162853.3022-4-romain.naour@gmail.com>
 <hgqrqdxivc.ln2@ID-313208.user.individual.net>
Message-ID: <49fce2a1-49a7-317c-486f-b3b6c37604a9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, All,

Le 29/03/2017 ? 06:41, Bernd Kuhls a ?crit :
> Am Sun, 26 Mar 2017 18:28:52 +0200 schrieb Romain Naour:
> 
>> assembly are enabled by default on supported plaforms even while
>> crosscompiling if host == target:
>>
>> checking whether to enable assembly... yes, x86_64
>>
>> It was also disabled in the mesa package in Fedora since 7.6 [1].
>>
>> [1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726
> 
> Hi,
> 
> I am unsure about this patch, why shouldn't we use asm code when 
> crosscompiling for host == target CPU?

To be honest I don't really have an issue with assembly being enabled for my use
case. But there is an issue when you want a reproducible build with the same
defconfig build on a x86 and x86_64 host.

Let see what other think.

Best regards,
Romain

> Fedora disabled it due to problems with selinux, Gentoo did something 
> similar: https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/mesa/
> mesa-17.0.2.ebuild#n302.
> Debian disabled asm only for x32: https://anonscm.debian.org/git/pkg-xorg/
> lib/mesa.git/tree/debian/rules?h=debian-experimental#n111
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
