From: Terry Bolinger <tbolinger@webmtn.com>
Date: Thu, 23 Aug 2007 13:16:11 -0600
Subject: [Buildroot] Make error
Message-ID: <20070823193650.3F628A65C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are attempting to run Buildroot and create an image for an Atmel 9263-EK
development board.  As we run buildroot, we have run into several errors,
and have been able to work past them. However, we are now running into this
error and so far, we've been unable to determine what our problem is. Here
is the text of the error.  Notice that it does not like garray.o - could not
read symbols:  File in wrong format.

 

echo "{ global:" > .libs/libglib-2.0.ver

cat .libs/libglib-2.0.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libglib-2.0.ver

echo "local: *; };" >> .libs/libglib-2.0.ver

g77 -shared  .libs/garray.o .libs/gasyncqueue.o .libs/gatomic.o
.libs/gbacktrace.o .libs/gbase64.o .libs/gbookmarkfile.o .libs/gcache.o
.libs/gcompletion.o .libs/gconvert.o .libs/gdataset.o .libs/gdate.o
.libs/gdir.o .libs/gerror.o .libs/gfileutils.o .libs/ghash.o .libs/ghook.o
.libs/giochannel.o .libs/gkeyfile.o .libs/glist.o .libs/gmain.o
.libs/gmappedfile.o .libs/gmarkup.o .libs/gmem.o .libs/gmessages.o
.libs/gnode.o .libs/goption.o .libs/gpattern.o .libs/gprimes.o
.libs/gqsort.o .libs/gqueue.o .libs/grel.o .libs/grand.o .libs/gscanner.o
.libs/gshell.o .libs/gslice.o .libs/gslist.o .libs/gstdio.o
.libs/gstrfuncs.o .libs/gstring.o .libs/gthread.o .libs/gthreadpool.o
.libs/gtimer.o .libs/gtree.o .libs/guniprop.o .libs/gutf8.o
.libs/gunibreak.o .libs/gunicollate.o .libs/gunidecomp.o .libs/gutils.o
.libs/gprintf.o .libs/giounix.o .libs/gspawn.o -Wl,--whole-archive
libcharset/.libs/libcharset.a gnulib/.libs/libgnulib.a
-Wl,--no-whole-archive  -lintl  -Wl,-soname -Wl,libglib-2.0.so.0
-Wl,-version-script -Wl,.libs/libglib-2.0.ver -o
.libs/libglib-2.0.so.0.1200.9

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)

.libs/garray.o: could not read symbols: File in wrong format

collect2: ld returned 1 exit status

make[5]: *** [libglib-2.0.la] Error 1

make[5]: Leaving directory
`/home/terry/Desktop/buildroot/build_arm/glib-2.12.9/glib'

make[4]: *** [all-recursive] Error 1

make[4]: Leaving directory
`/home/terry/Desktop/buildroot/build_arm/glib-2.12.9/glib'

make[3]: *** [all] Error 2

make[3]: Leaving directory
`/home/terry/Desktop/buildroot/build_arm/glib-2.12.9/glib'

make[2]: *** [all-recursive] Error 1

make[2]: Leaving directory
`/home/terry/Desktop/buildroot/build_arm/glib-2.12.9'

make[1]: *** [all] Error 2

make[1]: Leaving directory
`/home/terry/Desktop/buildroot/build_arm/glib-2.12.9'

make: ***
[/home/terry/Desktop/buildroot/build_arm/glib-2.12.9/glib/.libs/libglib-2.0.
a] Error 2

 

We've searched through the mailing list archives and have not found what we
think is a match to this error.  We are very new to embedded development, so
we're struggling through this. I've attached our config file, in case it
might be helpful.  Many of the configuration options we didn't understand,
so we just left them as the defaults. Our development PC is running Ubuntu
7.04.

 

Any assistance would be greatly appreciated.

 

Terry Bolinger

Web Mountain Technologies

www.webmtn.com

tbolinger at webmtn.com

303-627-1856

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070823/2730b85e/attachment-0001.htm 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: config.txt
Url: http://busybox.net/lists/buildroot/attachments/20070823/2730b85e/attachment-0001.txt 
