From: Hmidi Slim <hmidi.slim1@gmail.com>
Date: Wed, 19 Aug 2015 11:56:31 +0200
Subject: [Buildroot] how to configure the ip address of beaglebone?
In-Reply-To: <20150819115212.61ed0b97@free-electrons.com>
References: <CA+yqE79AfRuHWa26Sg6zcs8YYjxx1y-Khdp6nY1L5C_uXsevMQ@mail.gmail.com>
 <20150819111224.1126ad7c@free-electrons.com>
 <CA+yqE78WYbzyA9QcQ0ZwdRJZc4_yidePmuXQ2T9CUG-f8r3q+A@mail.gmail.com>
 <20150819115212.61ed0b97@free-electrons.com>
Message-ID: <CA+yqE7_Xk94ePiraMptq7-bv+6svqY1i5JCtzimMcK6kPC5jWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got these message errors:
/sbin/ldconfig.real: Can't open configuration file
/home/slim/Bureau/projet_stage/buildroot/output/target/etc/ld.so.conf: No
such file or directory
/sbin/ldconfig.real: /usr/lib/libstdc++.so.6.0.19-gdb.py is not an ELF file
- it has the wrong magic bytes at the start.

( \
echo "NAME=Buildroot"; \
echo "VERSION=2015.05"; \
echo "ID=buildroot"; \
echo "VERSION_ID=2015.05"; \
echo "PRETTY_NAME=\"Buildroot 2015.05\"" \
) >  /home/slim/Bureau/projet_stage/buildroot/output/target/etc/os-release
>>>   Copying overlay board/felabs/beagleboneblack/rootfs-overlay
rsync: change_dir
"/home/slim/Bureau/projet_stage/buildroot//board/felabs/beagleboneblack/rootfs-overlay"
failed: No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors)
(code 23) at main.c(1070) [sender=3.0.9]
make: *** [target-finalize] Error 23


2015-08-19 11:52 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Hmidi Slim,
>
> Please don't reply to me directly. Keep the list in Cc.
>
> Thanks,
>
> Thomas
>
> On Wed, 19 Aug 2015 11:25:18 +0200, Hmidi Slim wrote:
> > I got these message errors:
> > /sbin/ldconfig.real: Can't open configuration file
> > /home/slim/Bureau/projet_stage/buildroot/output/target/etc/ld.so.conf: No
> > such file or directory
> > /sbin/ldconfig.real: /usr/lib/libstdc++.so.6.0.19-gdb.py is not an ELF
> file
> > - it has the wrong magic bytes at the start.
> >
> > ( \
> > echo "NAME=Buildroot"; \
> > echo "VERSION=2015.05"; \
> > echo "ID=buildroot"; \
> > echo "VERSION_ID=2015.05"; \
> > echo "PRETTY_NAME=\"Buildroot 2015.05\"" \
> > ) >
> /home/slim/Bureau/projet_stage/buildroot/output/target/etc/os-release
> > >>>   Copying overlay board/felabs/beagleboneblack/rootfs-overlay
> > rsync: change_dir
> >
> "/home/slim/Bureau/projet_stage/buildroot//board/felabs/beagleboneblack/rootfs-overlay"
> > failed: No such file or directory (2)
> > rsync error: some files/attrs were not transferred (see previous errors)
> > (code 23) at main.c(1070) [sender=3.0.9]
> > make: *** [target-finalize] Error 23
> >
> >
> > My .config:http://pastebin.com/MhtrBCzA
> >
> > 2015-08-19 11:12 GMT+02:00 Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com>:
> >
> > > Dear Hmidi Slim,
> > >
> > > On Wed, 19 Aug 2015 02:37:30 +0200, Hmidi Slim wrote:
> > >
> > > > I followed the tutorial of free electrons to use rootfs overlay to
> > > > configure ip address but when I run make I got
> > > > board/felabs/rootfs-overlay no such file or directory
> > >
> > > Because the path to your overlay is wrong. But that's all we can say
> > > since you don't provide the necessary details to allow us to give a
> > > more detailed answer.
> > >
> > > Please read
> http://www.catb.org/esr/faqs/smart-questions.html#beprecise.
> > >
> > > Best regards,
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Free Electrons
> > > Embedded Linux, Kernel and Android engineering
> > > http://free-electrons.com
> > >
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150819/314bfe27/attachment.html>
