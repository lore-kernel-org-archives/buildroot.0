From: Zack <ptitwarrior2@gmail.com>
Date: Tue, 24 Mar 2020 04:31:31 -0500 (CDT)
Subject: [Buildroot] Buildroot Compilation Error >> systemd245 Building
 ninja: build stopped: subcommand failed.
Message-ID: <1585042291461-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello , i'm trying to compile buildroot 2020.02 with xenomai 3.1 and linux
kernel 3.18 but i have this error : 

PATH="/home/localuser/newOS/buildroot/output/host/bin:/home/localuser/newOS/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
LC_ALL=fr_FR.UTF-8 PYTHONNOUSERSITE=y
/home/localuser/newOS/buildroot/output/host/bin/ninja  -j9  -C
/home/localuser/newOS/buildroot/output/build/systemd-245//build
ninja: Entering directory
`/home/localuser/newOS/buildroot/output/build/systemd-245//build'
[16/839] Compiling C object
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-client.c.o'.
FAILED:
src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-client.c.o 
/home/localuser/newOS/buildroot/output/host/bin/arm-basystemes-linux-gnueabihf-gcc
-Isrc/libsystemd-network/efd04ff@@systemd-network at sta
-Isrc/libsystemd-network -I../src/libsystemd-network -Isrc/basic
-I../src/basic -Isrc/boot -I../src/boot -Isrc/shared -I../src/shared
-Isrc/systemd -I../src/systemd -Isrc/journal -I../src/journal
-Isrc/journal-remote -I../src/journal-remote -Isrc/nspawn -I../src/nspawn
-Isrc/resolve -I../src/resolve -Isrc/timesync -I../src/timesync
-I../src/time-wait-sync -Isrc/login -I../src/login -Isrc/udev -I../src/udev
-Isrc/libudev -I../src/libudev -Isrc/core -I../src/core -Isrc/shutdown
-I../src/shutdown -I../src/libsystemd/sd-bus -I../src/libsystemd/sd-device
-I../src/libsystemd/sd-event -I../src/libsystemd/sd-hwdb
-I../src/libsystemd/sd-id128 -I../src/libsystemd/sd-netlink
-I../src/libsystemd/sd-network -I../src/libsystemd/sd-resolve -I. -I../
-fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -std=gnu99 -O3
-Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result
-Wno-format-signedness -Werror=undef -Wlogical-op -Wmissing-include-dirs
-Wold-style-definition -Wpointer-arith -Winit-self -Wfloat-equal
-Wsuggest-attribute=noreturn -Werror=missing-prototypes
-Werror=implicit-function-declaration -Werror=missing-declarations
-Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2
-Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn
-Wimplicit-fallthrough=5 -Wshadow -Wendif-labels -Wstrict-aliasing=2
-Wwrite-strings -Werror=overflow -Werror=shift-count-overflow
-Werror=shift-overflow=2 -Wdate-time -Wnested-externs -Wno-error=nonnull
-Wno-maybe-uninitialized -ffast-math -fno-common -fdiagnostics-show-option
-fno-strict-aliasing -fvisibility=hidden -fstack-protector
-fstack-protector-strong --param=ssp-buffer-size=4 -ffunction-sections
-fdata-sections -Werror=shadow -include config.h -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -MD -MQ
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-client.c.o' -MF
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-client.c.o.d'
-o 'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-client.c.o'
-c ../src/libsystemd-network/sd-dhcp-client.c
In file included from ../src/basic/macro.h:4:0,
                 from ../src/basic/alloc-util.h:9,
                 from ../src/libsystemd-network/sd-dhcp-client.c:16:
../src/basic/macro.h:380:9: error: ?chec de l'assertion statique:
"STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1"
         static_assert(expr, #expr)
         ^
../src/basic/log.h:76:1: note: dans l'expansion de la macro ??assert_cc??
 assert_cc(STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1);
 ^~~~~~~~~
[19/839] Compiling C object
'src/libsystemd-network/efd04ff@@systemd-network at sta/dhcp-network.c.o'.
FAILED: src/libsystemd-network/efd04ff@@systemd-network at sta/dhcp-network.c.o 
/home/localuser/newOS/buildroot/output/host/bin/arm-basystemes-linux-gnueabihf-gcc
-Isrc/libsystemd-network/efd04ff@@systemd-network at sta
-Isrc/libsystemd-network -I../src/libsystemd-network -Isrc/basic
-I../src/basic -Isrc/boot -I../src/boot -Isrc/shared -I../src/shared
-Isrc/systemd -I../src/systemd -Isrc/journal -I../src/journal
-Isrc/journal-remote -I../src/journal-remote -Isrc/nspawn -I../src/nspawn
-Isrc/resolve -I../src/resolve -Isrc/timesync -I../src/timesync
-I../src/time-wait-sync -Isrc/login -I../src/login -Isrc/udev -I../src/udev
-Isrc/libudev -I../src/libudev -Isrc/core -I../src/core -Isrc/shutdown
-I../src/shutdown -I../src/libsystemd/sd-bus -I../src/libsystemd/sd-device
-I../src/libsystemd/sd-event -I../src/libsystemd/sd-hwdb
-I../src/libsystemd/sd-id128 -I../src/libsystemd/sd-netlink
-I../src/libsystemd/sd-network -I../src/libsystemd/sd-resolve -I. -I../
-fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -std=gnu99 -O3
-Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result
-Wno-format-signedness -Werror=undef -Wlogical-op -Wmissing-include-dirs
-Wold-style-definition -Wpointer-arith -Winit-self -Wfloat-equal
-Wsuggest-attribute=noreturn -Werror=missing-prototypes
-Werror=implicit-function-declaration -Werror=missing-declarations
-Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2
-Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn
-Wimplicit-fallthrough=5 -Wshadow -Wendif-labels -Wstrict-aliasing=2
-Wwrite-strings -Werror=overflow -Werror=shift-count-overflow
-Werror=shift-overflow=2 -Wdate-time -Wnested-externs -Wno-error=nonnull
-Wno-maybe-uninitialized -ffast-math -fno-common -fdiagnostics-show-option
-fno-strict-aliasing -fvisibility=hidden -fstack-protector
-fstack-protector-strong --param=ssp-buffer-size=4 -ffunction-sections
-fdata-sections -Werror=shadow -include config.h -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -MD -MQ
'src/libsystemd-network/efd04ff@@systemd-network at sta/dhcp-network.c.o' -MF
'src/libsystemd-network/efd04ff@@systemd-network at sta/dhcp-network.c.o.d' -o
'src/libsystemd-network/efd04ff@@systemd-network at sta/dhcp-network.c.o' -c
../src/libsystemd-network/dhcp-network.c
In file included from ../src/basic/macro.h:4:0,
                 from ../src/libsystemd-network/dhcp-protocol.h:12,
                 from ../src/libsystemd-network/dhcp-internal.h:15,
                 from ../src/libsystemd-network/dhcp-network.c:16:
../src/basic/macro.h:380:9: error: ?chec de l'assertion statique:
"STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1"
         static_assert(expr, #expr)
         ^
../src/basic/log.h:76:1: note: dans l'expansion de la macro ??assert_cc??
 assert_cc(STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1);
 ^~~~~~~~~
[20/839] Compiling C object
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-server.c.o'.
FAILED:
src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-server.c.o 
/home/localuser/newOS/buildroot/output/host/bin/arm-basystemes-linux-gnueabihf-gcc
-Isrc/libsystemd-network/efd04ff@@systemd-network at sta
-Isrc/libsystemd-network -I../src/libsystemd-network -Isrc/basic
-I../src/basic -Isrc/boot -I../src/boot -Isrc/shared -I../src/shared
-Isrc/systemd -I../src/systemd -Isrc/journal -I../src/journal
-Isrc/journal-remote -I../src/journal-remote -Isrc/nspawn -I../src/nspawn
-Isrc/resolve -I../src/resolve -Isrc/timesync -I../src/timesync
-I../src/time-wait-sync -Isrc/login -I../src/login -Isrc/udev -I../src/udev
-Isrc/libudev -I../src/libudev -Isrc/core -I../src/core -Isrc/shutdown
-I../src/shutdown -I../src/libsystemd/sd-bus -I../src/libsystemd/sd-device
-I../src/libsystemd/sd-event -I../src/libsystemd/sd-hwdb
-I../src/libsystemd/sd-id128 -I../src/libsystemd/sd-netlink
-I../src/libsystemd/sd-network -I../src/libsystemd/sd-resolve -I. -I../
-fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -std=gnu99 -O3
-Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result
-Wno-format-signedness -Werror=undef -Wlogical-op -Wmissing-include-dirs
-Wold-style-definition -Wpointer-arith -Winit-self -Wfloat-equal
-Wsuggest-attribute=noreturn -Werror=missing-prototypes
-Werror=implicit-function-declaration -Werror=missing-declarations
-Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2
-Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn
-Wimplicit-fallthrough=5 -Wshadow -Wendif-labels -Wstrict-aliasing=2
-Wwrite-strings -Werror=overflow -Werror=shift-count-overflow
-Werror=shift-overflow=2 -Wdate-time -Wnested-externs -Wno-error=nonnull
-Wno-maybe-uninitialized -ffast-math -fno-common -fdiagnostics-show-option
-fno-strict-aliasing -fvisibility=hidden -fstack-protector
-fstack-protector-strong --param=ssp-buffer-size=4 -ffunction-sections
-fdata-sections -Werror=shadow -include config.h -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -MD -MQ
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-server.c.o' -MF
'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-server.c.o.d'
-o 'src/libsystemd-network/efd04ff@@systemd-network at sta/sd-dhcp-server.c.o'
-c ../src/libsystemd-network/sd-dhcp-server.c
In file included from ../src/basic/macro.h:4:0,
                 from ../src/basic/alloc-util.h:9,
                 from ../src/libsystemd-network/sd-dhcp-server.c:11:
../src/basic/macro.h:380:9: error: ?chec de l'assertion statique:
"STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1"
         static_assert(expr, #expr)
         ^
../src/basic/log.h:76:1: note: dans l'expansion de la macro ??assert_cc??
 assert_cc(STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1);
 ^~~~~~~~~
[21/839] Compiling C object
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-container.c.o'.
FAILED: src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-container.c.o 
/home/localuser/newOS/buildroot/output/host/bin/arm-basystemes-linux-gnueabihf-gcc
-Isrc/libsystemd/7253779@@systemd_static at sta -Isrc/libsystemd
-I../src/libsystemd -Isrc/basic -I../src/basic -Isrc/boot -I../src/boot
-Isrc/shared -I../src/shared -Isrc/systemd -I../src/systemd -Isrc/journal
-I../src/journal -Isrc/journal-remote -I../src/journal-remote -Isrc/nspawn
-I../src/nspawn -Isrc/resolve -I../src/resolve -Isrc/timesync
-I../src/timesync -I../src/time-wait-sync -Isrc/login -I../src/login
-Isrc/udev -I../src/udev -Isrc/libudev -I../src/libudev -Isrc/core
-I../src/core -Isrc/shutdown -I../src/shutdown -I../src/libsystemd/sd-bus
-I../src/libsystemd/sd-device -I../src/libsystemd/sd-event
-I../src/libsystemd/sd-hwdb -I../src/libsystemd/sd-id128
-I../src/libsystemd/sd-netlink -I../src/libsystemd/sd-network
-I../src/libsystemd/sd-resolve -Isrc/libsystemd-network
-I../src/libsystemd-network -I. -I../ -fdiagnostics-color=always -pipe -Wall
-Winvalid-pch -Wextra -std=gnu99 -O3 -Wno-unused-parameter
-Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness
-Werror=undef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition
-Wpointer-arith -Winit-self -Wfloat-equal -Wsuggest-attribute=noreturn
-Werror=missing-prototypes -Werror=implicit-function-declaration
-Werror=missing-declarations -Werror=return-type
-Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes
-Wredundant-decls -Wmissing-noreturn -Wimplicit-fallthrough=5 -Wshadow
-Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Werror=overflow
-Werror=shift-count-overflow -Werror=shift-overflow=2 -Wdate-time
-Wnested-externs -Wno-error=nonnull -Wno-maybe-uninitialized -ffast-math
-fno-common -fdiagnostics-show-option -fno-strict-aliasing
-fvisibility=hidden -fstack-protector -fstack-protector-strong
--param=ssp-buffer-size=4 -ffunction-sections -fdata-sections -Werror=shadow
-include config.h -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -O2 -fPIC -pthread -fvisibility=default -MD -MQ
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-container.c.o' -MF
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-container.c.o.d' -o
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-container.c.o' -c
../src/libsystemd/sd-bus/bus-container.c
In file included from ../src/basic/macro.h:4:0,
                 from ../src/libsystemd/sd-bus/bus-error.h:8,
                 from ../src/libsystemd/sd-bus/bus-internal.h:8,
                 from ../src/libsystemd/sd-bus/bus-container.c:7:
../src/basic/macro.h:380:9: error: ?chec de l'assertion statique:
"STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1"
         static_assert(expr, #expr)
         ^
../src/basic/log.h:76:1: note: dans l'expansion de la macro ??assert_cc??
 assert_cc(STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1);
 ^~~~~~~~~
[22/839] Compiling C object
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-control.c.o'.
FAILED: src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-control.c.o 
/home/localuser/newOS/buildroot/output/host/bin/arm-basystemes-linux-gnueabihf-gcc
-Isrc/libsystemd/7253779@@systemd_static at sta -Isrc/libsystemd
-I../src/libsystemd -Isrc/basic -I../src/basic -Isrc/boot -I../src/boot
-Isrc/shared -I../src/shared -Isrc/systemd -I../src/systemd -Isrc/journal
-I../src/journal -Isrc/journal-remote -I../src/journal-remote -Isrc/nspawn
-I../src/nspawn -Isrc/resolve -I../src/resolve -Isrc/timesync
-I../src/timesync -I../src/time-wait-sync -Isrc/login -I../src/login
-Isrc/udev -I../src/udev -Isrc/libudev -I../src/libudev -Isrc/core
-I../src/core -Isrc/shutdown -I../src/shutdown -I../src/libsystemd/sd-bus
-I../src/libsystemd/sd-device -I../src/libsystemd/sd-event
-I../src/libsystemd/sd-hwdb -I../src/libsystemd/sd-id128
-I../src/libsystemd/sd-netlink -I../src/libsystemd/sd-network
-I../src/libsystemd/sd-resolve -Isrc/libsystemd-network
-I../src/libsystemd-network -I. -I../ -fdiagnostics-color=always -pipe -Wall
-Winvalid-pch -Wextra -std=gnu99 -O3 -Wno-unused-parameter
-Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness
-Werror=undef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition
-Wpointer-arith -Winit-self -Wfloat-equal -Wsuggest-attribute=noreturn
-Werror=missing-prototypes -Werror=implicit-function-declaration
-Werror=missing-declarations -Werror=return-type
-Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes
-Wredundant-decls -Wmissing-noreturn -Wimplicit-fallthrough=5 -Wshadow
-Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Werror=overflow
-Werror=shift-count-overflow -Werror=shift-overflow=2 -Wdate-time
-Wnested-externs -Wno-error=nonnull -Wno-maybe-uninitialized -ffast-math
-fno-common -fdiagnostics-show-option -fno-strict-aliasing
-fvisibility=hidden -fstack-protector -fstack-protector-strong
--param=ssp-buffer-size=4 -ffunction-sections -fdata-sections -Werror=shadow
-include config.h -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -O2 -fPIC -pthread -fvisibility=default -MD -MQ
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-control.c.o' -MF
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-control.c.o.d' -o
'src/libsystemd/7253779@@systemd_static at sta/sd-bus_bus-control.c.o' -c
../src/libsystemd/sd-bus/bus-control.c
In file included from ../src/basic/macro.h:4:0,
                 from ../src/basic/alloc-util.h:9,
                 from ../src/libsystemd/sd-bus/bus-control.c:12:
../src/basic/macro.h:380:9: error: ?chec de l'assertion statique:
"STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1"
         static_assert(expr, #expr)
         ^
../src/basic/log.h:76:1: note: dans l'expansion de la macro ??assert_cc??
 assert_cc(STRLEN(__FILE__) > STRLEN(RELATIVE_SOURCE_PATH) + 1);
 ^~~~~~~~~
[24/839] Generating arphrd-from-name.gperf with a meson_exe.py custom
command.
ninja: build stopped: subcommand failed.
package/pkg-generic.mk:266: recipe for target
'/home/localuser/newOS/buildroot/output/build/systemd-245/.stamp_built'
failed
make[1]: ***
[/home/localuser/newOS/buildroot/output/build/systemd-245/.stamp_built]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Does anybody know how to solve it ?




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
