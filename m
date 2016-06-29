From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 13:03:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: bump to patchlevel 46
In-Reply-To: <1467179883-27512-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 29 Jun 2016 07:58:03 +0200")
References: <1467179883-27512-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87a8i4i7f1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I was going to apply this, but it doesn't work:


make bash-patch
bash-4.3.30.tar.gz: OK (sha256: 317881019bbf2262fb814b7dd8e40632d13c3608d2f237800a8828fbb8a640dd)
>>> bash 4.3.30 Extracting
gzip -d -c /var/lib/downloads/bash-4.3.30.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/bash-4.3.30   -xf -
>>> bash 4.3.30 Patching

Applying 0031-patchlevel-31.patch using patch:
patching file subst.h
patching file variables.c
Hunk #1 succeeded at 2517 (offset 13 lines).
Hunk #2 succeeded at 2568 (offset 13 lines).
Hunk #3 succeeded at 2698 (offset 13 lines).
patching file patchlevel.h

Applying 0032-patchlevel-32.patch using patch:
patching file jobs.c
patching file patchlevel.h

Applying 0033-patchlevel-33.patch using patch:
patching file shell.c
patching file builtins/read.def
patching file builtins/common.h
patching file bashline.c
patching file sig.c
patching file patchlevel.h

Applying 0034-patchlevel-34.patch using patch:
patching file builtins/set.def
patching file patchlevel.h

Applying 0035-patchlevel-35.patch using patch:
patching file lib/sh/unicode.c
patching file patchlevel.h

Applying 0036-patchlevel-36.patch using patch:
patching file variables.c
patching file patchlevel.h

Applying 0037-patchlevel-37.patch using patch:
patching file assoc.c
patching file patchlevel.h

Applying 0038-patchlevel-38.patch using patch:
patching file parse.y
patching file y.tab.c
patching file patchlevel.h

Applying 0039-patchlevel-39.patch using patch:
patching file arrayfunc.c
patching file patchlevel.h

Applying 0040-patchlevel-40.patch using patch:
patching file subst.c
patching file patchlevel.h

Applying 0041-patchlevel-41.patch using patch:
patching file bashline.c
patching file lib/readline/complete.c
patching file patchlevel.h

Applying 0042-patchlevel-42.patch using patch:
patching file parse.y
patching file y.tab.c
patching file patchlevel.h

Applying 0043-patchlevel-43.patch using patch:
can't find file to patch at input line 24
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-043
|
|Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
|
|                            BASH PATCH REPORT
|                            =================
|
|Bash-Release:  4.3
|Patch-ID:      bash43-043
|
|Bug-Reported-by:       lolilolicon <lolilolicon@gmail.com>
|Bug-Reference-ID:      <CAMtVo_MF16KWanCB4C8WxA88Qt26zWsvV6V7+_U2fM0E6tCDxw@mail.gmail.com>
|Bug-Reference-URL:     http://lists.gnu.org/archive/html/bug-bash/2014-08/msg00040.html
|
|Bug-Description:
|
|When the lastpipe option is enabled, the last component can contain nested
|pipelines and cause a segmentation fault under certain circumestances.
|
|Patch (apply with `patch -p0'):
|
|*** ../bash-4.3-patched/execute_cmd.c  2014-07-30 10:26:52.000000000 -0400
|--- execute_cmd.c      2014-08-15 08:55:24.000000000 -0400
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 51
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|*** ../bash-4.3/patchlevel.h   2012-12-29 10:47:57.000000000 -0500
|--- patchlevel.h       2014-03-20 20:01:28.000000000 -0400
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch failed!  Please fix 0043-patchlevel-43.patch!
package/pkg-generic.mk:165: recipe for target '/home/peko/source/buildroot/output/build/bash-4.3.30/.stamp_patched' failed
make: *** [/home/peko/source/buildroot/output/build/bash-4.3.30/.stamp_patched] Error 1

-- 
Bye, Peter Korsgaard
