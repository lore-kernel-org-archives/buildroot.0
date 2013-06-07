From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 10:08:24 +0200
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
 <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
 <CAMYPSMppGbVCw451=gaDOvROj=HLpYd1z9HRg5ujA9N2cu7q0w@mail.gmail.com>
 <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
Message-ID: <20130607100824.2cc5e5e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Thu, 6 Jun 2013 11:20:05 -0700, Charles Krinke wrote:

> Your new patch looks like the only difference is the line changing
> package/opengl/libgles/libgles.mk from
> 
> -ifeq ($(LIBGLES_DEPENDENCIES),)
> +ifeq ($(LIBGLES_DEPENDENCIES),y)

The first line is the correct one. The second line was the one
originally introduced, but it was a bug. The idea here is that if
LIBGLES has no dependencies, then it means that no OpenGL
implementation was selected.

> I still get the same error when compiling Qt and that is:
> 
> patching file mkspecs/common/posix/qplatformdefs.h
> >>> libgles undefined Configuring
> >>> libgles undefined Building
> >>> libgles undefined Installing to target
> >>> libegl undefined Extracting
> >>> libegl undefined Patching package/opengl//libegl
> >>> libegl undefined Configuring
> echo "No libEGL implementation selected. Configuration error."

This happens when no package provides a libEGL implementation, i.e
LIBEGL_DEPENDENCIES is empty.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
