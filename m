From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 08:54:03 +0100
Subject: [Buildroot] [git commit] package/qemu: fix host-qemu variable
	names
In-Reply-To: <CAB0FRssD6gVDPgm2gjRHy_zgkCfjiB0thSb3-DpJGXTbMv97gQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Fri, 14 Dec 2012
 08:01:31 +0100")
References: <20121213235339.E8BC99A1F2@busybox.osuosl.org>
 <CAB0FRssD6gVDPgm2gjRHy_zgkCfjiB0thSb3-DpJGXTbMv97gQ@mail.gmail.com>
Message-ID: <87a9thjch0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 Fran?ois> 2012/12/14 Peter Korsgaard <jacmet@sunsite.dk>:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=6f7884c81461bdb35ff47da9cd84c8a8ca5d57cb
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> With the upcoming introduction of qemu-on-target, we need to properly
 >> separate the variables used for the host qemu, from the variables
 >> used for the target qemu.
 >> 

 Fran?ois> you've missed the last line of qemu.mk :
 Fran?ois>  # variable used by other packages
 Fran?ois> -QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(QEMU_ARCH)
 Fran?ois> +QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)

Ahh yes, I'll fix that - Thanks.

-- 
Bye, Peter Korsgaard
