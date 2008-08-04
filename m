From: Marc Gauthier <marc@tensilica.com>
Date: Mon, 4 Aug 2008 14:53:12 -0700
Subject: [Buildroot] [PATCH] fix bash job control (was:
	my/etc/init.d/rcS won't run)
In-Reply-To: <IMyjSUFq.1217872591.9273960.beattie@localhost>
Message-ID: <BMEBLILHDELOCLHMCPHNGEMIHDAA.marc@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian Beattie wrote:
> On 8/4/2008, "Wade Berrier" <wberrier@gmail.com> wrote:
> >And now the actual patch :-P
> >
> >On Mon, Aug 4, 2008 at 10:35 AM, Wade Berrier <wberrier@gmail.com> wrote:
> >> Marc from the previous thread pointed me in the right direction to fix this.
> >>
> >> Attached is a patch to bash.mk so it builds correctly and can be used
> >> from busybox's init.

Thanks!  My init startup works with bash now.

> I tried the patch, but got the attched errors (edited for brevity)

Worked for me, although my version of buildroot is a few months old.  Here's my bash link line.  The one difference is that I get
jobs.o instead of your nojobs.o (which seems the source of your undefined symbols).

-Marc


rm -f bash
/mnt/vol1/marc/linuxtest/buildroot/build_xtensa_test_mmuhifi_b/staging_dir/usr/bin/xtensa_test_mmuhifi_b-linux-uclibc-gcc -L./builti
ns -L./lib/readline -L./lib/readline -L./lib/glob -L./lib/tilde  -L./lib/sh  -rdynamic  -g -O2 -o bash shell.o eval.o y.tab.o
general.o make_cmd.o print_cmd.o  dispose_cmd.o execute_cmd.o variables.o copy_cmd.o error.o expr.o flags.o jobs.o subst.o hashcmd.o
hashlib.o mailcheck.o trap.o input.o unwind_prot.o pathexp.o sig.o test.o version.o alias.o array.o arrayfunc.o braces.o bracecomp.o
bashhist.o bashline.o  list.o stringlib.o locale.o findcmd.o redir.o pcomplete.o pcomplib.o syntax.o xmalloc.o
signames.o -lbuiltins -lsh -lreadline -lhistory -lcurses -lglob -ltilde    -ldl
ls -l bash
-rwxr-xr-x  1 marc tensilica 2007410 Aug  4 12:47 bash
xtensa_test_mmuhifi_b-linux-size bash
   text    data     bss     dec     hex filename
 468064   20708   19188  507960   7c038 bash
make[1]: Leaving directory `/mnt/vol1/marc/linuxtest/buildroot/build_xtensa_test_mmuhifi_b/bash-3.2'
