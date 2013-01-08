From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 15:31:24 +0100
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <324F5873D88A41258846A0BE8F0F4556@beraninstruments.com.local>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <CAKvQZ_0f=ka=G_66J4kt_mqn_CvnjqpHMUyv-tBa7SQ-LMtMRw@mail.gmail.com>
 <324F5873D88A41258846A0BE8F0F4556@beraninstruments.com.local>
Message-ID: <20130108153124.658fe4e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Moore,

On Tue, 8 Jan 2013 14:15:01 -0000, Will Moore wrote:

> I currently configure the eclipse project to pick up the buildroot built cross
> tools, built my executables in eclipse, run Dropbear on the target, scp my
> executables to the target, in a ssh connection run gdbserver, and configure
> eclipse to remote debug using the builtroot built cross tools.  I know from QNX
> Momentics there are much slicker ways ...

Indeed, what we have now is much better. Thanks to the developments
done by M?lanie (Cc'ed), we have an Eclipse plug-in that:

 * Automatically detects the Buildroot toolchains that are available on
   your system, and allows you to select between them. It will
   automatically adjust the compiler/flags used for compiling your
   programs (if you're using the "managed build" mechanism of Eclipse,
   which is the mechanism where Eclipse builds your application for
   you, as opposed to using external Makefile, CMake or something like
   that).

 * Can automatically copy your application over SSH when you hit the
   "Run" button, or copy the application + start gdbserver
   automatically if you hit the "Debug" button.

 * Provides a nice list of libraries that are compiled in your
   Buildroot project (and providing a pkg-config .pc file). You just
   have to click on a particular library to make your application link
   against this library. That's the newest feature that has been
   integrated :-)

M?lanie will work on polishing the update site to make it easy to
install all this, and in writing the necessary tutorials. We'll keep
you posted once it is ready, but we are definitely looking forward for
your tests and experimentations in order to get feedback and be able to
do further improvements on this plug-in.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
