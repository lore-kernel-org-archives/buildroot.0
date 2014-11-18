From: Peder Alm <peder.alm@semcon.com>
Date: Tue, 18 Nov 2014 13:43:46 +0000
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <87389gr6pi.fsf@dell.be.48ers.dk>
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>,
 <87389gr6pi.fsf@dell.be.48ers.dk>
Message-ID: <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter

> -8 is ENOEXEC, E.G. most likely invalid ELF variant.
>
> Your kernel is running in big endian mode, right?

How do I know if my kernel is running in BE mode? I have just changed the settings in Buildroot configuration. I found no settings for BE mode in the Linux kernel configuration when I added support for NFS.

I found this:
- ELF file magic:
- "\x7F""ELF"
- 0x464C457F on little endian machine
- 0x7F454C46 on big endian machine

It feels like modprobe is trying to load binfmt-464c to read the "inverted" ELF file (46='F', 4c='L').
