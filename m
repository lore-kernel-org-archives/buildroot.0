From: James L Henrickson <jim.henrickson@critical.com>
Date: Fri, 24 Aug 2007 00:41:39 -0400
Subject: [Buildroot] Make error (Terry Bolinger)
In-Reply-To: <mailman.1210.1187897811.1110.buildroot@uclibc.org>
References: <mailman.1210.1187897811.1110.buildroot@uclibc.org>
Message-ID: <46CE6183.4090805@critical.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just for the heck of it, reorder your Makefile or whatever so that 
.libs/garray.o comes last.  If you get the same errors with the next 
file in the list, move that to the end and try again, and so on.  The 
object of this experiment is to see if all, or most, of the .o files 
have this problem, not just the garray.o file.  Is this a proprietary 
application, or an open source one that is allegedly supported by 
BuildRoot?  I'm a relative newbee to BuildRoot, but these would be the 
first things I would consider.  If all of the object files have this 
problem, the problem may be in the compiler (or the compiler version) 
that produced the .o files (g77?).  I don't know how many BuildRoot 
users use g77, if that's what you are creating your .o files with, but I 
don't use it.

Jim


"Terry Bolinger" <tbolinger@webmtn.com> wrote:

>Message: 1
>Date: Thu, 23 Aug 2007 13:16:11 -0600
>From: "Terry Bolinger" <tbolinger@webmtn.com>
>Subject: [Buildroot] Make error
>To: <buildroot@uclibc.org>
>Message-ID: <20070823193650.3F628A65C9@busybox.net>
>Content-Type: text/plain; charset="us-ascii"
>
>We are attempting to run Buildroot and create an image for an Atmel 9263-EK
>development board.  As we run buildroot, we have run into several errors,
>and have been able to work past them. However, we are now running into this
>error and so far, we've been unable to determine what our problem is. Here
>is the text of the error.  Notice that it does not like garray.o - could not
>read symbols:  File in wrong format.
>
> 
>
>echo "{ global:" > .libs/libglib-2.0.ver
>
>cat .libs/libglib-2.0.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libglib-2.0.ver
>
>echo "local: *; };" >> .libs/libglib-2.0.ver
>
>g77 -shared  .libs/garray.o .libs/gasyncqueue.o .libs/gatomic.o
>.libs/gbacktrace.o .libs/gbase64.o .libs/gbookmarkfile.o .libs/gcache.o
>.libs/gcompletion.o .libs/gconvert.o .libs/gdataset.o .libs/gdate.o
>.libs/gdir.o .libs/gerror.o .libs/gfileutils.o .libs/ghash.o .libs/ghook.o
>.libs/giochannel.o .libs/gkeyfile.o .libs/glist.o .libs/gmain.o
>.libs/gmappedfile.o .libs/gmarkup.o .libs/gmem.o .libs/gmessages.o
>.libs/gnode.o .libs/goption.o .libs/gpattern.o .libs/gprimes.o
>.libs/gqsort.o .libs/gqueue.o .libs/grel.o .libs/grand.o .libs/gscanner.o
>.libs/gshell.o .libs/gslice.o .libs/gslist.o .libs/gstdio.o
>.libs/gstrfuncs.o .libs/gstring.o .libs/gthread.o .libs/gthreadpool.o
>.libs/gtimer.o .libs/gtree.o .libs/guniprop.o .libs/gutf8.o
>.libs/gunibreak.o .libs/gunicollate.o .libs/gunidecomp.o .libs/gutils.o
>.libs/gprintf.o .libs/giounix.o .libs/gspawn.o -Wl,--whole-archive
>libcharset/.libs/libcharset.a gnulib/.libs/libgnulib.a
>-Wl,--no-whole-archive  -lintl  -Wl,-soname -Wl,libglib-2.0.so.0
>-Wl,-version-script -Wl,.libs/libglib-2.0.ver -o
>.libs/libglib-2.0.so.0.1200.9
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
>
>.libs/garray.o: could not read symbols: File in wrong format
>
>collect2: ld returned 1 exit status
>
>  
>
(snip)
