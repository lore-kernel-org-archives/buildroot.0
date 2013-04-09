From: Arunkumar Vijayakumar <arun.magzion@gmail.com>
Date: Wed, 10 Apr 2013 02:49:24 +0530
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <20130409201651.35dc862f@skate>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
 <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
 <20130408233156.0ab27a38@skate>
 <CAGK4xy49Dm1G0J3w2CUzHZ2=2bObyd8i94e1mdYnzy8vTJg-KQ@mail.gmail.com>
 <CAGK4xy4fnpOkmYJJ_+YoXJHG2Rf6BrxMyXTjjYHtDDp_R8zM8g@mail.gmail.com>
 <20130409201651.35dc862f@skate>
Message-ID: <CAGK4xy7fch-cGi66rLovOo8mRvRrif7Pzg_MF89vy46H5VH0SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

I found the issue with the cross compiler and fixed it. Now when I tried
executing wine package using
$ make wine v=1 in buildroot

It throwed an error stating to use --with-wine-tools for cross compiling,
hence I used
WINE_CONF_OPT = --with-wine-tools=$(BUILD_DIR)/wine-$(WINE_VERSION)

Again I got an error of missing Xlib/Xfree86 package, though I have
installed those using apt-get install xorg xorg-dev *libx*11-dev in my
ubuntu 12.04 desktop system.

But it didnt work hence i forced to use the following line in .mk file and
it got worked.
WINE_CONF_OPT += --x-libraries=/usr/lib/X11
WINE_CONF_OPT += --x-includes=/usr/include/X11
WINE_CONF_OPT += --with-x

My point is,
1. Will including the path in .mk file (--x-libraries=/usr/lib/X11)  while
compiling for embedded system require the same folders in the Initrd and
binaries?
2. Do I need to include xorg graphics package for the same and if so, will
it be created in the same path like the above one ?

Thanks
Arun Kumar

On Tue, Apr 9, 2013 at 11:46 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Arunkumar Vijayakumar,
>
> On Tue, 9 Apr 2013 04:10:04 +0530, Arunkumar Vijayakumar wrote:
>
> > I tried with the autotools options as per your suggestion and got the
> > error, please find the attached config.log for your kind reference.
> >
> > Kindly advice me where Im making mistakes ?
>
> It doesn't find the cross-compiler, so something looks really wrong in
> your Buildroot build.
>
> Can you do:
>
>         make clean
>         make 2>&1 | tee build.log
>
> Put the contents of build.log on some pastebin site, and give us the
> URL?
>
> Please also pastebin your Buildroot .config file.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130410/5f64cbb8/attachment.html>
