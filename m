From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 17:54:51 +0200
Subject: [Buildroot] Does buildroot toolchain support GNU EABI?
In-Reply-To: <CAAsE_ufrpUoERp3h34xz6GRqNtikoxtZVa3h_-Zz676VrU6+ow@mail.gmail.com>
References: <20130522092041.GA15526@zuhnb712.ap.bm.net>
 <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
 <20130522135132.09bee9dc@skate>
 <CAAsE_ufrpUoERp3h34xz6GRqNtikoxtZVa3h_-Zz676VrU6+ow@mail.gmail.com>
Message-ID: <20130522175451.4c16fa6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Wed, 22 May 2013 23:04:31 +0800, Woody Wu wrote:

> > On Wed, 22 May 2013 11:33:56 +0200, Yegor Yefremov wrote:
> >
> > > BR toolchains are always EABI unless you specify it to generate OABI
> > > binaries. See Wikipaedia for EABI info:
> > > http://en.wikipedia.org/wiki/EABI#EABI
> >
> > The support for OABI has been deprecated in Buildroot since
> > c4cfa85b798cb744954d35aa05fa41e7a6956abd. I even believe it has been
> > deprecated or maybe removed from the latest version of gcc.
> 
> Did you mean the GNU EABI is the OABI?

No. You have two ABIs:

 * OABI, Original ABI (or "Old" ?), which was used by the Linux world
   on ARM platforms before ARM (the company) standardized an ABI. This
   ABI is deprecated, both in Buildroot and upstream in gcc, if I
   remember correctly.

 * EABI, Enhanced ABI, which is known in the Linux world as GNU EABI.
   So when you have a arm-linux-gnueabi toolchain, or
   arm-linux-uclibcgnueabi toolchains, those are using this EABI. This
   ABI is standardized by ARM. And Buildroot always uses this ABI when
   it generates a toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
