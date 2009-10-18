From: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Sat, 17 Oct 2009 18:07:04 -0700
Subject: [Buildroot] Bash fails to build.
Message-ID: <4ADA6A38.40703@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I recently upgraded by development machine to Ubuntu 9.04 and now I'm
having trouble compiling bash. It's failing during the link with a bunch
of unresolved symbols.

I am using the buildroot snapshot buildroot-2009.08.tar.gz.

I see one other mailing list posting around 9/1 with a similar issue.
However, the suggestion to do a make bash followed by a make does not
work around the issue.

Can post the bash config.log and the buildroot .config file on a web url
somwhere it it will help.

Steve.



Here's the output from make:

ar cr libtilde.a tilde.o
test -n "ranlib" && ranlib libtilde.a
make[3]: Leaving directory
`/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/lib/tilde'
rm -f bash
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-L./builtins -L./lib/readline -L./lib/readline -L./lib/glob
-L./lib/tilde  -L./lib/sh  -rdynamic  -g -O2 -o bash shell.o eval.o
y.tab.o general.o make_cmd.o print_cmd.o  dispose_cmd.o execute_cmd.o
variables.o copy_cmd.o error.o expr.o flags.o nojobs.o subst.o hashcmd.o
hashlib.o mailcheck.o trap.o input.o unwind_prot.o pathexp.o sig.o
test.o version.o alias.o array.o arrayfunc.o braces.o bracecomp.o
bashhist.o bashline.o  list.o stringlib.o locale.o findcmd.o redir.o
pcomplete.o pcomplib.o syntax.o xmalloc.o signames.o -lbuiltins -lsh
-lreadline -lhistory -lcurses -lglob -ltilde    -ldl
shell.o: In function `exit_shell':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:887:
undefined reference to `hangup_all_jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:894:
undefined reference to `end_job_control'
shell.o: In function `init_noninteractive':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:1577:
undefined reference to `set_job_control'
shell.o: In function `main':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:570:
undefined reference to `set_job_control'
shell.o: In function `run_startup_files':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:994:
undefined reference to `set_job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/shell.c:1086:
undefined reference to `set_job_control'
y.tab.o: In function `shell_getc':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/./parse.y:1924:
undefined reference to `notify_and_cleanup'
y.tab.o: In function `yy_readline_get':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/./parse.y:1201:
undefined reference to `job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/./parse.y:1202:
undefined reference to `shell_pgrp'
execute_cmd.o: In function `initialize_subshell':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3864:
undefined reference to `without_job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3865:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3866:
undefined reference to `init_job_stats'
execute_cmd.o: In function `setup_async_signals':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3585:
undefined reference to `job_control'
execute_cmd.o: In function `execute_pipeline':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1401:
undefined reference to `terminate_current_pipeline'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1402:
undefined reference to `kill_current_pipeline'
execute_cmd.o: In function `execute_connection':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1517:
undefined reference to `job_control'
execute_cmd.o: In function `execute_subshell_builtin_or_function':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3440:
undefined reference to `kill_current_pipeline'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3444:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:3442:
undefined reference to `without_job_control'
execute_cmd.o: In function `execute_simple_command':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:2945:
undefined reference to `job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:2971:
undefined reference to `start_job'
execute_cmd.o: In function `execute_in_subshell':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1233:
undefined reference to `original_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1274:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/execute_cmd.c:1282:
undefined reference to `without_job_control'
error.o: In function `programming_error':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/error.c:150:
undefined reference to `shell_pgrp'
flags.o: In function `change_flag':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/flags.c:269:
undefined reference to `set_job_control'
subst.o: In function `command_substitute':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4602:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4605:
undefined reference to `shell_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4605:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4606:
undefined reference to `cleanup_the_pipeline'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4623:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4625:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4720:
undefined reference to `close_pgrp_pipe'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4750:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4623:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4625:
undefined reference to `pipeline_pgrp'
subst.o: In function `process_substitute':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4324:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4325:
undefined reference to `shell_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4325:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4326:
undefined reference to `save_pipeline'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4341:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4343:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4360:
undefined reference to `restore_pipeline'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4370:
undefined reference to `close_pgrp_pipe'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4341:
undefined reference to `set_sigchld_handler'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4343:
undefined reference to `pipeline_pgrp'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/subst.c:4383:
undefined reference to `set_job_control'
sig.o: In function `termsig_handler':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/sig.c:486:
undefined reference to `end_job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/sig.c:485:
undefined reference to `hangup_all_jobs'
sig.o: In function `throw_to_top_level':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/sig.c:399:
undefined reference to `shell_pgrp'
pcomplete.o: In function `it_init_joblist':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/pcomplete.c:524:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/pcomplete.c:525:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/pcomplete.c:527:
undefined reference to `jobs'
./builtins/libbuiltins.a(common.o): In function `get_job_by_name':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/common.c:526:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/common.c:528:
undefined reference to `jobs'
./builtins/libbuiltins.a(common.o): In function `get_job_spec':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/common.c:600:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/common.c:603:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/common.c:591:
undefined reference to `js'
./builtins/libbuiltins.a(exec.o): In function `exec_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./exec.def:224:
undefined reference to `job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./exec.def:225:
undefined reference to `restart_job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./exec.def:191:
undefined reference to `end_job_control'
./builtins/libbuiltins.a(exit.o): In function `exit_or_logout':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./exit.def:108:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./exit.def:109:
undefined reference to `jobs'
./builtins/libbuiltins.a(fg_bg.o): In function `fg_bg':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./fg_bg.def:137:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./fg_bg.def:137:
undefined reference to `jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./fg_bg.def:159:
undefined reference to `start_job'
./builtins/libbuiltins.a(fg_bg.o): In function `bg_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./fg_bg.def:99:
undefined reference to `job_control'
./builtins/libbuiltins.a(fg_bg.o): In function `fg_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./fg_bg.def:62:
undefined reference to `job_control'
./builtins/libbuiltins.a(jobs.o): In function `disown_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:262:
undefined reference to `jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:262:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:268:
undefined reference to `nohup_job'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:270:
undefined reference to `delete_job'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:249:
undefined reference to `nohup_all_jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:251:
undefined reference to `delete_all_jobs'
./builtins/libbuiltins.a(jobs.o): In function `jobs_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:144:
undefined reference to `jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:150:
undefined reference to `list_one_job'
./builtins/libbuiltins.a(jobs.o): In function
`execute_list_with_replacements':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:175:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:175:
undefined reference to `jobs'
./builtins/libbuiltins.a(jobs.o): In function `jobs_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:127:
undefined reference to `list_all_jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:130:
undefined reference to `list_running_jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./jobs.def:133:
undefined reference to `list_stopped_jobs'
./builtins/libbuiltins.a(kill.o): In function `kill_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./kill.def:200:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./kill.def:200:
undefined reference to `jobs'
./builtins/libbuiltins.a(suspend.o): In function `suspend_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./suspend.def:93:
undefined reference to `job_control'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./suspend.def:117:
undefined reference to `shell_pgrp'
./builtins/libbuiltins.a(wait.o): In function `wait_builtin':
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./wait.def:152:
undefined reference to `js'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./wait.def:152:
undefined reference to `jobs'
/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/builtins/./wait.def:164:
undefined reference to `wait_for_job'
collect2: ld returned 1 exit status
make[2]: *** [bash] Error 1
make[2]: Leaving directory
`/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2'
make[1]: ***
[/home/srodgers/projects/limey-linux/1.0.9/buildroot/build_i686/bash-3.2/bash]
Error 2
make[1]: Leaving directory
`/home/srodgers/projects/limey-linux/1.0.9/buildroot'
make: *** [buildstate/buildroot_made] Error 2
