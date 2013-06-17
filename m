From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 17 Jun 2013 09:57:12 -0700
Subject: [Buildroot] qt5: No SOURCES in qmake created Makefiles
In-Reply-To: <20130617162213.1fdc7d97@skate>
References: <51BF198C.2040405@andin.de>
	<20130617162213.1fdc7d97@skate>
Message-ID: <CALo-6+jQ-qjc9HfFwTSUh1x6JQnTtH1XUOo0oX8f4nApVH=L7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas:

I am using a similar recipe with Qt-5.0.2 as with Qt-4.8.2 for out of
tree application builds, that is, exporting the PATH prefix to
output/host/usr/bin/qmake and now specifying the mkspec in
mkspec/devices/linux-buildroot-g++, so I can confirm this works and is
both finding the Qt5 *stuff* and the TI es3 *stuff*.

Now, I am using Wojeich's patch for the mkspec as it is a lot simpler
and actually works then the one that brings in the Graphics_SDK, but
lets assume that is not your issue.

Charles

On 6/17/13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Andreas Naumann,
>
> On Mon, 17 Jun 2013 16:13:32 +0200, Andreas Naumann wrote:
>
>> when using qt4 up till now I used the output/host/usr/bin/qmake to
>> prepare out of tree projects/examples for compilation. Worked like a
>> charm and i was very happy being able to use a consistent toolchain for
>> that.
>
> Using output/host/usr/bin/qmake is indeed the correct way and is
> supposed to do the right thing in terms of toolchain and flags and so
> on.
>
>> However when I try the same with the qt5 qmake binary, the the SOURCES
>> of the .pro file (and maybe other options) dont make it into the
>> Makefile.
>
> Can you clarify exactly what happens?
>
>> So running make results in "Nothing to do for target first".
>> Have you or anybody else successfully compiled out of tree qt5
>> applications and if so how? Or, are there any examples on writing a
>> package for qt5 applications?
>
> It has been a few months now, but when I did the Qt5 packaging, I'm
> pretty sure I did test a sample Hello World application that was
> compiled "out of tree" (i.e not a Buildroot package) with
> output/host/usr/bin/qmake. There may have been some regressions/issues
> in the mean time, though.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Charles Krinke
