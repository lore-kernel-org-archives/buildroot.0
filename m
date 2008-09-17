From: Flemming Madsen <madsenco@gmail.com>
Date: Wed, 17 Sep 2008 15:02:30 +0200
Subject: [Buildroot] Fwd: Cannot build uclibc++ against toolchain
	(dl_iterate_phdr & __tls_get_addr): RESOLVED
Message-ID: <97e646690809170602m38955734lf837a0098938ab97@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for all the replies. For now i have fixed it in two ways:


__tls_get_addr:
   Easy, My fault: Configure uclibc++ to NOT use TLS (Duh!)

dl_iterate_phdr:
  For some reason, in uClibc,  this lives in libdl.a, NOT in libdl.so or libc.so
  I patched Rules.mak in the toplevel dir to link with -Wl,-Bstatic
-ldl -Wl,-Bdynamic

It remains to be seen whether this will actually run on the target ...

/Flemming
