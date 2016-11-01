From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:30:31 +0100
Subject: [Buildroot] [PATCH v3 6/9] lttng-babeltrace: bump to version
 1.4.0
In-Reply-To: <20161031074624.7576-7-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-7-eeppeliteloop@gmail.com>
Message-ID: <20161101153031.44d4e7c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 03:46:21 -0400, Philippe Proulx wrote:
> Current patches are dropped because they were merged upstream.
> 
> Official upstream site of Babeltrace for the distribution of tarballs
> changed from lttng.org to efficios.com (see
> <http://diamon.org/babeltrace>).
> 
> Official Babeltrace's website changed from
> <http://www.efficios.com/babeltrace> to <http://diamon.org/babeltrace>.
> 
> I explicitly disable the support for debug informations in this patch to
> add it in a separate patch.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

This commit doesn't apply:

thomas at skate:~/projets/buildroot (master)$ git pwam 689227
Applying patch #689227 using 'git am -s -3'
Description: [v3,6/9] lttng-babeltrace: bump to version 1.4.0
Applying: lttng-babeltrace: bump to version 1.4.0
Using index info to reconstruct a base tree...
.git/rebase-apply/patch:55: space before tab in indent.
 	    # Check if libelf and libdw are present
.git/rebase-apply/patch:56: space before tab in indent.
 	    AC_CHECK_LIB([elf], [elf_version], [], [AC_MSG_ERROR(Missing libelf (from elfutils >= 0.154) which is required by debug info. You can disable this feature using --disable-debug-info.)])
.git/rebase-apply/patch:57: space before tab in indent.
 	    AC_CHECK_LIB([dw], [dwarf_begin], [], [AC_MSG_ERROR(Missing libdw (from elfutils >= 0.154) which is required by debug info. You can disable this feature using --disable-debug-info.)])
.git/rebase-apply/patch:203: space before tab in indent.
 		test_ctf_writer_complete
.git/rebase-apply/patch:208: space before tab in indent.
 	$(top_builddir)/lib/libbabeltrace.la \
error: patch failed: package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch:1
error: package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 lttng-babeltrace: bump to version 1.4.0
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

It seems that again, your patches are not correct.


> +@@ -268,7 +268,6 @@ AS_IF([test "x$_enable_debug_info" = xyes], [
> + 	    # Check if libelf and libdw are present
> + 	    AC_CHECK_LIB([elf], [elf_version], [], [AC_MSG_ERROR(Missing libelf (from elfutils >= 0.154) which is required by debug info. You can disable this feature using --disable-debug-info.)])
> + 	    AC_CHECK_LIB([dw], [dwarf_begin], [], [AC_MSG_ERROR(Missing libdw (from elfutils >= 0.154) which is required by debug info. You can disable this feature using --disable-debug-info.)])
> +-	    AX_LIB_ELFUTILS([0], [154], [], [AC_MSG_ERROR(elfutils >= 0.154 is required to use the debug info feature. You can disable this feature using --disable-debug-info.)])

Rather than removing a check, please add an autoconf cache variable, so
that we can override the result of the test using a cache variable, and
your patch can be submitted (and hopefully) accepted upstream.

I'm going to skip patches 7 to 9, since they also apply to
lttng-babeltrace.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
