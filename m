From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 17:23:52 +0200
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <CALo-6+j5W7OERo3dtuUqzmcidq2tcR=BobM_d6NWt2iMx-s0tQ@mail.gmail.com>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
 <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
 <CAMYPSMppGbVCw451=gaDOvROj=HLpYd1z9HRg5ujA9N2cu7q0w@mail.gmail.com>
 <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
 <20130607100824.2cc5e5e0@skate>
 <CALo-6+j5W7OERo3dtuUqzmcidq2tcR=BobM_d6NWt2iMx-s0tQ@mail.gmail.com>
Message-ID: <20130607172352.091a3888@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Fri, 7 Jun 2013 07:44:09 -0700, Charles Krinke wrote:

> I can seem to get past this error by enabling "rpi-userland" which
> does define LIBGLES_DEPENDENCIES, but this seems like the wrong answer
> to me.

Enabling rpi-userland provides an EGL implementation that works on the
RasberryPi, so obviously, this isn't going to work for you.

> Perhaps there is a different configuration setting somewhere
> else that defines sufficient configuration for the AM3517 that I have
> missed?

Spenser is creating a Buildroot package that properly packages the
OpenGL/EGL implementation for OMAP/AM3xxx. I hope he can post that soon.

> I just did a make clean && make after defining "rpi-userland" and the
> compilation completed with a libQt5OpenGL.so.5.0.2 about 300KBytes in
> size, so something seems to have worked.
> 
> Would it be correct that LIBGLES_DEPENDENCIES may just have to be
> defined to "anything" so we could put into qt5base/qt5.mk a line that
> says
> 
> LIBGLES_DEPENDENCIES += any_string_will_do
> 
> and expect success?

Well, if you install manually your OpenGL and EGL libraries, maybe. But
that's ugly. The libegl and libopengl packages are virtual packages,
and one package is supposed to provide one EGL and one OpenGL
implementation for your specific SoC.

Spenser, can you update us on your patches? Even if there's not fully
ready, posting them with a RFC tag would allow Charles and Wojchiech to
experiment with them.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
