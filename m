From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 28 May 2008 01:50:27 -0700 (PDT)
Subject: [Buildroot] Q: Problem building libgtk2 - libcups?
In-Reply-To: <C681C76E0D5F1E4BB01DE79E0A80EEC7765E4E@usrdes03.ebgroup.elektrobit.com>
References: <C681C76E0D5F1E4BB01DE79E0A80EEC7765E4E@usrdes03.ebgroup.elektrobit.com>
Message-ID: <17507928.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I removed cups from the dependencies list and added it the X dependencies. 
So that people who build X get cups else none.

I agree that cups is a bit over the top for a gtk->directfb system where one
can presume size is important.  For me building for a STB cups is not
useful.

You will also need to change Config.in to make sure CUPS is not enabled by
default.

Dan


Michael.Forkey wrote:
> 
> buildroot-20080523 with the 5 patches Daniel Laird posted to this
> mailing list on Friday 5/23/2008.
> 
> I am having a problem building libcups as part of libgtk2 for the ARM9.
> I get the following:
> Linking pdftops...
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> /usr/bin/ld: libxpdf.a(gmem.o): Relocations in generic ELF (EM: 40)
> libxpdf.a: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> make[2]: *** [pdftops] Error 1
> 
> It looks to me like the correct toolchain is being used - everything
> says "arm-..." (i.e. gcc, ar, etc.) What else should I check?
> 
> Is the cups library really needed for libgtk2? I haven't seen any
> reference to it as a requirement in anything I've read about GTK+. I
> don't need printing support. Can I disable building this library?
> 
> 
> Thanks,
> mf
> 
> 
> 
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/Q%3A-Problem-building-libgtk2---libcups--tp17501911p17507928.html
Sent from the BuildRoot mailing list archive at Nabble.com.
