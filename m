From: Michael.Forkey at elektrobit.com <Michael.Forkey@elektrobit.com>
Date: Tue, 27 May 2008 15:55:35 -0700
Subject: [Buildroot] Q: Problem building libgtk2 - libcups?
Message-ID: <C681C76E0D5F1E4BB01DE79E0A80EEC7765E4E@usrdes03.ebgroup.elektrobit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot-20080523 with the 5 patches Daniel Laird posted to this
mailing list on Friday 5/23/2008.

I am having a problem building libcups as part of libgtk2 for the ARM9.
I get the following:
Linking pdftops...
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
/usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
libxpdf.a: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[2]: *** [pdftops] Error 1

It looks to me like the correct toolchain is being used - everything
says "arm-..." (i.e. gcc, ar, etc.) What else should I check?

Is the cups library really needed for libgtk2? I haven't seen any
reference to it as a requirement in anything I've read about GTK+. I
don't need printing support. Can I disable building this library?


Thanks,
mf



----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080527/048c6288/attachment.htm 
