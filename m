From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 11:14:49 +0100
Subject: [Buildroot] cannot compile a program within a uclibc build
	chroot
In-Reply-To: <50921F41.6040502@scalemp.com>
References: <50913F89.3000802@scalemp.com> <5091A1B2.7060407@mind.be>
 <50921057.2080606@scalemp.com> <20121101061028.GA17989@sapphire.tkos.co.il>
 <5092141C.8030100@scalemp.com> <20121101065835.GC17989@sapphire.tkos.co.il>
 <50921F41.6040502@scalemp.com>
Message-ID: <50924B99.5080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/12 08:05, Eial Czerwacki wrote:
> 09:03:00 $ find root -name "libc*"
> find: root/lost+found: Permission denied
> root/usr/include/bits/libc-lock.h
> _root/usr/lib/libc.a_
> root/usr/lib/libcrypt_pic.a
> root/usr/lib/libc_pic.a
> root/usr/lib/libcurses.a
> root/usr/lib/libcrypt.a
>
> from what I can understand, although I've marked it to be static as possible, not all packages can be linked to static
> libs, gcc is an example as it needs libc.so.0 rather than libc.a

  (it's actually as (from binutils), not gcc).

  Good catch!  With PREFER_STATIC, buildroot's uClibc doesn't install in the target.
I'll post an untested patch as a follow-up, can you test it?

  Note: the other part of the problem is that binutils sets --enable-shared
unconditionally.  But there may be other reasons for that.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
