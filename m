From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 01 Sep 2009 17:07:55 +0200
Subject: [Buildroot] bash fails to compile with git tree
In-Reply-To: <8763c3ql90.fsf@macbook.be.48ers.dk>
References: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
	<87pracqtzg.fsf@macbook.be.48ers.dk> <1251715165.5021.9.camel@sven>
	<8763c3ql90.fsf@macbook.be.48ers.dk>
Message-ID: <1251817675.16697.13.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-09-01 at 07:36 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  Sven> I do frequently get errors when building bash. Perhaps in one out
>  Sven> of three builds, compilation of bash aborts. This is always
>  Sven> easily fixed by typing 'make bash', followed by 'make' to
>  Sven> continue the build. My guess is that it is a problem with
>  Sven> parallel builds. We use BR2_JLEVEL=4.
> 
> Hmm, that shouldn't be the case as bash.mk uses MAKE1 everywhere.

Ok, it just did happen again. Here's the output:

make[2]: Leaving directory `/home/sven/git/buildroot/build_arm/bash-3.2/lib/tilde'
rm -f bash
/home/sven/git/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc -L./builtins -L./lib/readline -L./lib/readline -L./lib/glob -L./lib/tilde  -L./lib/sh  -rdynamic  -g -O2 -o bash shell.o eval.o y.tab.o general.o make_cmd.o print_cmd.o  dispose_cmd.o execute_cmd.o variables.o copy_cmd.o error.o expr.o flags.o nojobs.o subst.o hashcmd.o hashlib.o mailcheck.o trap.o input.o unwind_prot.o pathexp.o sig.o test.o version.o alias.o array.o arrayfunc.o braces.o bracecomp.o bashhist.o bashline.o  list.o stringlib.o locale.o findcmd.o redir.o pcomplete.o pcomplib.o syntax.o xmalloc.o signames.o -lbuiltins -lsh -lreadline -lhistory -lcurses -lglob -ltilde    -ldl 
/home/sven/git/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.3/../../../../arm-linux-uclibcgnueabi/bin/ld: warning: /home/sven/git/buildroot/build_arm/staging_dir/usr/lib/libdl.so uses variable-size enums yet the output is to use 32-bit enums; use of enum values across objects may fail
/home/sven/git/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.3/../../../../arm-linux-uclibcgnueabi/bin/ld: warning: /home/sven/git/buildroot/build_arm/staging_dir/lib/libc.so.0 uses variable-size enums yet the output is to use 32-bit enums; use of enum values across objects may fail
/home/sven/git/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.3/../../../../arm-linux-uclibcgnueabi/bin/ld: warning: /home/sven/git/buildroot/build_arm/staging_dir/lib/ld-uClibc.so.0 uses variable-size enums yet the output is to use 32-bit enums; use of enum values across objects may fail
shell.o: In function `exit_shell':
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:887: undefined reference to `hangup_all_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:894: undefined reference to `end_job_control'
shell.o: In function `init_noninteractive':
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:1577: undefined reference to `set_job_control'
shell.o: In function `main':
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:570: undefined reference to `set_job_control'
shell.o: In function `run_startup_files':
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:994: undefined reference to `set_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/shell.c:1086: undefined reference to `set_job_control'
y.tab.o: In function `shell_getc':
/home/sven/git/buildroot/build_arm/bash-3.2/./parse.y:1924: undefined reference to `notify_and_cleanup'
y.tab.o: In function `yy_readline_get':
/home/sven/git/buildroot/build_arm/bash-3.2/./parse.y:1228: undefined reference to `job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/./parse.y:1228: undefined reference to `shell_pgrp'
execute_cmd.o: In function `initialize_subshell':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3864: undefined reference to `without_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3865: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3866: undefined reference to `init_job_stats'
execute_cmd.o: In function `setup_async_signals':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3591: undefined reference to `job_control'
execute_cmd.o: In function `execute_pipeline':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1401: undefined reference to `terminate_current_pipeline'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1402: undefined reference to `kill_current_pipeline'
execute_cmd.o: In function `execute_for_command':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1660: undefined reference to `job_control'
execute_cmd.o: In function `execute_subshell_builtin_or_function':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3440: undefined reference to `kill_current_pipeline'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3444: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3442: undefined reference to `without_job_control'
execute_cmd.o: In function `execute_simple_command':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:2971: undefined reference to `start_job'
execute_cmd.o: In function `execute_disk_command':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:3714: undefined reference to `job_control'
execute_cmd.o: In function `execute_in_subshell':
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1274: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1282: undefined reference to `without_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/execute_cmd.c:1310: undefined reference to `original_pgrp'
error.o: In function `programming_error':
/home/sven/git/buildroot/build_arm/bash-3.2/error.c:163: undefined reference to `shell_pgrp'
flags.o: In function `change_flag':
/home/sven/git/buildroot/build_arm/bash-3.2/flags.c:269: undefined reference to `set_job_control'
subst.o: In function `command_substitute':
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4606: undefined reference to `cleanup_the_pipeline'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4623: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4720: undefined reference to `close_pgrp_pipe'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4623: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4707: undefined reference to `pipeline_pgrp'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4707: undefined reference to `shell_pgrp'
subst.o: In function `expand_word_internal':
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:7274: undefined reference to `shell_pgrp'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:7274: undefined reference to `pipeline_pgrp'
subst.o: In function `process_substitute':
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4326: undefined reference to `save_pipeline'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4341: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4360: undefined reference to `restore_pipeline'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4370: undefined reference to `close_pgrp_pipe'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4341: undefined reference to `set_sigchld_handler'
/home/sven/git/buildroot/build_arm/bash-3.2/subst.c:4383: undefined reference to `set_job_control'
sig.o: In function `termsig_handler':
/home/sven/git/buildroot/build_arm/bash-3.2/sig.c:486: undefined reference to `end_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/sig.c:485: undefined reference to `hangup_all_jobs'
sig.o: In function `throw_to_top_level':
/home/sven/git/buildroot/build_arm/bash-3.2/sig.c:411: undefined reference to `shell_pgrp'
pcomplete.o: In function `it_init_joblist':
/home/sven/git/buildroot/build_arm/bash-3.2/pcomplete.c:545: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/pcomplete.c:545: undefined reference to `jobs'
./builtins/libbuiltins.a(common.o): In function `get_job_by_name':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/common.c:557: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/common.c:557: undefined reference to `jobs'
./builtins/libbuiltins.a(common.o): In function `get_job_spec':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/common.c:603: undefined reference to `js'
./builtins/libbuiltins.a(exec.o): In function `exec_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./exec.def:225: undefined reference to `restart_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./exec.def:191: undefined reference to `end_job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./exec.def:184: undefined reference to `job_control'
./builtins/libbuiltins.a(exit.o): In function `exit_or_logout':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./exit.def:130: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./exit.def:130: undefined reference to `jobs'
./builtins/libbuiltins.a(fg_bg.o): In function `fg_bg':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./fg_bg.def:159: undefined reference to `start_job'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./fg_bg.def:149: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./fg_bg.def:149: undefined reference to `jobs'
./builtins/libbuiltins.a(fg_bg.o): In function `bg_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./fg_bg.def:122: undefined reference to `job_control'
./builtins/libbuiltins.a(fg_bg.o): In function `fg_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./fg_bg.def:74: undefined reference to `job_control'
./builtins/libbuiltins.a(jobs.o): In function `disown_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:268: undefined reference to `nohup_job'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:270: undefined reference to `delete_job'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:249: undefined reference to `nohup_all_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:251: undefined reference to `delete_all_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:251: undefined reference to `jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:251: undefined reference to `js'
./builtins/libbuiltins.a(jobs.o): In function `jobs_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:150: undefined reference to `list_one_job'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:127: undefined reference to `list_all_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:130: undefined reference to `list_running_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:133: undefined reference to `list_stopped_jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:133: undefined reference to `jobs'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./jobs.def:133: undefined reference to `js'
./builtins/libbuiltins.a(kill.o): In function `kill_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./kill.def:117: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./kill.def:117: undefined reference to `jobs'
./builtins/libbuiltins.a(suspend.o): In function `suspend_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./suspend.def:95: undefined reference to `job_control'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./suspend.def:95: undefined reference to `shell_pgrp'
./builtins/libbuiltins.a(wait.o): In function `wait_builtin':
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./wait.def:164: undefined reference to `wait_for_job'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./wait.def:118: undefined reference to `js'
/home/sven/git/buildroot/build_arm/bash-3.2/builtins/./wait.def:118: undefined reference to `jobs'
collect2: ld returned 1 exit status


I then run 'make bash-dirclean', followed by 'make bash' and everything works just fine.


Puzzled, Sven
