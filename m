From: Nigel Sollars <nsollars@gmail.com>
Date: Mon, 21 Jan 2013 14:29:54 -0500
Subject: [Buildroot] buildroot gcc for target build fail
In-Reply-To: <20130121184339.7061aa15@skate>
References: <CAG6aBkWm1gHehkXDcscL1Jn+nHwM-u7uG_9dEwS6hSmQgwLCaA@mail.gmail.com>
 <20130121184339.7061aa15@skate>
Message-ID: <CAG6aBkUwj0MaukijdOK6KTDvpCRty0q4pj5=gdYkj_iO_1Mm0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My use case for the panda is basically building out a set of tools for in
car info,  In a vehicle I have a OBD2 to Bluetooth adapter, which I am
looking at with some code tie the data / commands to the sqlite db to poll
the obd2 device for information on what ever the ECU can provide.

Also I am adding a couple of enhancements by way of RF ( 433 ) and canbus
to the vehicle for more monitoring / stats.

My setup / build env consists of the pandaboard / add on boards / cards,  I
attached an external USB HDD so building native would be plausable.  Having
a native compiler is just convenient really.  In my environment its just
cleaner as I have a number of external C / C++ libs in check.

Regards
Nigel

On Mon, Jan 21, 2013 at 12:43 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Nigel Sollars,
>
> On Mon, 21 Jan 2013 08:19:22 -0500, Nigel Sollars wrote:
>
> > After trying to build a more upto date buildroot I seemed to
> > encounter this issue
> >
> > --
> >
> > checking whether to use setjmp/longjmp exceptions... unknown
> > configure: error: unable to detect exception model
> > make[2]: *** [configure-target-libgcc] Error 1
> > make[2]: Leaving directory
> >
> `/usr/local/buildroot-src/source/buildroot-2013.01/output/build/gcc-4.7.2-target'
>
> Unfortunately, we have decided to deprecate the support for building a
> toolchain for the target. We believe that in the context of Buildroot,
> this is not necessary, and nobody was working on it to fix the problems.
>
> The reasons we believe it is not necessary are:
>
>  * Buildroot is generally used to build relatively small/simple
>    systems, on which we generally don't do development on the target.
>    If your system is so big and huge that you need to do development on
>    the target, maybe a binary distributions like Debian or Ubuntu is
>    more appropriate?
>
>  * Buildroot is at its core a cross-compilation tool. So if you want to
>    build libraries or applications for the target, what we recommend is
>    to use the cross-compiler that Buildroot creates. It is very easy to
>    create new packages in Buildroot, or even to build your own
>    application outside of Buildroot, using the Buildroot cross-compiler.
>
> In any case, I'm interested in understanding better your use case. The
> support for building gcc on the target has been marked deprecated, but
> not removed, for the very reason that we wanted to get feedback from
> users of this feature, and see what are the use cases for it.
>
> Thanks a lot,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/d1ab0627/attachment.html>
