From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Wed, 6 Aug 2014 10:53:32 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: Added staging
In-Reply-To: <c70f3b3c-8ff0-4237-8633-9d893a935eb9@email.android.com>
References: <1407311713-30045-1-git-send-email-pieter.degendt@gmail.com>
 <fb1133f6-4157-4458-9fb4-ede779eb6dea@email.android.com>
 <CAFfn7Uk7k+q1QxhOteqy_NT+4-cPYN8UMRi1wP7ASi4_RVi2Tw@mail.gmail.com>
 <c70f3b3c-8ff0-4237-8633-9d893a935eb9@email.android.com>
Message-ID: <CAFfn7UnVM+P0KXgSX3OXSv1fYAFBOR8ikfFZzexFo=-+NvyfOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 6, 2014 at 10:31 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> (Please don't top post)
>
> Pieter De Gendt <pieter.degendt@gmail.com> schreef:
> >No, I'm just not that familiar yet with the makefile mechanism, I looked
> at
> >other packages for examples, this seemed to be the easiest solution.
>
> I think you should try using the same kind of rule as the
> INSTALL_TARGET_CMDS, and see if the right files are installed...
> This is more future proof...
>
> Best regards,
> Thomas
>
>
Ok but from the waf build system help I don't see the option to copy the
header files.. Would this mean that the manual copy is still valid?

./waf --help
waf [commands] [options]

Main commands (example: ./waf build -j4)
  build    : executes the build
  clean    : cleans the project
  configure: configures the project
  dist     : makes a tarball for redistributing the sources
  distcheck: checks if the project compiles (tarball from 'dist')
  distclean: removes the build directory
  install  : installs the targets on the system
  list     : lists the targets to execute
  step     : executes tasks in a step-by-step fashion, for debugging
  uninstall: removes the targets installed
  update   : updates the plugins from the *waflib/extras* directory

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -j JOBS, --jobs=JOBS  amount of parallel jobs (8)
  -k, --keep            keep running happily even if errors are found
  -v, --verbose         verbosity level -v -vv or -vvv [default: 0]
  --nocache             ignore the WAFCACHE (if set)
  --zones=ZONES         debugging zones (task_gen, deps, tasks, etc)
  --libdir=LIBDIR       Library directory [Default: <prefix>/lib]
  --libdir32=LIBDIR32   32bit Library directory [Default: <prefix>/lib32]
  --mandir=MANDIR       Manpage directory [Default: <prefix>/share/man/man1]
  --dbus                Enable D-Bus JACK (jackdbus)
  --dist-target=DIST_TARGET
                        Specify the target for cross-compiling [auto,mingw]
  --classic             Force enable standard JACK (jackd) even if D-Bus
JACK (jackdbus) is enabled too
  --doxygen             Enable build of doxygen documentation
  --profile             Build with engine profiling
  --mixed               Build with 32/64 bits mixed mode
  --clients=CLIENTS     Maximum number of JACK clients
  --ports-per-application=APPLICATION_PORTS
                        Maximum number of ports per application
  --debug               Build debuggable binaries
  --firewire            Enable FireWire driver (FFADO)
  --freebob             Enable FreeBob driver
  --alsa                Enable ALSA driver
  --iio                 Enable IIO driver
  --autostart=AUTOSTART
                        Autostart method. Possible values: "default",
"classic", "dbus", "none"
  --portaudio           Enable Portaudio driver
  --winmme              Enable WinMME driver
  --enable-pkg-config-dbus-service-dir
                        force D-Bus service install dir to be one returned
by pkg-config

  configure options:
    -o OUT, --out=OUT   build dir for the project
    -t TOP, --top=TOP   src dir for the project
    --prefix=PREFIX     installation prefix [default: '/usr/local/']
    --download          try to download the tools if missing

  build and install options:
    -p, --progress      -p: progress bar; -pp: ide output
    --targets=TARGETS   task generators, e.g. "target1,target2"

  step options:
    --files=FILES       files to process, by regexp, e.g.
"*/main.c,*/test/main.o"

  install/uninstall options:
    --destdir=DESTDIR   installation root [default: '']
    -f, --force         force file installation

  C++ Compiler Options:
    --check-cxx-compiler=CHECK_CXX_COMPILER
                        On this platform (linux) the following C++ Compiler
will be checked by default: "g++ icpc"

  C Compiler Options:
    --check-c-compiler=CHECK_C_COMPILER
                        On this platform (linux) the following C-Compiler
will be checked by default: "gcc icc"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140806/073ec7bd/attachment.html>
