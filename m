From: Frank Kujawski <buildroot@fp8.com>
Date: Wed, 18 Jul 2007 04:54:35 -0500 (CDT)
Subject: [Buildroot] linux26 compile error
Message-ID: <52010.75.129.164.68.1184752475.squirrel@kujawski.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am getting a compile error on:
linux26: cross-depmod26
$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
$(TARGET_DIR)/boot/$(LINUX26_FORMAT)

cross-depmod26 compiles ok, but I get an error because
$(TARGET_DIR)/lib/modules/ directory has not been created yet.
I get:
      Considering target file
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/root/lib/modules/2.6.21.5/modules.dep'.
       File
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/root/lib/modules/2.6.21.5/modules.dep'
does not exist.
        Considering target file `linux-kernel-2.6.21.5-arm'.
         File `linux-kernel-2.6.21.5-arm' does not exist.
          Considering target file
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.depend_done'.
           File
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.depend_done'
does not exist.
            Considering target file
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'.
             File
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'
does not exist.
              Considering target file
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
               File
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'
does not exist.
               Finished prerequisites of target file
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
              Must remake target
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched'.
make: *** No rule to make target
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched',
needed by
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'.
 Stop.
bash-3.2$

Any hints?

  Frank
