From: Jorge S. <jorgesolla@gmail.com>
Date: Mon, 8 Oct 2007 19:46:10 +0200
Subject: [Buildroot] Best buildroot options for a custom AT91RM9200
	board?
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C0246F764@ehost011-3.exch011.intermedia.net>
References: <6090c5eb0710080804n3f6d4f0bj42b0d31d24d01e9@mail.gmail.com>
	<406A31B117F2734987636D6CCC93EE3C0246F764@ehost011-3.exch011.intermedia.net>
Message-ID: <6090c5eb0710081046x54023731na621a1900998738a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/10/8, Leonid <Leonid@a-k-a.net>:
>
> Hi, Jorge:


Hi again, and thanks for your help.


> > I've started with the svn version of buildroot and after dealing with
> lots of "soft-float"/uCLibc problems
> > finally discovered that there's a prebuilt setup from the Atmel people
> that seems to work.
>
> [snip]
>
> > 1) Last buildroot svn version
> > 2)
> ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_
> Host/Buildroot/buildroot-20070116-RC2.tar.bz2
>
> LB: I couldn't make option 1 working for me, but that probably was
> because I was really newbie for builsroot couple weeks ago. I may try
> again in future. After all I used second option successfully.


I'm still working on it this afternoon and i can confirm that option 1 (last
svn version from buildroot) produces a working
toolchain just using the "at91rm9200df_defconfig". When i say working i mean
it its able to build the toolchain,uCLibc, Busybox, Boa web server, libcgic,
libsqlite and some other tools, still untested on the target system.

I was trying to build wireless-tools since i'm planning to use a wifi
usb-gadget on my board but compilation failed, i will try to solve this
tomorrow.

Try:

     make at91rm9200df_defconfig
    and then...make



    After solving a few errors with broken urls while the script downloads
sources,you get the toolchain and the rootfs.

   By default it creates a 36MB rootfs, so i disabled most of the sections
and now i have a 4,4MB rootfs.


Jorge.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071008/668a1eee/attachment.htm 
