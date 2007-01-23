From: Stephan Raue <stephan.raue@gmx.net>
Date: Tue, 23 Jan 2007 15:09:37 +0100
Subject: [Buildroot] python build fails
Message-ID: <20070123140937.212380@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ith buildroot-20070123 build of python (2.4.2 and 2.4.4) fails with:

/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-ranlib libpython2.4.a
/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-gcc  -Xlinker -export-dynamic -o python \
                        Modules/python.o \
                        libpython2.4.a -lpthread -ldl  -lpthread -lutil   -lm  
case $MAKEFLAGS in \
        *-s*)  CC='/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-gcc' LDSHARED='/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-gcc -shared' OPT='-DNDEBUG -Os -pipe' ./hostpython -E ./setup.py -q build;; \
        *)  CC='/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-gcc' LDSHARED='/media/disk/build/buildroot-20070123/build_i686/staging_dir/bin/i686-linux-uclibc-gcc -shared' OPT='-DNDEBUG -Os -pipe' ./hostpython -E ./setup.py build;; \
        esac
running build
running build_ext
Traceback (most recent call last):
  File "./setup.py", line 1243, in ?
    main()
  File "./setup.py", line 1237, in main
    scripts = ['Tools/scripts/pydoc', 'Tools/scripts/idle',
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/core.py", line 149, in setup
    dist.run_commands()
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/dist.py", line 946, in run_commands
    self.run_command(cmd)
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/dist.py", line 966, in run_command
    cmd_obj.run()
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/command/build.py", line 112, in run
    self.run_command(cmd_name)
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/cmd.py", line 333, in run_command
    self.distribution.run_command(command)
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/dist.py", line 966, in run_command
    cmd_obj.run()
  File "/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/Lib/distutils/command/build_ext.py", line 279, in run
    self.build_extensions()
  File "./setup.py", line 112, in build_extensions
    self.detect_modules()
  File "./setup.py", line 259, in detect_modules
    for dir in modules_include_dirs:
NameError: global name 'modules_include_dirs' is not defined
make[1]: *** [sharedmods] Fehler 1
make[1]: Leaving directory `/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4'
make: *** [/media/disk/build/buildroot-20070123/build_i686/Python-2.4.4/python] Fehler 2
[stephan at ras buildroot-20070123]$ 

Stephan Raue

-- 
"Feel free" - 5 GB Mailbox, 50 FreeSMS/Monat ...
Jetzt GMX ProMail testen: http://www.gmx.net/de/go/promail
