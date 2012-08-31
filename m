From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 00:23:09 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831002309.C112B993FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #2 from twobob <seetwobob@live.co.uk> 2012-08-31 00:23:09 UTC ---
Created attachment 4532
  --> https://bugs.busybox.net/attachment.cgi?id=4532
the dot config file used.

The relevant dot config and the lines from the build log


{standard input}: Assembler messages:
{standard input}:6196: rdhi, rdlo and rm must all be different
  CC     gunibreak.lo
  CC     gunicollate.lo
  CC     gunidecomp.lo
  CC     gurifuncs.lo
  CC     gutils.lo
  CC     gvariant.lo
  CC     gvariant-core.lo
  CC     gvariant-parser.lo
  CC     gvariant-serialiser.lo
gvariant-core.c: In function 'g_variant_take_ref':
gvariant-core.c:744: warning: pointer targets in passing argument 1 of
'g_atomic_int_and' differ in signedness
  CC     gvarianttypeinfo.lo
{standard input}: Assembler messages:
{standard input}:46059: rdhi, rdlo and rm must all be different
{standard input}:46074: rdhi, rdlo and rm must all be different
{standard input}:46086: rdhi, rdlo and rm must all be different
{standard input}:46098: rdhi, rdlo and rm must all be different
{standard input}:46480: rdhi, rdlo and rm must all be different
{standard input}:47837: rdhi, rdlo and rm must all be different
{standard input}:47865: rdhi, rdlo and rm must all be different
{standard input}:47875: rdhi, rdlo and rm must all be different
{standard input}:47887: rdhi, rdlo and rm must all be different
  CC     gvarianttype.lo
  CC     gwakeup.lo
  CC     gprintf.lo
  CC     glib-unix.lo
  CC     giounix.lo
  CC     gspawn.lo
echo glib-unix.h glib-object.h glib.h galloca.h garray.h gasyncqueue.h
gatomic.h gbacktrace.h gbase64.h gbitlock.h gbookmarkfile.h gcache.h
gchecksum.h gcompletion.h gconvert.h gdataset.h gdate.h gdatetime.h gdir.h
gerror.h gfileutils.h ghash.h ghmac.h ghook.h ghostutils.h gi18n.h gi18n-lib.h
giochannel.h gkeyfile.h glist.h gmacros.h gmain.h gmappedfile.h gmarkup.h
gmem.h gmessages.h gnode.h goption.h gpattern.h gpoll.h gprimes.h gqsort.h
gquark.h gqueue.h grand.h gregex.h grel.h gscanner.h gsequence.h gshell.h
gslice.h gslist.h gspawn.h gstdio.h gstrfuncs.h gtestutils.h gstring.h
gthread.h gthreadpool.h gtimer.h gtimezone.h gtree.h gtypes.h gunicode.h
gurifuncs.h gutils.h gvarianttype.h gvariant.h gwin32.h gprintf.h >
glib-public-headers.txt.tmp && mv glib-public-headers.txt.tmp
glib-public-headers.txt
  CC     gtester.o
  CCLD   libglib-2.0.la
  CCLD   gtester
./.libs/libglib-2.0.so: undefined reference to `qsort_r'
collect2: ld returned 1 exit status
make[6]: *** [gtester] Error 1
make[5]: *** [all-recursive] Error 1
make[4]: *** [all] Error 2
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** [/home/simon/BLDS/buildroot/build/libglib2-2.30.2/.stamp_built]
Error 2
make: *** [all] Error 2
simon at dev ~/BLDS/buildroot $

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
