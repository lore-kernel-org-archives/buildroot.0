From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Oct 2014 01:26:12 +0100
Subject: [Buildroot] [PATCH 3/3] package/*: rename patches according to the
	new policy
In-Reply-To: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
References: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1414369572-15695-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These changes have been done using rename-patch.py, after dry run and
visual inspection of the change to be executed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...t-static-installation.patch => 0001-support-static-installation.patch} | 0
 .../{acpid-01-dont-use-isfdtype.patch => 0001-dont-use-isfdtype.patch}    | 0
 ...{acpid-02-add-missing-defines.patch => 0002-add-missing-defines.patch} | 0
 ...1-gnutls-and-uclibc-fixes.patch => 0001-gnutls-and-uclibc-fixes.patch} | 0
 ...inked-libraries.patch => 0002-makefile-reorder-linked-libraries.patch} | 0
 ...ock-suite-functions-fix.patch => 0003-clock-suite-functions-fix.patch} | 0
 .../{aircrack-ng-01-CVE-2010-1159.patch => 0001-CVE-2010-1159.patch}      | 0
 .../{alsa-lib-0001-avr32-bad-inline.patch => 0001-avr32-bad-inline.patch} | 0
 package/alsa-lib/{alsa-lib-0002-no-mmu.patch => 0002-no-mmu.patch}        | 0
 package/alsa-lib/{alsa-lib-0003-dlmisc.patch => 0003-dlmisc.patch}        | 0
 ...f-libdl-in-m4.patch => 0004-conditional-enabling-of-libdl-in-m4.patch} | 0
 .../{alsamixergui_0.9.0rc2-1-7.patch => 0001-misc-fixes.patch}            | 0
 .../{am33x-cm3-0001-fix-makefile.patch => 0001-fix-makefile.patch}        | 0
 .../{apr-util-01-remove-checkapr.patch => 0001-remove-checkapr.patch}     | 0
 ...argp-standalone-throw-in-funcdef.patch => 0001-throw-in-funcdef.patch} | 0
 ...ch => 0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch} | 0
 ...ch => 0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} | 0
 ...ng-stage.patch => 0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch} | 0
 ...T-by-DESTDIR.patch => 0004-Makefile.in-replace-IROOT-by-DESTDIR.patch} | 0
 ....in-make-install-fix.patch => 0005-Makefile.in-make-install-fix.patch} | 0
 .../at/{at-0006-getloadavg.c-fix.patch => 0006-getloadavg.c-fix.patch}    | 0
 ...e.l-include-config-h.patch => 0007-parsetime.l-include-config-h.patch} | 0
 ...t-static-installation.patch => 0001-support-static-installation.patch} | 0
 ...x-incorrect-makefile-am.patch => 0001-fix-incorrect-makefile-am.patch} | 0
 ...nt-add-dirty-to-version.patch => 0001-dont-add-dirty-to-version.patch} | 0
 package/automake/{automake-0001-noman.patch => 0001-noman.patch}          | 0
 package/avahi/{avahi-autoipd-perms.patch => 0001-autoipd-perms.patch}     | 0
 ...i-disable-systemd-support.patch => 0002-disable-systemd-support.patch} | 0
 package/avahi/{avahi-ipv6only.patch => 0003-ipv6only.patch}               | 0
 package/avahi/{avahi-optional-ipv6.patch => 0004-optional-ipv6.patch}     | 0
 .../bash/{bash-000-mkbuiltins-cross.patch => 0001-mkbuiltins-cross.patch} | 0
 package/bash/{bash-001-patchlevel1-27.patch => 0002-patchlevel1-27.patch} | 0
 package/bash/{bash-002-patchlevel28.patch => 0003-patchlevel28.patch}     | 0
 package/bash/{bash-003-patchlevel29.patch => 0004-patchlevel29.patch}     | 0
 package/bash/{bash-004-patchlevel30.patch => 0005-patchlevel30.patch}     | 0
 ...lue.cxx-cplusplus-only.patch => 0001-cppglue.cxx-cplusplus-only.patch} | 0
 ...2-icu-check-cross-compile.patch => 0002-icu-check-cross-compile.patch} | 0
 .../{beecrypt-0003-build-system.patch => 0003-build-system.patch}         | 0
 package/beecrypt/{beecrypt-0004-gcc-4.7.patch => 0004-gcc-4.7.patch}      | 0
 .../bellagio/{bellagio-0.9.3-drop-werror.patch => 0001-drop-werror.patch} | 0
 ...0.9.3-dynamicloader-linking.patch => 0002-dynamicloader-linking.patch} | 0
 .../{bellagio-0.9.3-parallel-build.patch => 0003-parallel-build.patch}    | 0
 ...omWaitResource.patch => 0004-segfault-on-removeFromWaitResource.patch} | 0
 package/bind/{bind-01-disable-tests.patch => 0001-disable-tests.patch}    | 0
 package/bind/{bind-02-cross.patch => 0002-cross.patch}                    | 0
 package/bison/{bison-01-no-docs-regen.patch => 0001-no-docs-regen.patch}  | 0
 .../{blackbox-001-Fix-configure-ac.patch => 0001-Fix-configure-ac.patch}  | 0
 package/blackbox/{blackbox-002-gcc43.patch => 0002-gcc43.patch}           | 0
 ...6-textpropertytostring.patch => 0003-gcc46-textpropertytostring.patch} | 0
 ...0_on_upstream_4.91.patch => 0001-enable_cg2900_on_upstream_4.91.patch} | 0
 ...-builds.patch => 0001-fix-ambiguous-format-call-on-64bit-builds.patch} | 0
 .../{bridge-utils-000-build-system.patch => 0001-build-system.patch}      | 0
 ...r-kernel-headers-3.8+.patch => 0002-fix-for-kernel-headers-3.8+.patch} | 0
 ...ch => 0001-networking-libiproute-use-linux-if_packet.h-instead-.patch} | 0
 ...usybox-0002-busybox-1.22.1-ash.patch => 0002-busybox-1.22.1-ash.patch} | 0
 ...ybox-0003-busybox-1.22.1-date.patch => 0003-busybox-1.22.1-date.patch} | 0
 ...-0004-busybox-1.22.1-iplink.patch => 0004-busybox-1.22.1-iplink.patch} | 0
 ...{busybox-0005-busybox-1.22.1-nc.patch => 0005-busybox-1.22.1-nc.patch} | 0
 ...6-lzop-add-overflow-check.patch => 0006-lzop-add-overflow-check.patch} | 0
 .../{bzip2-build-objects-twice.patch => 0001-build-objects-twice.patch}   | 0
 .../{bzip2-improve-build-system.patch => 0002-improve-build-system.patch} | 0
 ..._check_user.patch => 0001-use_check_build_instead_of_check_user.patch} | 0
 ...ing-round-function.patch => 0001-Fix-conflicting-round-function.patch} | 0
 .../{cairo-001-blackfin-build-fix.patch => 0001-blackfin-build-fix.patch} | 0
 .../{cairo-002-openvg-build-fix.patch => 0002-openvg-build-fix.patch}     | 0
 .../{cairo-003-fix-nofork-build.patch => 0003-fix-nofork-build.patch}     | 0
 .../{cairo-004-fix-nofork-any2ppm.patch => 0004-fix-nofork-any2ppm.patch} | 0
 .../{cairo-005-fix-gcc-49-build.patch => 0005-fix-gcc-49-build.patch}     | 0
 ...festival.patch => 0001-install-pkgconfig-module-for-canfestival.patch} | 0
 ...ython-interpreter.patch => 0002-allow-to-set-python-interpreter.patch} | 0
 package/cdrkit/{cdrkit-1.1.11-no-rcmd.patch => 0001-no-rcmd.patch}        | 0
 package/cegui06/{cegui06-stddef.h.patch => 0001-stddef.h.patch}           | 0
 ...atch => 0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch} | 0
 ....patch => 0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch} | 0
 ...ch => 0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch} | 0
 ...s.patch => 0004-cmake-blas-add-library-and-header-install-rules.patch} | 0
 ...patch => 0005-cmake-lapack-add-library-and-header-install-rules.patch} | 0
 .../{classpath-01-fix-gmp-include.patch => 0001-fix-gmp-include.patch}    | 0
 .../{classpath-02-add-config-rpath.patch => 0002-add-config-rpath.patch}  | 0
 .../{cloog-0001-add-missing-files.patch => 0001-add-missing-files.patch}  | 0
 package/cloop/{cloop-2.634-1-cflags.patch => 0001-cflags.patch}           | 0
 .../{connman-000-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch}   | 0
 ...1-fix-for-dummy-man-usage.patch => 0001-fix-for-dummy-man-usage.patch} | 0
 ...db-0001-mysql-library-suffix.patch => 0001-mysql-library-suffix.patch} | 0
 package/cramfs/{cramfs-01-endian.patch => 0001-endian.patch}              | 0
 package/cramfs/{cramfs-02-cygwin_IO.patch => 0002-cygwin_IO.patch}        | 0
 ...ter.patch => 0001-Makefile-allow-to-override-python-interpreter.patch} | 0
 ...rules.patch => 0002-Add-DESTDIR-support-in-install-libreg-rules.patch} | 0
 ...on.patch => 0001-Replace_INIT_COMPLETION_with_reinit_completion.patch} | 0
 ...-clock_gettime.patch => 0001-link-against-lrt-for-clock_gettime.patch} | 0
 package/cryptsetup/{cryptsetup-0002-mkdir.patch => 0002-mkdir.patch}      | 0
 package/cups/{cups-0001-fix-static.patch => 0001-fix-static.patch}        | 0
 ...x-stack-protector-check.patch => 0002-fix-stack-protector-check.patch} | 0
 package/cups/{cups-0003-mantohtml.patch => 0003-mantohtml.patch}          | 0
 ...000-fix-CURLOPT_INFILESIZE.patch => 0001-fix-CURLOPT_INFILESIZE.patch} | 0
 ...tpfs_file-memleak-fix.patch => 0002-free_ftpfs_file-memleak-fix.patch} | 0
 ...ftpfs-002-nocache-memleak-fix.patch => 0003-nocache-memleak-fix.patch} | 0
 ...or-as-needed-90.patch => 0001-fix-link-options-for-as-needed-90.patch} | 0
 ...Update-for-BlueZ-changes.patch => 0002-Update-for-BlueZ-changes.patch} | 0
 ...ch => 0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch} | 0
 ...uild-optional.patch => 0004-configure-make-wmgui-build-optional.patch} | 0
 ...SOURCE.patch => 0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch} | 0
 ...1-no-config.h-for-helpers.patch => 0001-no-config.h-for-helpers.patch} | 0
 package/dbus-cpp/{dbus-cpp-0001-gcc4.7.patch => 0001-gcc4.7.patch}        | 0
 ...lags-ldflags-for-build.patch => 0002-cxxflags-ldflags-for-build.patch} | 0
 ...python-configure-check.patch => 0001-fix-python-configure-check.patch} | 0
 ...-coherent-in-type-usage.patch => 0001-be-coherent-in-type-usage.patch} | 0
 ...001-use-non-bsd-structures.patch => 0001-use-non-bsd-structures.patch} | 0
 ...2-fix-strsep-feature-test.patch => 0002-fix-strsep-feature-test.patch} | 0
 .../{dhrystone-2-cmdline-nruns.patch => 0001-cmdline-nruns.patch}         | 0
 package/dhrystone/{dhrystone-2-HZ.patch => 0002-HZ.patch}                 | 0
 package/dhrystone/{dhrystone-2-exit.patch => 0003-exit.patch}             | 0
 package/dhrystone/{dhrystone-2-headers.patch => 0004-headers.patch}       | 0
 package/dhrystone/{dhrystone-2-prototypes.patch => 0005-prototypes.patch} | 0
 ...ch => 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch} | 0
 .../{directfb-examples-remove-bzero.patch => 0001-remove-bzero.patch}     | 0
 ...i-voodoo-header.patch => 0001-fix-missing-davinci-voodoo-header.patch} | 0
 .../directfb/{directfb-imlib2-config.patch => 0002-imlib2-config.patch}   | 0
 ...n-of-__typeof__.patch => 0003-remove-redefinition-of-__typeof__.patch} | 0
 .../directfb/{directfb-setregion-lock.patch => 0004-setregion-lock.patch} | 0
 package/directfb/{directfb-use-gcc-link.patch => 0005-use-gcc-link.patch} | 0
 package/dmalloc/{dmalloc-5.4.3-add-fpic.patch => 0001-add-fpic.patch}     | 0
 package/dmalloc/{dmalloc-mips.patch => 0002-mips.patch}                   | 0
 .../{dmidecode-build-system-fixes.patch => 0001-build-system-fixes.patch} | 0
 package/dropwatch/{dropwatch-01-build.patch => 0001-build.patch}          | 0
 .../{dropwatch-02-binutils-2.23.1.patch => 0002-binutils-2.23.1.patch}    | 0
 .../{dropwatch-03-remove-werror.patch => 0003-remove-werror.patch}        | 0
 package/dtc/{dtc-extra_cflags.patch => 0001-extra_cflags.patch}           | 0
 .../{dtc-separate-lib-install.patch => 0002-separate-lib-install.patch}   | 0
 ...ma-01-fix-cross-compilation.patch => 0001-fix-cross-compilation.patch} | 0
 ...-0001-Fix-generate-keynames.patch => 0001-Fix-generate-keynames.patch} | 0
 ...compiler-warning-flags.patch => 0002-Fix-compiler-warning-flags.patch} | 0
 ...pport-static-only-build.patch => 0003-support-static-only-build.patch} | 0
 .../{e2fsprogs-0001-sem-init-libs.patch => 0001-sem-init-libs.patch}      | 0
 .../elftosb/{elftosb-fixes-includes.patch => 0001-fixes-includes.patch}   | 0
 .../{elftosb-force-cxx-compiler.patch => 0002-force-cxx-compiler.patch}   | 0
 .../{elfutils-01-disable-progs.patch => 0001-disable-progs.patch}         | 0
 .../elfutils/{elfutils-02-argp-support.patch => 0002-argp-support.patch}  | 0
 package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch}  | 0
 package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch}                | 0
 package/elfutils/{elfutils-05-disable-po.patch => 0005-disable-po.patch}  | 0
 .../{empty-0001-respect-LDFLAGS.patch => 0001-respect-LDFLAGS.patch}      | 0
 package/erlang/{erlang-build-fix.patch => 0001-build-fix.patch}           | 0
 ...ch => 0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch} | 0
 package/evemu/{evemu-0001-SYN_MAX.patch => 0001-SYN_MAX.patch}            | 0
 ...ests-option.patch => 0002-configure.ac-add-disable-tests-option.patch} | 0
 ...ch => 0003-make-event-names-use-input.h-from-sysroot-instead-of.patch} | 0
 ...n.patch => 0005-configure.ac-add-disable-python-bindings-option.patch} | 0
 ...onfig-for-the-host.patch => 0001-Build-buildconfig-for-the-host.patch} | 0
 ...files.patch => 0002-Don-t-make-backup-copies-of-installed-files.patch} | 0
 ...ation.patch => 0003-Skip-version-check-and-symlink-installation.patch} | 0
 ...enable-cross-compilation.patch => 0001-enable-cross-compilation.patch} | 0
 ...low-tcl-build-directory.patch => 0002-allow-tcl-build-directory.patch} | 0
 ...6-allow-compiler-override.patch => 0001-allow-compiler-override.patch} | 0
 .../{fb-test-app-override-cflags.patch => 0001-override-cflags.patch}     | 0
 .../{fbgrab-01-fix-static-build.patch => 0001-fix-static-build.patch}     | 0
 package/fbv/{fbv-1.0b-arch.patch.avr32 => 0001-arch.patch.avr32}          | 0
 package/fbv/{fbv-1.0b-cross.patch => 0002-cross.patch}                    | 0
 ...ort-on-big-endian.patch => 0003-fix-24bpp-support-on-big-endian.patch} | 0
 package/fbv/{fbv-1.0b-fix-bgr555.patch => 0004-fix-bgr555.patch}          | 0
 package/fbv/{fbv-1.0b-include.patch => 0005-include.patch}                | 0
 package/fbv/{fbv-1.0b-libpng15.patch => 0006-libpng15.patch}              | 0
 ...1-fix-openssl-static-link.patch => 0001-fix-openssl-static-link.patch} | 0
 package/ffmpeg/{ffmpeg-0001-fminf.patch => 0001-fminf.patch}              | 0
 package/fis/{fis-001-checksum.patch => 0001-checksum.patch}               | 0
 package/fis/{fis-003-list_output.patch => 0003-list_output.patch}         | 0
 package/fis/{fis-004-sorted_list.patch => 0004-sorted_list.patch}         | 0
 .../{flac-01-fix-altivec-logic.patch => 0001-fix-altivec-logic.patch}     | 0
 package/flex/{flex-prog-ar.patch => 0001-prog-ar.patch}                   | 0
 ...ch => 0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch} | 0
 ...kr.com.patch => 0002-Oauth-services-are-on-https-www.flickr.com.patch} | 0
 ...honor-DESTDIR-env.-var.patch => 0001-now-honor-DESTDIR-env.-var.patch} | 0
 .../{flite-0002-fix-alsa-static.patch => 0002-fix-alsa-static.patch}      | 0
 package/fltk/{fltk-01-disable-tests.patch => 0001-disable-tests.patch}    | 0
 package/fltk/{fltk-02-jpeg-9.patch => 0002-jpeg-9.patch}                  | 0
 ...001-add-support-for-uclibc.patch => 0001-add-support-for-uclibc.patch} | 0
 ...mx6q-0001-correct-HAL-include.patch => 0001-correct-HAL-include.patch} | 0
 ...ystemInit-failure.patch => 0001-vpu-io-fix-IOSystemInit-failure.patch} | 0
 ...ecks.patch => 0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch} | 0
 package/ftop/{ftop-0001-overflow.patch => 0001-overflow.patch}            | 0
 ...etfs-test-fix-usb-ch9-include.patch => 0001-fix-usb-ch9-include.patch} | 0
 ...to-usb-dir.patch => 0002-rename-include-usb_gadgetfs-to-usb-dir.patch} | 0
 ...in-0.1.10-no-abstract-sockets.patch => 0001-no-abstract-sockets.patch} | 0
 .../{gamin-0.1.10-no-const-return.patch => 0002-no-const-return.patch}    | 0
 package/gawk/{gawk-01-no-versioned.patch => 0001-no-versioned.patch}      | 0
 package/gcc/4.4.7/{gcc-44-pr39429.patch => 0044-pr39429.patch}            | 0
 package/gd/{gd-01-gdlib-config.patch => 0001-gdlib-config.patch}          | 0
 package/gd/{gd-02-no-zlib.patch => 0002-no-zlib.patch}                    | 0
 ...ix-build-with-uClibc.patch => 0003-gd_bmp-fix-build-with-uClibc.patch} | 0
 package/gd/{gd-04-CVE-2014-2497.patch => 0004-CVE-2014-2497.patch}        | 0
 ...fs.c-to-rev-1.118.patch => 0001-update-genext2fs.c-to-rev-1.118.patch} | 0
 .../genpart/{genpart-fix-return-code.patch => 0001-fix-return-code.patch} | 0
 .../{genromfs-0.5.2-build-system.patch => 0001-build-system.patch}        | 0
 ...text-01-error_print_progname.patch => 0001-error_print_progname.patch} | 0
 ...{giblib-fix-imlib2-detection.patch => 0001-fix-imlib2-detection.patch} | 0
 .../{glibc-0001-accept-make4.patch => 0001-accept-make4.patch}            | 0
 ...l-on-no-thumb-1.patch => 0001-arm-asm-conditional-on-no-thumb-1.patch} | 0
 ...l-on-no-thumb-2.patch => 0002-arm-asm-conditional-on-no-thumb-2.patch} | 0
 ...1.patch => 0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch} | 0
 ...nu-efi-01-use-override-cflags.patch => 0001-use-override-cflags.patch} | 0
 ...-02-parallel-make-archives.patch => 0002-parallel-make-archives.patch} | 0
 .../gnu-efi/{gnu-efi-03-parallel-make.patch => 0003-parallel-make.patch}  | 0
 ...gnuchess-5.07-getline-conflicts.patch => 0001-getline-conflicts.patch} | 0
 package/gnuchess/{gnuchess-5.07.patch => 0002-misc-fixes.patch}           | 0
 ...g2-0001-fix-pth-config-usage.patch => 0001-fix-pth-config-usage.patch} | 0
 ...out-demo-option.patch => 0001-configure-add-without-demo-option.patch} | 0
 ...e-gdlib-config-properly.patch => 0002-use-gdlib-config-properly.patch} | 0
 ...dont-include-from-prefix.patch => 0001-dont-include-from-prefix.patch} | 0
 ...shm-is-false.patch => 0001-Fix-build-error-when-ntpshm-is-false.patch} | 0
 ...sconstruct-disable-rpath.patch => 0002-sconstruct-disable-rpath.patch} | 0
 ...ch => 0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch} | 0
 ...igurable-utf16-support.patch => 0001-configurable-utf16-support.patch} | 0
 package/gqview/{gqview-2.1.5-make.patch => 0001-make.patch}               | 0
 ...2.0-fix-lphread-link-error.patch => 0001-fix-lphread-link-error.patch} | 0
 .../gst-ffmpeg/{gst-ffmpeg-0001-gcc47.patch => 0001-gcc47.patch}          | 0
 ...-instruction.patch => 0002-arm-avoid-using-the-movw-instruction.patch} | 0
 ...lay-add-missing-include.patch => 0001-gplay-add-missing-include.patch} | 0
 ...-configure-script.patch => 0002-Fix-bashism-in-configure-script.patch} | 0
 ...lugins-0003-Use-proper-objdump.patch => 0003-Use-proper-objdump.patch} | 0
 ...ch => 0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch} | 0
 ...NT.patch => 0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch} | 0
 ...{gst-plugin-x170-01-correct-CFLAGS.patch => 0001-correct-CFLAGS.patch} | 0
 ...bug-build.patch => 0001-opus-jpegformat-unbreak-non-debug-build.patch} | 0
 ...-plugins-bad-0002-fix-dfb-example.patch => 0002-fix-dfb-example.patch} | 0
 .../gst-plugins-base/{gst-plugins-base-tremor.patch => 0001-tremor.patch} | 0
 .../{gst-plugins-good-linux36.patch => 0001-linux36.patch}                | 0
 ...patch => 0002-v4l2-fix-compilation-against-newer-kernel-headers.patch} | 0
 .../gstreamer/gstreamer/{gstreamer-01-bison3.patch => 0001-bison3.patch}  | 0
 ...st1-plugins-bad-use-gettext-0.18.patch => 0001-use-gettext-0.18.patch} | 0
 ...e-pregen-xmli18n-header.patch => 0001-use-pregen-xmli18n-header.patch} | 0
 ...ch => 0002-cups-support-replaces-static-with-static-libtool-lib.patch} | 0
 package/haserl/0.8.0/{haserl-0.8.0-legacy.patch => 0001-legacy.patch}     | 0
 ...l-001-add-haserl_lualib.inc.patch => 0001-add-haserl_lualib.inc.patch} | 0
 ...mdal-0001-add-roken-h-process.patch => 0001-add-roken-h-process.patch} | 0
 .../{heimdal-0002-use-Getopt-Std.patch => 0002-use-Getopt-Std.patch}      | 0
 package/heimdal/{heimdal-0003-vendor.patch => 0003-vendor.patch}          | 0
 package/heimdal/{heimdal-0004-compile_et.patch => 0004-compile_et.patch}  | 0
 package/hplip/{hplip-fix-make.patch => 0001-fix-make.patch}               | 0
 .../htop/{htop-01-native-affinity.patch => 0001-native-affinity.patch}    | 0
 ...fix-math-library-linking.patch => 0001-fix-math-library-linking.patch} | 0
 ...tic-dynamic-twice.patch => 0001-dont-build-static-dynamic-twice.patch} | 0
 ...rkaround-toolchain-bugs.patch => 0002-workaround-toolchain-bugs.patch} | 0
 ...piler-symbol-prefix.patch => 0003-detect-compiler-symbol-prefix.patch} | 0
 ...nk-icudata-as-data-only.patch => 0004-link-icudata-as-data-only.patch} | 0
 package/ifplugd/{ifplugd-cross.patch => 0001-cross.patch}                 | 0
 package/ifplugd/{ifplugd-fix-headers.patch => 0002-fix-headers.patch}     | 0
 package/ifplugd/{ifplugd-no-cxx.patch => 0003-no-cxx.patch}               | 0
 package/igmpproxy/{igmpproxy-01-uclinux.patch => 0001-uclinux.patch}      | 0
 .../{imagemagick-01-use-xml2-config.patch => 0001-use-xml2-config.patch}  | 0
 ...nfigure-fix-cross-build.patch => 0001-configure-fix-cross-build.patch} | 0
 package/input-tools/{input-tools-20051019-rint.patch => 0001-rint.patch}  | 0
 package/iostat/{iostat-cpunum.patch => 0001-cpunum.patch}                 | 0
 package/iozone/{iozone-01-targets.patch => 0001-targets.patch}            | 0
 .../{iozone-02-no-nptl-support.patch => 0002-no-nptl-support.patch}       | 0
 .../{iproute2-01-optional-ipv6.patch => 0001-optional-ipv6.patch}         | 0
 ...route2-02-vxlan-optional-ipv6.patch => 0002-vxlan-optional-ipv6.patch} | 0
 ...iprutils-0001-Don-t-use-gettext.patch => 0001-Don-t-use-gettext.patch} | 0
 ...nviro.patch => 0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch} | 0
 ...ies-i.patch => 0003-Fix-static-build-by-passing-the-libraries-i.patch} | 0
 .../{ipsec-tools-001-susv3-legacy.patch => 0001-susv3-legacy.patch}       | 0
 .../{iptables-01-fix-static-link.patch => 0001-fix-static-link.patch}     | 0
 ...atch => 0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch} | 0
 package/irda-utils/{irda-utils-0.9.18-daemon.patch => 0001-daemon.patch}  | 0
 package/irda-utils/{irda-utils-0.9.18-nommu.patch => 0002-nommu.patch}    | 0
 package/irda-utils/{irda-utils-0.9.18-subdir.patch => 0003-subdir.patch}  | 0
 package/jhead/{jhead-use-ldflags.patch => 0001-use-ldflags.patch}         | 0
 ...ions-on-uclibc.patch => 0001-disable-bessel-functions-on-uclibc.patch} | 0
 ...nt-j0-j1-y0-and-y1.patch => 0001-libm.h-comment-j0-j1-y0-and-y1.patch} | 0
 package/json-c/{json-c-no-reentrant.patch => 0001-no-reentrant.patch}     | 0
 .../{kbd-link-against-libintl.patch => 0001-link-against-libintl.patch}   | 0
 .../{kexec-lite-01-clean-restart.patch => 0001-clean-restart.patch}       | 0
 package/kexec/{kexec-0001-largefile.patch => 0001-largefile.patch}        | 0
 ...h => 0001-allow-building-of-the-shared-library-to-be-suppressed.patch} | 0
 .../{keyutils-02-fix-install-rule.patch => 0002-fix-install-rule.patch}   | 0
 package/keyutils/{keyutils-03-cifs.patch => 0003-cifs.patch}              | 0
 ...-04-Makefile-for-buildroot.patch => 0004-Makefile-for-buildroot.patch} | 0
 package/kismet/{kismet-ncurses.patch => 0001-ncurses.patch}               | 0
 package/kismet/{kismet-nobsd.patch => 0002-nobsd.patch}                   | 0
 package/kmod/{kmod-0001-fix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch}  | 0
 ...n-of-be32toh.patch => 0002-add-backup-implementation-of-be32toh.patch} | 0
 .../{kobs-ng-0001-fix-mtd-defines.patch => 0001-fix-mtd-defines.patch}    | 0
 package/latencytop/{latencytop-makefile.patch => 0001-makefile.patch}     | 0
 ...ocs-examples.patch => 0001-Remove-installation-of-docs-examples.patch} | 0
 package/lcdproc/{lcdproc-LCDd.conf.patch => 0001-LCDd.conf.patch}         | 0
 .../{leafnode2-0001-cross_makefile.patch => 0001-cross_makefile.patch}    | 0
 package/libaio/{libaio-0.3.109-arches.patch => 0001-arches.patch}         | 0
 .../{libaio-0.3.109-avr32-support.patch => 0002-avr32-support.patch}      | 0
 package/libaio/{libaio-0.3.109-destdir.patch => 0003-destdir.patch}       | 0
 .../libart/{libart-art-config-cross.patch => 0001-art-config-cross.patch} | 0
 ...batasmart-strpool-cross-flags.patch => 0001-strpool-cross-flags.patch} | 0
 package/libcap/{libcap-01-build-system.patch => 0001-build-system.patch}  | 0
 ...static-shared-install.patch => 0002-split-static-shared-install.patch} | 0
 ...patch => 0001-Fix-unregistering-a-callback-that-wasn-t-register.patch} | 0
 .../{libcec-0002-no-psabi-warning.patch => 0002-no-psabi-warning.patch}   | 0
 package/libcgi/{libcgi.patch => 0001-misc-fixes.patch}                    | 0
 ...documentation-option.patch => 0001-disable-documentation-option.patch} | 0
 ...libconfuse-0000-fix-configure-ac.patch => 0001-fix-configure-ac.patch} | 0
 .../libcue/{libcue-1.4.0-__unused-fix.patch => 0001-_unused-fix.patch}    | 0
 .../{libcuefile-0001-fix-static-link.patch => 0001-fix-static-link.patch} | 0
 package/libcurl/{libcurl-0001-fixtimeout.patch => 0001-fixtimeout.patch}  | 0
 ...istd-h.patch => 0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch} | 0
 package/libdnet/{libdnet-001-python-gcc.patch => 0001-python-gcc.patch}   | 0
 .../{libdnet-002-python-makefile.patch => 0002-python-makefile.patch}     | 0
 .../{libdvdnav-01-fix-os2-support.patch => 0001-fix-os2-support.patch}    | 0
 .../{libdvdread-01-fix-os2-support.patch => 0001-fix-os2-support.patch}   | 0
 ...Xosip2-0000-fix-non-ipv6-build.patch => 0001-fix-non-ipv6-build.patch} | 0
 ...o-detect-openssl.patch => 0002-use-pkg-config-to-detect-openssl.patch} | 0
 ...functions-in-libbsd.patch => 0001-check-bsd-functions-in-libbsd.patch} | 0
 ...001-fix-installation-error.patch => 0001-fix-installation-error.patch} | 0
 ...hack-in-configure.patch => 0002-remove-prefix-hack-in-configure.patch} | 0
 package/libenca/{libenca-003-iconv.patch => 0003-iconv.patch}             | 0
 package/libfcgi/{libfcgi-0000-eof.patch => 0001-eof.patch}                | 0
 ...1-link-against-libfcgi-la.patch => 0002-link-against-libfcgi-la.patch} | 0
 ...{libfcgi-0002-link-against-math.patch => 0003-link-against-math.patch} | 0
 ...fcgi-0003-make-autoreconfable.patch => 0004-make-autoreconfable.patch} | 0
 .../{libfcgi-0004-disable-examples.patch => 0005-disable-examples.patch}  | 0
 ...ion-of-libffi.patch => 0001-Fix-installation-location-of-libffi.patch} | 0
 ...ames-on-MIPS.patch => 0002-Fix-use-of-compact-eh-frames-on-MIPS.patch} | 0
 package/libffi/{libffi-003-fix-typo.patch => 0003-fix-typo.patch}         | 0
 ...win32.S.patch => 0004-Add-missing-GNU-stack-markings-in-win32.S.patch} | 0
 ...x-paths-in-libffi.pc.in.patch => 0005-Fix-paths-in-libffi.pc.in.patch} | 0
 ...ch => 0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch} | 0
 ...libftdi-0.19-01_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch} | 0
 .../{libfuse-fix-aarch64-build.patch => 0001-fix-aarch64-build.patch}     | 0
 ...2.3-Relax-X11-dependencies.patch => 0001-Relax-X11-dependencies.patch} | 0
 ...der-uClibc.patch => 0001-Fix-build-on-Linux-x86_64-under-uClibc.patch} | 0
 ...sys_symbol_underscore.patch => 0001-ac_cv_sys_symbol_underscore.patch} | 0
 .../libgcrypt/{libgcrypt-01-reconfigure.patch => 0002-reconfigure.patch}  | 0
 .../{libgeotiff-0001-use-pkg-config.patch => 0001-use-pkg-config.patch}   | 0
 .../{libglib2-0001-optional-ipv6.patch => 0001-optional-ipv6.patch}       | 0
 .../{pango/pango-0002-no-gtk-doc.patch => libglib2/0002-no-gtk-doc.patch} | 0
 ...ively-on-Linux.patch => 0003-implement-GMutex-natively-on-Linux.patch} | 0
 .../{libgtk2-reduce-dependencies.patch => 0001-reduce-dependencies.patch} | 0
 package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch}  | 0
 ...2-fix-introspection-check.patch => 0002-fix-introspection-check.patch} | 0
 ...ibgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} | 0
 ...dle-with-debug-flags.patch => 0001-dont-fiddle-with-debug-flags.patch} | 0
 ...-0002-no-newline-in-ldflags.patch => 0002-no-newline-in-ldflags.patch} | 0
 package/libhid/{libhid-0003-uclinux.patch => 0003-uclinux.patch}          | 0
 ...binput_log_msg.patch => 0001-rename-log_msg-to-libinput_log_msg.patch} | 0
 ...ch => 0001-cmake-handle-static-library-and-find-required-thread.patch} | 0
 .../{libiqrf-use-only-c-language.patch => 0002-use-only-c-language.patch} | 0
 ...ir-objects.patch => 0001-Fix-warnings-related-to-subdir-objects.patch} | 0
 ...atch => 0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch} | 0
 ...-compilation.patch => 0003-Fix-CUnit-test-for-cross-compilation.patch} | 0
 ...ng-issues.patch => 0004-examples-fix-uint64_t-formatting-issues.patch} | 0
 ...ated-issues.patch => 0005-ld_iscsi-fix-largefile-related-issues.patch} | 0
 ...json-0001-fix-broken-makefile.patch => 0001-fix-broken-makefile.patch} | 0
 package/liblockfile/{liblockfile-install.patch => 0001-install.patch}     | 0
 package/liblogging/{liblogging-01-stdarg.patch => 0001-stdarg.patch}      | 0
 ...ps-h-constraint-removal.patch => 0001-mips-h-constraint-removal.patch} | 0
 ...mad-0.15.1b-optimization.patch.avr32 => 0002-optimization.patch.avr32} | 0
 ...remove-deprecated-cflags.patch => 0003-remove-deprecated-cflags.patch} | 0
 ...{libmad-0.15.1b-thumb2-fixed-arm.patch => 0004-thumb2-fixed-arm.patch} | 0
 ...{libmad-0.15.1b-thumb2-imdct-arm.patch => 0005-thumb2-imdct-arm.patch} | 0
 package/libmcrypt/{libmcrypt-nocxx.patch => 0001-nocxx.patch}             | 0
 .../{libmemcached-01-disable-tests.patch => 0001-disable-tests.patch}     | 0
 package/libmnl/{libmnl-01-uclinux.patch => 0001-uclinux.patch}            | 0
 .../{libmpdclient-0001-musl-fixes.patch => 0001-musl-fixes.patch}         | 0
 package/libmpeg2/{libmpeg2-0.5.1-altivec.patch => 0001-altivec.patch}     | 0
 package/libmpeg2/{libmpeg2-0.5.1-armv4l.patch => 0002-armv4l.patch}       | 0
 .../{libnetfilter_acct-01-uclinux.patch => 0001-uclinux.patch}            | 0
 .../{libnetfilter_conntrack-01-uclinux.patch => 0001-uclinux.patch}       | 0
 .../{libnetfilter_cthelper-01-uclinux.patch => 0001-uclinux.patch}        | 0
 .../{libnetfilter_cttimeout-01-uclinux.patch => 0001-uclinux.patch}       | 0
 .../{libnetfilter_log-01-uclinux.patch => 0001-uclinux.patch}             | 0
 .../{libnetfilter_queue-01-uclinux.patch => 0001-uclinux.patch}           | 0
 ...ptional.patch => 0001-build-systems-make-example-build-optional.patch} | 0
 .../libnfnetlink/{libnfnetlink-01-uclinux.patch => 0001-uclinux.patch}    | 0
 .../{libnftnl-0001-rename-xfree.patch => 0001-rename-xfree.patch}         | 0
 ...atch => 0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch} | 0
 package/libnspr/{libnspr-0001-nios2.patch => 0001-nios2.patch}            | 0
 package/libnspr/{libnspr-0002-microblaze.patch => 0002-microblaze.patch}  | 0
 .../libnss/{libnss-0001-cross-compile.patch => 0001-cross-compile.patch}  | 0
 package/libnss/{libnss-0002-uclibc.patch => 0002-uclibc.patch}            | 0
 ...move-libnl-include-path.patch => 0001-remove-libnl-include-path.patch} | 0
 ...-is-also-linux.patch => 0002-configure.in-uclinux-is-also-linux.patch} | 0
 package/libplayer/{libplayer-add-fpic.patch => 0001-add-fpic.patch}       | 0
 ...bplayer-fix-configure-cflags.patch => 0002-fix-configure-cflags.patch} | 0
 .../libpng/{libpng-01-disable-tools.patch => 0001-disable-tools.patch}    | 0
 ...bpng-02-ignore-symbol-prefix.patch => 0002-ignore-symbol-prefix.patch} | 0
 ...ild-on-linux-3.x-host.patch => 0001-fix-build-on-linux-3.x-host.patch} | 0
 ...t_in_build.patch => 0001-disable_shared_library_target_in_build.patch} | 0
 ...ders-from-sysroot.patch => 0001-use-system-headers-from-sysroot.patch} | 0
 ...-dependency-on-proc.patch => 0002-Remove-the-dependency-on-proc.patch} | 0
 ...bsepol-01-support-static-only.patch => 0001-support-static-only.patch} | 0
 ...1-disable-python-bindings.patch => 0001-disable-python-bindings.patch} | 0
 ...missing-header-include.patch => 0002-add-missing-header-include.patch} | 0
 .../{libsigsegv-0001-fix-avr32-build.patch => 0001-fix-avr32-build.patch} | 0
 ...bsigsegv-0002-fix-aarch64-build.patch => 0002-fix-aarch64-build.patch} | 0
 ...gv-0003-fix-microblaze-build.patch => 0003-fix-microblaze-build.patch} | 0
 .../{libsigsegv-0004-fix-bfin-build.patch => 0004-fix-bfin-build.patch}   | 0
 package/libsndfile/{libsndfile-srconly.patch => 0001-srconly.patch}       | 0
 package/libsoup/{libsoup-01-python3-fix.patch => 0001-python3-fix.patch}  | 0
 ...trophe-01-make-autoreconfable.patch => 0001-make-autoreconfable.patch} | 0
 ...-libxml2.patch => 0002-configure.ac-fix-misdetection-of-libxml2.patch} | 0
 ...t-static-declaration.patch => 0001-fix-expat-static-declaration.patch} | 0
 ...ny-01-disable-debug-printfs.patch => 0001-disable-debug-printfs.patch} | 0
 .../{libsvgtiny-02-create-builddir.patch => 0002-create-builddir.patch}   | 0
 ...port.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} | 0
 ...ch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} | 0
 ...-IPv6-support-optional.patch => 0004-Make-IPv6-support-optional.patch} | 0
 ...sources.patch => 0008-Add-rpcgen-program-from-nfs-utils-sources.patch} | 0
 ...ch => 0009-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
 ...ch => 0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
 ...{libtool-01-mips64-n64-linking.patch => 0001-mips64-n64-linking.patch} | 0
 .../{libtorrent-cross_compile.patch => 0001-cross_compile.patch}          | 0
 ...{libubox-01-drop-legacy-json-c.patch => 0001-drop-legacy-json-c.patch} | 0
 .../{libunwind-01-disable-tests.patch => 0001-disable-tests.patch}        | 0
 ...-ARM-v6.patch => 0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} | 0
 ...-and-4.8.1.patch => 0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch} | 0
 ...libraries.patch => 0001-fixup-lfs-mismatch-in-preload-libraries.patch} | 0
 .../{libva-intel-driver-0001-wayland.patch => 0001-wayland.patch}         | 0
 .../libva/{libva-0001-no_test_decode.patch => 0001-no_test_decode.patch}  | 0
 package/libva/{libva-0002-wayland.patch => 0002-wayland.patch}            | 0
 ...server-0001-CVE-2014-6051-6052.patch => 0001-CVE-2014-6051-6052.patch} | 0
 .../{libvncserver-0002-CVE-2014-6053.patch => 0002-CVE-2014-6053.patch}   | 0
 .../{libvncserver-0003-CVE-2014-6054.patch => 0003-CVE-2014-6054.patch}   | 0
 .../{libvncserver-0004-CVE-2014-6055.patch => 0004-CVE-2014-6055.patch}   | 0
 ...e-project-language.patch => 0001-cmake-set-the-project-language.patch} | 0
 ...ch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} | 0
 ...xmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} | 0
 ...2-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} | 0
 .../{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch}  | 0
 ...4-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} | 0
 ...1-Fix-default-config-file.patch => 0001-Fix-default-config-file.patch} | 0
 package/links/{links-0001-no-largefile.patch => 0001-no-largefile.patch}  | 0
 .../links/{links-0002-CVE-2013-6050.patch => 0002-CVE-2013-6050.patch}    | 0
 ...ch => 0001-headers_install-fix-__packed-in-exported-kernel-head.patch} | 0
 package/linux-pam/{linux-pam-01-configure.patch => 0001-configure.patch}  | 0
 .../{linux-pam-02-doc-makefile-am.patch => 0002-doc-makefile-am.patch}    | 0
 package/linux-pam/{linux-pam-03-group.patch => 0003-group.patch}          | 0
 package/linux-pam/{linux-pam-04-mkdir.patch => 0004-mkdir.patch}          | 0
 package/linux-pam/{linux-pam-05-succeed.patch => 0005-succeed.patch}      | 0
 package/linux-pam/{linux-pam-06-time.patch => 0006-time.patch}            | 0
 package/linux-pam/{linux-pam-07-rhosts.patch => 0007-rhosts.patch}        | 0
 ...Remove-test-serial.patch => 0001-test-serial-Remove-test-serial.patch} | 0
 package/lite/{lite-dfbspy-stat.patch => 0001-dfbspy-stat.patch}           | 0
 package/lite/{lite-no-tests.patch => 0002-no-tests.patch}                 | 0
 package/lite/{lite-pkg-config.patch => 0003-pkg-config.patch}             | 0
 .../{lm-sensors-0001-static-build.patch => 0001-static-build.patch}       | 0
 ...lm-sensors-0002-no-host-ldconfig.patch => 0002-no-host-ldconfig.patch} | 0
 .../{lockfile-progs-01-sus3v-legacy.patch => 0001-sus3v-legacy.patch}     | 0
 .../{log4cxx-0001-charset-fixes.patch => 0001-charset-fixes.patch}        | 0
 .../{log4cxx-0002-missing-includes.patch => 0002-missing-includes.patch}  | 0
 .../{log4cxx-0003-missing-includes.patch => 0003-missing-includes.patch}  | 0
 package/lshw/{lshw-add-LIBS.patch => 0001-add-LIBS.patch}                 | 0
 package/lsof/{lsof-0001-makefile.patch => 0001-makefile.patch}            | 0
 package/lsof/{lsof-0002-noportmap.patch => 0002-noportmap.patch}          | 0
 .../lsof/{lsof-0003-override-cflags.patch => 0003-override-cflags.patch}  | 0
 ...4-remove-susvlegacy-funcs.patch => 0004-remove-susvlegacy-funcs.patch} | 0
 ...x-build-on-uClibc-exp10.patch => 0001-fix-build-on-uClibc-exp10.patch} | 0
 package/ltrace/{ltrace-01-events.patch => 0001-events.patch}              | 0
 package/ltrace/{ltrace-02-arm-plt.patch => 0002-arm-plt.patch}            | 0
 ...ltrace-03-PPC-fix-PPC32-build.patch => 0003-PPC-fix-PPC32-build.patch} | 0
 ...-fallocate-in-uclibc.patch => 0001-no-posix-fallocate-in-uclibc.patch} | 0
 package/lua/5.1.5/{lua-01-root-path.patch => 0001-root-path.patch}        | 0
 .../{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch}  | 0
 package/lua/5.1.5/{lua-11-linenoise.patch => 0011-linenoise.patch}        | 0
 .../{lua-12-fix-reader-at-eoz.patch => 0012-fix-reader-at-eoz.patch}      | 0
 package/lua/5.2.3/{lua-01-root-path.patch => 0001-root-path.patch}        | 0
 .../{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch}  | 0
 package/lua/5.2.3/{lua-04-lua-pc.patch => 0004-lua-pc.patch}              | 0
 package/lua/5.2.3/{lua-11-linenoise.patch => 0011-linenoise.patch}        | 0
 ...afilesystem-without_large_file.patch => 0001-without_large_file.patch} | 0
 .../luajit/{luajit-04-no-bin-symlink.patch => 0004-no-bin-symlink.patch}  | 0
 package/luajit/{luajit-05-install-inc.patch => 0005-install-inc.patch}    | 0
 package/luajit/{luajit-06-install-so.patch => 0006-install-so.patch}      | 0
 .../luasocket/{luasocket-01-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch}  | 0
 package/lxc/{lxc-01-drop-werror.patch => 0001-drop-werror.patch}          | 0
 ....2b-switch-to-new-alsa-api.patch => 0001-switch-to-new-alsa-api.patch} | 0
 ...matchbox-lib-0001-index-is-legacy.patch => 0001-index-is-legacy.patch} | 0
 .../{matchbox-lib-0002-libpng15.patch => 0002-libpng15.patch}             | 0
 ...tchbox-lib-0003-include-setjmp-h.patch => 0003-include-setjmp-h.patch} | 0
 ...chbox-panel-0.9.3-index-is-legacy.patch => 0001-index-is-legacy.patch} | 0
 ...atchbox-startup-monitor-0.1-true-false.patch => 0001-true-false.patch} | 0
 .../{matchbox-wm-defaulttheme.patch => 0001-defaulttheme.patch}           | 0
 package/mcrypt/{mcrypt-CVE-2012-4409.patch => 0001-CVE-2012-4409.patch}   | 0
 package/mcrypt/{mcrypt-CVE-2012-4426.patch => 0002-CVE-2012-4426.patch}   | 0
 package/mcrypt/{mcrypt-CVE-2012-4527.patch => 0003-CVE-2012-4527.patch}   | 0
 package/mcrypt/{mcrypt-no-rpath.patch => 0004-no-rpath.patch}             | 0
 ...and-mdmon.patch => 0010-add-install-targets-for-mdadm-and-mdmon.patch} | 0
 ...-dont-force-largefile.patch => 0020-uclibc-dont-force-largefile.patch} | 0
 ....patch => 0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch} | 0
 ...> 0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch} | 0
 package/mediastreamer/{mediastreamer-0001.patch => 0001-misc-fixes.patch} | 0
 package/memstat/{memstat-0001-PATH_MAX.patch => 0001-PATH_MAX.patch}      | 0
 .../memtester/{memtester-makefile-fix.patch => 0001-makefile-fix.patch}   | 0
 ...atch => 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch} | 0
 package/mesa3d/{mesa3d-0002-execinfo_h.patch => 0002-execinfo_h.patch}    | 0
 .../{metacity-add-libm-reference.patch => 0001-add-libm-reference.patch}  | 0
 package/metacity/{metacity-gconf.patch => 0002-gconf.patch}               | 0
 ...ity-mag-add-libm-reference.patch => 0003-mag-add-libm-reference.patch} | 0
 package/mii-diag/{mii-diag-strchr.patch => 0001-strchr.patch}             | 0
 ...c-utils-001-fix-mmc-h-includes.patch => 0001-fix-mmc-h-includes.patch} | 0
 ...e-conditional-define.patch => 0001-largefile-conditional-define.patch} | 0
 ...-compile-procer.patch => 0001-use-CC-variable-to-compile-procer.patch} | 0
 .../{mongrel2-0002-Do-not-run-tests.patch => 0002-Do-not-run-tests.patch} | 0
 ...s-compilation.patch => 0003-Fix-Makefiles-for-cross-compilation.patch} | 0
 .../{monit-0001-no-force-static.patch => 0001-no-force-static.patch}      | 0
 package/mono/{mono-001-gc-fix-uclibc.patch => 0001-gc-fix-uclibc.patch}   | 0
 ...{mono-002-support-uclibc-musl.patch => 0002-support-uclibc-musl.patch} | 0
 ...-0001-disable-install-strip.patch => 0001-disable-install-strip.patch} | 0
 .../{mplayer-0002-fix-cc-parsing.patch => 0002-fix-cc-parsing.patch}      | 0
 ...5-async-interface.patch => 0003-mpdemux-live555-async-interface.patch} | 0
 .../{mplayer-0004-add-arc-support.patch => 0004-add-arc-support.patch}    | 0
 package/mrouted/{mrouted-bcopy.patch => 0001-bcopy.patch}                 | 0
 ...h-call-under-uClibc.patch => 0001-Fix-rpmatch-call-under-uClibc.patch} | 0
 package/musepack/{musepack-0001-shared.patch => 0001-shared.patch}        | 0
 ...ch => 0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} | 0
 package/mutt/{mutt-01-nodoc.patch => 0001-nodoc.patch}                    | 0
 ...target-installation.patch => 0001-fix-cross-target-installation.patch} | 0
 .../mysql/{mysql-0000-ac_cache_check.patch => 0001-ac_cache_check.patch}  | 0
 ...configure-ps-cache-check.patch => 0002-configure-ps-cache-check.patch} | 0
 ...002-use-new-readline-iface.patch => 0003-use-new-readline-iface.patch} | 0
 ...ck_direction-is-unset.patch => 0004-ac_stack_direction-is-unset.patch} | 0
 ...gen_lex_hash-execution.patch => 0005-Fix-gen_lex_hash-execution.patch} | 0
 ...ql_server_build.patch => 0006-bison_3_breaks_mysql_server_build.patch} | 0
 ...xup-pkg-config-handling.patch => 0001-fixup-pkg-config-handling.patch} | 0
 ...trace-tcp-upd-uClibc-fix.patch => 0001-trace-tcp-upd-uClibc-fix.patch} | 0
 ....patch => 0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch} | 0
 ...var.patch => 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} | 0
 ...cat-0.7.1-signed-bit-counting.patch => 0001-signed-bit-counting.patch} | 0
 .../{netplug-1.2.9.2-makefile-flags.patch => 0001-makefile-flags.patch}   | 0
 .../netsnmp/{netsnmp-001-CVE-2014-2285.patch => 0001-CVE-2014-2285.patch} | 0
 ...ch => 0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch} | 0
 package/newt/{newt-fix-makefile.patch => 0001-fix-makefile.patch}         | 0
 package/nfacct/{nfacct-01-uclinux.patch => 0001-uclinux.patch}            | 0
 ...tch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} | 0
 ...2-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} | 0
 ...of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} | 0
 ...-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} | 0
 ...ch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} | 0
 ...ch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} | 0
 ...def-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} | 0
 ...ch => 0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch} | 0
 ...ch => 0002-auto-feature-add-mechanism-allowing-to-force-feature.patch} | 0
 ...ch => 0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch} | 0
 ...ch => 0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch} | 0
 ...y.patch => 0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch} | 0
 package/ngrep/{ngrep-0001-make-objs.patch => 0001-make-objs.patch}        | 0
 package/ngrep/{ngrep-0002-pcre-header.patch => 0002-pcre-header.patch}    | 0
 .../{ngrep-0003-fix-static-link.patch => 0003-fix-static-link.patch}      | 0
 ...ython-bz2-dependency.patch => 0001-remove-python-bz2-dependency.patch} | 0
 ...mand-to-use-CXX.patch => 0002-gyp-force-link-command-to-use-CXX.patch} | 0
 ...dejs-0003-use-python-variable.patch => 0003-use-python-variable.patch} | 0
 package/ntp/{ntp-001-adjtimex.patch => 0001-adjtimex.patch}               | 0
 package/ntp/{ntp-002-nano.patch => 0002-nano.patch}                       | 0
 package/nut/{nut-0001-foo-config.patch => 0001-foo-config.patch}          | 0
 package/nut/{nut-0002-parallel-build.patch => 0002-parallel-build.patch}  | 0
 .../nuttcp/{nuttcp-6.1.2-susv3-legacy.patch => 0001-susv3-legacy.patch}   | 0
 .../{ocf-linux-01-modules-cross.patch => 0001-modules-cross.patch}        | 0
 .../ofono/{ofono-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch}   | 0
 .../{ola-0001-fix-build-warning.patch => 0001-fix-build-warning.patch}    | 0
 ...onfigure.ac.patch => 0002-move-python-sub-check-to-configure.ac.patch} | 0
 ...patch => 0003-fix-check-for-python-module-for-cross-compilation.patch} | 0
 ...{olsr-configurable-ldconfig.patch => 0001-configurable-ldconfig.patch} | 0
 .../{open2300-0001-fix-makefile.patch => 0001-fix-makefile.patch}         | 0
 ...ode-compilation.patch => 0001-core-fix-x86-PIC-code-compilation.patch} | 0
 ...cross-compiling.patch => 0001-libusb_check_when_cross-compiling.patch} | 0
 ...deprecated_functions.patch => 0002-replace_deprecated_functions.patch} | 0
 ...patch => 0001-fix-cross-compilation-host-libsub-was-used-before.patch} | 0
 ...eakpoint_pc.patch => 0002-fix-xscale-uninitialise-breakpoint_pc.patch} | 0
 .../openocd/{openocd-0003-force-gnu99.patch => 0003-force-gnu99.patch}    | 0
 ...nocd-0004-force_jimtcl_static.patch => 0004-force_jimtcl_static.patch} | 0
 ...penocd-0005-dont-force-ldflags.patch => 0005-dont-force-ldflags.patch} | 0
 .../{openocd-0006-automake-compat.patch => 0006-automake-compat.patch}    | 0
 ...nt.patch => 0001-version_generator.py-make-it-python3-compliant.patch} | 0
 package/openpgm/{openpgm-cross-compile.patch => 0002-cross-compile.patch} | 0
 ...-INSTALL.patch => 0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} | 0
 ...libc-pthreads-clash.patch => 0001-fix-pam-uclibc-pthreads-clash.patch} | 0
 ...penssh-02-fix-howmany-include.patch => 0002-fix-howmany-include.patch} | 0
 .../{openssl-001-do-not-build-docs.patch => 0001-do-not-build-docs.patch} | 0
 ...l-002-dont-force-large-file.patch => 0002-dont-force-large-file.patch} | 0
 ...ion.patch => 0003-cryptodev-Fix-issue-with-signature-generation.patch} | 0
 .../openssl/{openssl-004-musl-termios.patch => 0004-musl-termios.patch}   | 0
 .../{openvmtools-01-has_bsd_printf.patch => 0001-has_bsd_printf.patch}    | 0
 .../{openvmtools-02-network_script.patch => 0002-network_script.patch}    | 0
 ...ionally-define-g_info.patch => 0003-conditionally-define-g_info.patch} | 0
 ...{openvmtools-04-no_cflags_werror.patch => 0004-no_cflags_werror.patch} | 0
 ...mtools-05-dont-force-cppflags.patch => 0005-dont-force-cppflags.patch} | 0
 ...enable-lookup_dcookie.patch => 0001-avr32-enable-lookup_dcookie.patch} | 0
 ...ch => 0002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch} | 0
 ...patch => 0003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch} | 0
 package/opus-tools/{opus-tools-largefile.patch => 0001-largefile.patch}   | 0
 ...h => 0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch} | 0
 ...e-in-Makefile.patch => 0001-fix-CROSS_COMPILE-usage-in-Makefile.patch} | 0
 ...owl-linux-fix-for-linux-3.3.x.patch => 0002-fix-for-linux-3.3.x.patch} | 0
 ....patch => 0001-Fix-build-against-older-pthreads-implementations.patch} | 0
 package/pango/{pango-0001-no-tests.patch => 0001-no-tests.patch}          | 0
 .../libglib2-0002-no-gtk-doc.patch => pango/0002-no-gtk-doc.patch}        | 0
 ...arted-001-readline-deprecated.patch => 0001-readline-deprecated.patch} | 0
 ...-is-also-linux.patch => 0002-configure.ac-uclinux-is-also-linux.patch} | 0
 .../{pcmanfm-link-against-libx11.patch => 0001-link-against-libx11.patch} | 0
 package/pcre/{pcre-01-no-compat.patch => 0001-no-compat.patch}            | 0
 package/pcre/{pcre-02-no-cpp-tests.patch => 0002-no-cpp-tests.patch}      | 0
 ...hread-needed-for-libusb.patch => 0001-pthread-needed-for-libusb.patch} | 0
 package/perl-gd/{perl-gd-01-getoptions.patch => 0001-getoptions.patch}    | 0
 package/perl-gd/{perl-gd-02-lgd.patch => 0002-lgd.patch}                  | 0
 package/perl-gd/{perl-gd-03-force.patch => 0003-force.patch}              | 0
 ...net-ssleay-0000-fix-build-system.patch => 0001-fix-build-system.patch} | 0
 .../{perl-xml-libxml-01-Makefile-PL.patch => 0001-Makefile-PL.patch}      | 0
 package/perl/{perl-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch}           | 0
 package/php/{php-01-no-iconv-search.patch => 0001-no-iconv-search.patch}  | 0
 package/php/{php-02-dlopen.patch => 0002-dlopen.patch}                    | 0
 package/php/{php-03-disable-pharcmd.patch => 0003-disable-pharcmd.patch}  | 0
 ...-compile-friendly.patch => 0001-Makefile-cross-compile-friendly.patch} | 0
 ...ds-0002-Makefile-use-LDFLAGS.patch => 0002-Makefile-use-LDFLAGS.patch} | 0
 .../pkgconf/{pkgconf-01-fix-variable.patch => 0001-fix-variable.patch}    | 0
 ...{pkgconf-02-fix-double-sysroot.patch => 0002-fix-double-sysroot.patch} | 0
 package/poco/{poco-aarch64.patch => 0001-aarch64.patch}                   | 0
 ...oco-add-cross-build-config.patch => 0002-add-cross-build-config.patch} | 0
 ...o-add-staging-search-path.patch => 0003-add-staging-search-path.patch} | 0
 ...{poco-dont-build-debug-libs.patch => 0004-dont-build-debug-libs.patch} | 0
 .../{polarssl-01-no-test-suite.patch => 0001-no-test-suite.patch}         | 0
 ...-02-disable-microblaze-asm.patch => 0002-disable-microblaze-asm.patch} | 0
 ...ch => 0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} | 0
 package/popt/{popt-01-no-wchar.patch => 0001-no-wchar.patch}              | 0
 package/popt/{popt-02-fix-autoreconf.patch => 0002-fix-autoreconf.patch}  | 0
 package/popt/{popt-03-glob-detection.patch => 0003-glob-detection.patch}  | 0
 ...cp-wrapper-doc.patch => 0001-README-fix-typo-in-tcp-wrapper-doc.patch} | 0
 ...controllable.patch => 0002-NO_PIE-make-PIE-support-controllable.patch} | 0
 ...s.patch => 0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch} | 0
 ...bol.patch => 0004-NO_PERROR-control-overriding-of-perror-symbol.patch} | 0
 package/portmap/{portmap-6.0-tcpd.patch => 0005-tcpd.patch}               | 0
 .../{pptp-linux-001-susv3-legacy.patch => 0001-susv3-legacy.patch}        | 0
 ...p-linux-002-fix-parallel-build.patch => 0002-fix-parallel-build.patch} | 0
 package/prboom/{prboom-2.5.0-libpng-1.4.patch => 0001-libpng-1.4.patch}   | 0
 .../{procps-ng-0000-remove-index.patch => 0001-remove-index.patch}        | 0
 ...lity-version.patch => 0001-fix-kernel-header-capability-version.patch} | 0
 package/proftpd/{proftpd-0002-__mempcpy.patch => 0002-__mempcpy.patch}    | 0
 ...{psmisc-link-against-libintl.patch => 0001-link-against-libintl.patch} | 0
 package/psmisc/{psmisc-no-__progname.patch => 0002-no-__progname.patch}   | 0
 package/pure-ftpd/{pure-ftpd-0001-cross.patch => 0001-cross.patch}        | 0
 ...xecutable-path.patch => 0001-set-correct-python-executable-path.patch} | 0
 .../{python-netifaces-ifaddrs-uclibc.patch => 0001-ifaddrs-uclibc.patch}  | 0
 .../python-nfc/{python-nfc-add-setup-py.patch => 0001-add-setup-py.patch} | 0
 ...on-numpy-0001-no-fenv-on-uclibc.patch => 0001-no-fenv-on-uclibc.patch} | 0
 ...ncorrect-header-path.patch => 0001-remove-incorrect-header-path.patch} | 0
 ...etect.patch => 0001-use-buildroot-zmq-version-instead-of-detect.patch} | 0
 ...hon-setuptools-0001-add-executable.patch => 0001-add-executable.patch} | 0
 ...1-remove-host-header-path.patch => 0001-remove-host-header-path.patch} | 0
 ...{python-002-fix-get-python-inc.patch => 0002-fix-get-python-inc.patch} | 0
 ...t-if-python-build.patch => 0003-properly-detect-if-python-build.patch} | 0
 ...a-install-location.patch => 0004-sysconfigdata-install-location.patch} | 0
 ...ython-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} | 0
 ...oss-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} | 0
 ...{python-007-disable-extensions.patch => 0007-disable-extensions.patch} | 0
 ...s-use-python-sysroot.patch => 0008-distutils-use-python-sysroot.patch} | 0
 ...hon-009-no-termcap-host-path.patch => 0009-no-termcap-host-path.patch} | 0
 .../{python-010-fix-python-config.patch => 0010-fix-python-config.patch}  | 0
 ...n-011-remove-python-symlink.patch => 0011-remove-python-symlink.patch} | 0
 ...-old-compilers.patch => 0012-support-library-path-old-compilers.patch} | 0
 ...3-dont-add-multiarch-path.patch => 0013-dont-add-multiarch-path.patch} | 0
 ...4-abort-on-failed-modules.patch => 0014-abort-on-failed-modules.patch} | 0
 ...sqlite-without-threads.patch => 0015-fix-sqlite-without-threads.patch} | 0
 ...6-serial-ioctl-workaround.patch => 0016-serial-ioctl-workaround.patch} | 0
 ...ust-shebang.patch => 0017-distutils-scripts-dont-adjust-shebang.patch} | 0
 ...n-100-optional-test-modules.patch => 0100-optional-test-modules.patch} | 0
 .../python/{python-101-optional-pydoc.patch => 0101-optional-pydoc.patch} | 0
 .../python/{python-102-optional-2to3.patch => 0102-optional-2to3.patch}   | 0
 .../{python-103-optional-sqlite.patch => 0103-optional-sqlite.patch}      | 0
 package/python/{python-104-optional-tk.patch => 0104-optional-tk.patch}   | 0
 .../{python-105-optional-curses.patch => 0105-optional-curses.patch}      | 0
 .../python/{python-106-optional-expat.patch => 0106-optional-expat.patch} | 0
 ...ython-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} | 0
 package/python/{python-108-optional-nis.patch => 0108-optional-nis.patch} | 0
 ...hon-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} | 0
 package/python/{python-110-optional-db.patch => 0110-optional-db.patch}   | 0
 package/python/{python-111-optional-ssl.patch => 0111-optional-ssl.patch} | 0
 .../python/{python-112-optional-bzip2.patch => 0112-optional-bzip2.patch} | 0
 .../python/{python-113-optional-zlib.patch => 0113-optional-zlib.patch}   | 0
 ...{python-114-remove-idle-editor.patch => 0114-remove-idle-editor.patch} | 0
 ...1-remove-host-header-path.patch => 0001-remove-host-header-path.patch} | 0
 ...t-if-python-build.patch => 0002-properly-detect-if-python-build.patch} | 0
 ...a-install-location.patch => 0003-sysconfigdata-install-location.patch} | 0
 .../{python3-004-old-stdlib-cache.patch => 0004-old-stdlib-cache.patch}   | 0
 ...thon3-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} | 0
 ...oss-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} | 0
 ...python3-007-disable-extensions.patch => 0007-disable-extensions.patch} | 0
 ...sconfigdata.patch => 0008-distutils-sysconfig-use-sysconfigdata.patch} | 0
 ...s-use-python-sysroot.patch => 0009-distutils-use-python-sysroot.patch} | 0
 ...on3-010-no-termcap-host-path.patch => 0010-no-termcap-host-path.patch} | 0
 ...-old-compilers.patch => 0011-support-library-path-old-compilers.patch} | 0
 ...2-dont-add-multiarch-path.patch => 0012-dont-add-multiarch-path.patch} | 0
 ...3-abort-on-failed-modules.patch => 0013-abort-on-failed-modules.patch} | 0
 ...4-serial-ioctl-workaround.patch => 0014-serial-ioctl-workaround.patch} | 0
 ...ust-shebang.patch => 0015-distutils-scripts-dont-adjust-shebang.patch} | 0
 ...on3-016-distutils-no-pep3147.patch => 0016-distutils-no-pep3147.patch} | 0
 ...3-100-optional-test-modules.patch => 0100-optional-test-modules.patch} | 0
 .../{python3-101-optional-pydoc.patch => 0101-optional-pydoc.patch}       | 0
 .../python3/{python3-102-optional-2to3.patch => 0102-optional-2to3.patch} | 0
 .../{python3-103-optional-sqlite.patch => 0103-optional-sqlite.patch}     | 0
 package/python3/{python3-104-optional-tk.patch => 0104-optional-tk.patch} | 0
 .../{python3-105-optional-curses.patch => 0105-optional-curses.patch}     | 0
 .../{python3-106-optional-expat.patch => 0106-optional-expat.patch}       | 0
 ...thon3-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} | 0
 .../python3/{python3-108-optional-nis.patch => 0108-optional-nis.patch}   | 0
 ...on3-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} | 0
 .../python3/{python3-110-optional-idle.patch => 0110-optional-idle.patch} | 0
 .../{python3-111-optional-decimal.patch => 0111-optional-decimal.patch}   | 0
 .../{qdecoder-0001-fix-make-install.patch => 0001-fix-make-install.patch} | 0
 ...hardcoded-paths.patch => 0002-configure.ac-drop-hardcoded-paths.patch} | 0
 package/qdecoder/{qdecoder-0003-errno.patch => 0003-errno.patch}          | 0
 package/qextserialport/{qextserialport-gui.patch => 0001-gui.patch}       | 0
 .../{qextserialport-main-include.patch => 0002-main-include.patch}        | 0
 .../{qextserialport-pkgconfig.patch => 0003-pkgconfig.patch}              | 0
 ...in-cmakelists.patch => 0001-fix-qt4-package-error-in-cmakelists.patch} | 0
 ...-0001-remove-absolute-paths.patch => 0001-remove-absolute-paths.patch} | 0
 package/qlibc/{qlibc-0002-obey-destdir.patch => 0002-obey-destdir.patch}  | 0
 ...fix-openssl-mysql-checks.patch => 0003-fix-openssl-mysql-checks.patch} | 0
 package/qt/{qt-configure.patch => 0001-configure.patch}                   | 0
 .../qt/{qt-eglwsegl-use-system.patch => 0002-eglwsegl-use-system.patch}   | 0
 package/qt/{qt-fix-const-atomics.patch => 0003-fix-const-atomics.patch}   | 0
 package/qt/{qt-pthread_getattr_np.patch => 0004-pthread_getattr_np.patch} | 0
 .../qt/{qt-script-qtdbus-no-gui.patch => 0005-script-qtdbus-no-gui.patch} | 0
 package/qt/{qt-uClibc-lfs-fix.patch => 0006-uClibc-lfs-fix.patch}         | 0
 .../{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch}        | 0
 .../{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch}        | 0
 .../{qt5webkit-examples-0001-build.patch => 0001-build.patch}             | 0
 .../{qt5webkit-0001-egl-includepath.patch => 0001-egl-includepath.patch}  | 0
 ...sql-module.patch => 0001-Remove-dependency-on-unused-sql-module.patch} | 0
 ...issing-include.patch => 0001-TuioServer.cpp-add-missing-include.patch} | 0
 ...dont-append-_d-for-debug.patch => 0002-dont-append-_d-for-debug.patch} | 0
 ...{quagga-fix-ipctl-forwarding.patch => 0001-fix-ipctl-forwarding.patch} | 0
 ...uota-01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch} | 0
 ...qwt-remove-installed-check.patch => 0001-remove-installed-check.patch} | 0
 package/radvd/{radvd-01-drop-check.patch => 0001-drop-check.patch}        | 0
 ...advd-02-drop-stack-protector.patch => 0002-drop-stack-protector.patch} | 0
 .../rdesktop/{rdesktop-01-8bit-colors.patch => 0001-8bit-colors.patch}    | 0
 .../readline/{readline-001-curses-link.patch => 0001-curses-link.patch}   | 0
 package/redis/{redis-001-uclibc.patch => 0001-uclibc.patch}               | 0
 package/redis/{redis-002-lua-AR.patch => 0002-lua-AR.patch}               | 0
 ...e-conditional-define.patch => 0003-largefile-conditional-define.patch} | 0
 .../{rp-pppoe-3.10-002-krn-plugin.patch => 0002-krn-plugin.patch}         | 0
 ...-yellow-pages-support.patch => 0001-Remove-yellow-pages-support.patch} | 0
 ...003-Make-IPv6-configurable.patch => 0003-Make-IPv6-configurable.patch} | 0
 ...rland-000-add-pkgconfig-files.patch => 0001-add-pkgconfig-files.patch} | 0
 ...ch => 0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} | 0
 ...and-002-remove-faulty-assert.patch => 0003-remove-faulty-assert.patch} | 0
 ...pi-userland-003-fix-musl-compile.patch => 0004-fix-musl-compile.patch} | 0
 .../{rpm-5.2.0-uclibc-no-lfs-fix.patch => 0001-uclibc-no-lfs-fix.patch}   | 0
 package/rpm/{rpm-5.2.0_depends-fix.patch => 0002-depends-fix.patch}       | 0
 .../{rpm-5.2.0_exclude-some-tools.patch => 0003-exclude-some-tools.patch} | 0
 ...5.2.0_ignore-shared-mutexes.patch => 0004-ignore-shared-mutexes.patch} | 0
 package/rpm/{rpm-5.2.0_no-parentdirs.patch => 0005-no-parentdirs.patch}   | 0
 package/rpm/{rpm-5.2.0_ordering-fix.patch => 0006-ordering-fix.patch}     | 0
 ...5.2.0_parentdir-vs-requires.patch => 0007-parentdir-vs-requires.patch} | 0
 .../{rpm-5.2.0_short-circuit-c99.patch => 0008-short-circuit-c99.patch}   | 0
 .../rrdtool/{rrdtool-automake-compat.patch => 0001-automake-compat.patch} | 0
 ...include-dirs.patch => 0002-configure-dont-hardcode-include-dirs.patch} | 0
 .../{rt-tests-fix-build-system.patch => 0001-fix-build-system.patch}      | 0
 package/rt-tests/{rt-tests-uclibc.patch => 0002-uclibc.patch}             | 0
 .../rtorrent/{rtorrent-cross_compile.patch => 0001-cross_compile.patch}   | 0
 ...host2ip-no-nis-on-uClibc.patch => 0001-host2ip-no-nis-on-uClibc.patch} | 0
 ...nt-use-legacy-functions.patch => 0001-dont-use-legacy-functions.patch} | 0
 package/rubix/{rubix-1.0.5.patch => 0002-misc-fixes.patch}                | 0
 ...amba-0001-fix-smbd-libs-avahi.patch => 0001-fix-smbd-libs-avahi.patch} | 0
 package/samba/{samba-0002-getaddrinfo.patch => 0002-getaddrinfo.patch}    | 0
 ...S-via-array.patch => 0003-build-find-FILE_OFFSET_BITS-via-array.patch} | 0
 ...rrides.patch => 0004-build-allow-some-python-variable-overrides.patch} | 0
 ...size-via-array.patch => 0005-build-find-blkcnt_t-size-via-array.patch} | 0
 ...fix-endian-tests.patch => 0006-build-unify-and-fix-endian-tests.patch} | 0
 ... => 0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch} | 0
 ...ZEOF-utmp-ut_line.patch => 0008-build-tweak-SIZEOF-utmp-ut_line.patch} | 0
 .../{samba4-0009-disable-libbsd.patch => 0009-disable-libbsd.patch}       | 0
 .../{sane-backends-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch}          | 0
 package/sane-backends/{sane-backends-1.0.22-v4l.patch => 0002-v4l.patch}  | 0
 ...ng-gcc-instead-of-ld.patch => 0001-link-using-gcc-instead-of-ld.patch} | 0
 ...001-compiler-sanity-checks.patch => 0001-compiler-sanity-checks.patch} | 0
 ...screen-0002-no-memcpy-fallback.patch => 0002-no-memcpy-fallback.patch} | 0
 ...mpilation-AC_TRY_RUN.patch => 0003-cross-compilation-AC_TRY_RUN.patch} | 0
 ...n-ignore-host-fs.patch => 0004-cross-compilation-ignore-host-fs.patch} | 0
 ...oid-identifying-as-SVR4.patch => 0005-avoid-identifying-as-SVR4.patch} | 0
 ...install-no-backup-binary.patch => 0006-install-no-backup-binary.patch} | 0
 ...en-0007-install-always-chmod.patch => 0007-install-always-chmod.patch} | 0
 ...l-nonversioned-binary.patch => 0008-install-nonversioned-binary.patch} | 0
 ...009-install-dir-dependency.patch => 0009-install-dir-dependency.patch} | 0
 .../{screen-0010-rename-sched_h.patch => 0010-rename-sched_h.patch}       | 0
 ...rrect-directfb-config.patch => 0001-use-correct-directfb-config.patch} | 0
 ...mpilation-with-libx11.patch => 0002-fix-compilation-with-libx11.patch} | 0
 ...-undeclared-error.patch => 0001-Fix-TIOCSRS485-undeclared-error.patch} | 0
 ...{setserial-0001-build-system-fix.patch => 0001-build-system-fix.patch} | 0
 ...2-tiocghayesesp-build-fix.patch => 0002-tiocghayesesp-build-fix.patch} | 0
 ...g-config-support.patch => 0001-configure-add-pkg-config-support.patch} | 0
 package/slang/{slang-01-slsh-libs.patch => 0001-slsh-libs.patch}          | 0
 .../{smstools3-0000-fix-Makefile.patch => 0001-fix-Makefile.patch}        | 0
 ...mppp-01-Add-missing-includes.patch => 0001-Add-missing-includes.patch} | 0
 .../{socat-001-no-documentation.patch => 0001-no-documentation.patch}     | 0
 package/sox/{sox-0001-uclibc.patch => 0001-uclibc.patch}                  | 0
 package/speex/{speex-thumb2-support.patch => 0001-thumb2-support.patch}   | 0
 ...ncy-argument.patch => 0001-fix-missing-monitor_latency-argument.patch} | 0
 ...sume-get-certificate-ok.patch => 0001-assume-get-certificate-ok.patch} | 0
 ...-02-missing-include-time_h.patch => 0002-missing-include-time_h.patch} | 0
 .../{statserial-01-ncurses-link.patch => 0001-ncurses-link.patch}         | 0
 ...ch => 0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch} | 0
 .../{stress-0001-Remove-largefile.patch => 0001-Remove-largefile.patch}   | 0
 package/sudo/{sudo-0001-no-netgroup.patch => 0001-no-netgroup.patch}      | 0
 ...cflags-for-host.patch => 0002-drop-sspcflags-piecflags-for-host.patch} | 0
 ...GLchar-definitions.patch => 0001-Add-missing-GLchar-definitions.patch} | 0
 package/synergy/{synergy-1.3.1-includes.patch => 0001-includes.patch}     | 0
 .../{synergy-1.3.1-remove-werror.patch => 0002-remove-werror.patch}       | 0
 ...-01-define-NT_GNU_BUILD_ID.patch => 0001-define-NT_GNU_BUILD_ID.patch} | 0
 .../{systemd-01-fix-getty-unit.patch => 0001-fix-getty-unit.patch}        | 0
 ...option.patch => 0002-build-sys-revert-use-of-ln-relative-option.patch} | 0
 ...libgcrypt-no-found.patch => 0003-fix-am-path-libgcrypt-no-found.patch} | 0
 ...ch => 0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} | 0
 .../{tar-0001-fix-build-failure.patch => 0001-fix-build-failure.patch}    | 0
 .../{tcl-0001-dont-build-compat.patch => 0001-dont-build-compat.patch}    | 0
 .../thrift/{thrift-01-libevent-cross.patch => 0001-libevent-cross.patch}  | 0
 package/thrift/{thrift-02-autoreconf.patch => 0002-autoreconf.patch}      | 0
 package/thrift/{thrift-03-zlib-cross.patch => 0003-zlib-cross.patch}      | 0
 ...ild-on-OSX-10.9-GM.patch => 0004-failed-to-build-on-OSX-10.9-GM.patch} | 0
 ...ne-uint64_t.patch => 0005-stdlib-and-boost-both-define-uint64_t.patch} | 0
 package/thttpd/{thttpd-2.25b-getline.patch => 0001-getline.patch}         | 0
 package/ti-gfx/{ti-gfx-0000-newclkapi.patch => 0001-newclkapi.patch}      | 0
 ...1-fix-build-omaplfb-linux.patch => 0002-fix-build-omaplfb-linux.patch} | 0
 .../{ti-gfx-km_install_modules.patch => 0003-km_install_modules.patch}    | 0
 package/tinyhttpd/{tinyhttpd.patch => 0001-misc-fixes.patch}              | 0
 package/tn5250/{tn5250-01-ssldir.patch => 0001-ssldir.patch}              | 0
 ...md-0001-Fix-ptrace-detection.patch => 0001-Fix-ptrace-detection.patch} | 0
 .../{transmission-01-fix-utypes.patch => 0001-fix-utypes.patch}           | 0
 .../tslib/{tslib-enable_raw_module.patch => 0001-enable_raw_module.patch} | 0
 ...putattach_utils.patch => 0002-add_finddef_and_inputattach_utils.patch} | 0
 ...ong-with-buildroot.patch => 0001-build-get-along-with-buildroot.patch} | 0
 ...el-build-failure.patch => 0002-build-fix-parallel-build-failure.patch} | 0
 .../{tvheadend-002-no-check_config.patch => 0002-no-check_config.patch}   | 0
 .../{tvheadend-003-remove-werror.patch => 0003-remove-werror.patch}       | 0
 ...1-drop-configh-from-tools.patch => 0001-drop-configh-from-tools.patch} | 0
 package/uboot-tools/{uboot-tools-02-nostrip.patch => 0002-nostrip.patch}  | 0
 package/udpcast/{udpcast-select-h.patch => 0001-select-h.patch}           | 0
 package/uemacs/{uemacs-4.0.15-lt.01.patch => 0001-lt.01.patch}            | 0
 package/uemacs/{uemacs-4.0.15-lt.02.patch => 0002-lt.02.patch}            | 0
 package/uemacs/{uemacs-4.0.15-lt.03.ixon.patch => 0003-lt.03.ixon.patch}  | 0
 .../{unionfs-fuse-no-cxx-needed.patch => 0001-fuse-no-cxx-needed.patch}   | 0
 package/urg/{urg-select-h.patch => 0001-select-h.patch}                   | 0
 .../{usb_modeswitch_data-makefile.patch => 0001-makefile.patch}           | 0
 package/usbmount/{usbmount-rules-fix.patch => 0001-rules-fix.patch}       | 0
 ...ad-of-blkid.patch => 0002-use-udev-environment-instead-of-blkid.patch} | 0
 package/ushare/{ushare-compile-fixes.patch => 0001-compile-fixes.patch}   | 0
 ...x-build-against-bluez-4.patch => 0001-fix-build-against-bluez-4.patch} | 0
 .../{util-linux-001-sscanf-no-ms-as.patch => 0001-sscanf-no-ms-as.patch}  | 0
 ...vocation-short-name.patch => 0002-program-invocation-short-name.patch} | 0
 ...c.patch => 0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} | 0
 ...-to-valac-version.patch => 0001-dont-add-dirty-to-valac-version.patch} | 0
 ...rkaround-SIGSEGV-on-PPC.patch => 0001-workaround-SIGSEGV-on-PPC.patch} | 0
 ...ch => 0002-don-t-enable-largefile-support-unconditionally-on-uC.patch} | 0
 ...-powerpc.patch => 0003-add-missing-ptrace-getsiginfo-on-powerpc.patch} | 0
 package/vde2/{vde2-no-cxx.patch => 0001-no-cxx.patch}                     | 0
 package/vlc/{vlc-0001-vlc-static.patch => 0001-vlc-static.patch}          | 0
 ...tch => 0002-configure.ac-add-check-for-libgcrypt-config-program.patch} | 0
 ...objects-option.patch => 0003-automake-add-subdir-objects-option.patch} | 0
 package/vlc/{vlc-0004-libav.patch => 0004-libav.patch}                    | 0
 package/vpnc/{vpnc-0.5.3-fix-build.patch => 0001-fix-build.patch}         | 0
 package/vpnc/{vpnc-0.5.3-nomanual.patch => 0002-nomanual.patch}           | 0
 package/vpnc/{vpnc-0.5.3-susv3-legacy.patch => 0003-susv3-legacy.patch}   | 0
 .../{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch}       | 0
 ...{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} | 0
 .../vtun/{vtun-001-fix-installation.patch => 0001-fix-installation.patch} | 0
 ...002-fix-ssl-headers-checks.patch => 0002-fix-ssl-headers-checks.patch} | 0
 .../{vtun-003-fixup-configure.in.patch => 0003-fixup-configure.in.patch}  | 0
 ...r-32-bit-autotools.patch => 0001-build-fix-for-32-bit-autotools.patch} | 0
 ...ild-fix-for-gtklauncher.patch => 0002-build-fix-for-gtklauncher.patch} | 0
 ...bkit-0003-detect-harfbuzz-icu.patch => 0003-detect-harfbuzz-icu.patch} | 0
 .../{webkit-0004-disable-docrebase.patch => 0004-disable-docrebase.patch} | 0
 .../webkit/{webkit-0005-disable-tests.patch => 0005-disable-tests.patch}  | 0
 package/webkit/{webkit-0006-execinfo_h.patch => 0006-execinfo_h.patch}    | 0
 package/webkit/{webkit-0007-mips-dfg.patch => 0007-mips-dfg.patch}        | 0
 .../{webkit-0008-support-bison-3.0.patch => 0008-support-bison-3.0.patch} | 0
 ...nk-error-on-uclibc.patch => 0001-spawn-fix-link-error-on-uclibc.patch} | 0
 package/wipe/{wipe-dont-force-lfs.patch => 0001-dont-force-lfs.patch}     | 0
 .../{wireless_tools-01-remove-bzero.patch => 0001-remove-bzero.patch}     | 0
 ...-assumption.patch => 0001-fix-wrong-cflags-for-build-assumption.patch} | 0
 .../{wvdial-0001-uClibc-scandir.patch => 0001-uClibc-scandir.patch}       | 0
 ...-compile-getcontext.patch => 0001-fix-uClibc-compile-getcontext.patch} | 0
 ...o-backtrace.patch => 0002-fix-uClibc-compile-execinfo-backtrace.patch} | 0
 ...3-fix-uClibc-compile-misc.patch => 0003-fix-uClibc-compile-misc.patch} | 0
 .../{wvstreams-0004-build-fixes.patch => 0004-build-fixes.patch}          | 0
 package/wvstreams/{wvstreams-0005-getuid.patch => 0005-getuid.patch}      | 0
 .../xapp_luit/{xapp_luit-posix-openpt.patch => 0001-posix-openpt.patch}   | 0
 ...or-transparent-theme-0001-fix-symlink.patch => 0001-fix-symlink.patch} | 0
 ...r_xf86-input-tslib-0001-fix-segfault.patch => 0001-fix-segfault.patch} | 0
 ...ver_xf86-input-tslib-0002-port-abi-12.patch => 0002-port-abi-12.patch} | 0
 .../{xdriver_xf86-video-ark-0001-mibstore.patch => 0001-mibstore.patch}   | 0
 .../{xdriver_xf86-video-ati-0001-noxaa.patch => 0001-noxaa.patch}         | 0
 .../{xdriver_xf86-video-ati-0002-mibstore.patch => 0002-mibstore.patch}   | 0
 ...-video-ati-0003-DamageUnregister.patch => 0003-DamageUnregister.patch} | 0
 .../{xdriver_xf86-video-geode-0001-include.patch => 0001-include.patch}   | 0
 .../{xdriver_xf86-video-glint-0001-mbstring.patch => 0001-mbstring.patch} | 0
 .../{xdriver_xf86-video-i128-0001-mbstring.patch => 0001-mbstring.patch}  | 0
 .../0001-cross-compile.patch}                                             | 0
 .../{xdriver_xf86-video-mga-1.4.9.patch => 0001-misc-fixes.patch}         | 0
 .../{xdriver_xf86-video-nv-0001-mibstore.patch => 0001-mibstore.patch}    | 0
 .../0001-cross-compile.patch}                                             | 0
 ...86-video-savage-2.2.1-cross-compile.patch => 0001-cross-compile.patch} | 0
 ...86-video-siliconmotion-0001-smi_driver.patch => 0001-smi_driver.patch} | 0
 .../{xdriver_xf86-video-sis-0001-cross.patch => 0001-cross.patch}         | 0
 .../{xdriver_xf86-video-sis-0002-mibstore.patch => 0002-mibstore.patch}   | 0
 ...86-video-sis-0003-xf86UnMapVidMem.patch => 0003-xf86UnMapVidMem.patch} | 0
 .../{xdriver_xf86-video-sis-0004-xf86Priv.patch => 0004-xf86Priv.patch}   | 0
 .../{xdriver_xf86-video-sis-0005-hvdisplay.patch => 0005-hvdisplay.patch} | 0
 ...river_xf86-video-sis-0006-fixwarnings.patch => 0006-fixwarnings.patch} | 0
 .../{xdriver_xf86-video-sis-0007-xi.patch => 0007-xi.patch}               | 0
 .../{xdriver_xf86-video-tdfx-0001-cross.patch => 0001-cross.patch}        | 0
 .../{xdriver_xf86-video-tdfx-0002-mibstore.patch => 0002-mibstore.patch}  | 0
 .../{xdriver_xf86-video-tga-0001-mibstore.patch => 0001-mibstore.patch}   | 0
 ...xdriver_xf86-video-trident-0001-mibstore.patch => 0001-mibstore.patch} | 0
 .../{xdriver_xf86-video-trident-0002-xaa.patch => 0002-xaa.patch}         | 0
 .../{xlib_libXpm-01-fork-check.patch => 0001-fork-check.patch}            | 0
 ...flags.patch => 0001-util-don-t-link-makestrs-with-target-cflags.patch} | 0
 ...a.patch => 0001-os-log-adjust-gcc-version-conditions-for-pragma.patch} | 0
 ...rver_xorg-server-0002-glyphpadbytes.patch => 0002-glyphpadbytes.patch} | 0
 .../{xserver_xorg-server-0003-microblaze.patch => 0003-microblaze.patch}  | 0
 package/x11vnc/{x11vnc-ipv6.patch => 0001-ipv6.patch}                     | 0
 .../{xbmc-0001-Fixup-include-path.patch => 0001-Fixup-include-path.patch} | 0
 package/xbmc/{xbmc-0002-mathutil.patch => 0002-mathutil.patch}            | 0
 package/xbmc/{xbmc-0003-dbus.patch => 0003-dbus.patch}                    | 0
 package/xinetd/{xinetd-001-ar.patch => 0001-ar.patch}                     | 0
 package/xinetd/{xinetd-002-destdir.patch => 0002-destdir.patch}           | 0
 package/xinetd/{xinetd-003-rpc-fix.patch => 0003-rpc-fix.patch}           | 0
 .../{xinetd-004-configure-rlim_t.patch => 0004-configure-rlim_t.patch}    | 0
 package/xl2tp/{xl2tp-legacy.patch => 0001-legacy.patch}                   | 0
 ...e-ansi-c-bailout.patch => 0001-fix-cross-compile-ansi-c-bailout.patch} | 0
 ...x-minixpm-build-problem.patch => 0002-fix-minixpm-build-problem.patch} | 0
 ...-linking-with-lintl.patch => 0003-driver-fix-linking-with-lintl.patch} | 0
 package/xvkbd/{xvkbd-makefile.patch => 0001-makefile.patch}               | 0
 package/yajl/{yajl-0001-math-link.patch => 0001-math-link.patch}          | 0
 ...ch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} | 0
 ...e-cross-compile-mkdata.patch => 0001-CMake-cross-compile-mkdata.patch} | 0
 .../ympd/{ympd-0002-only-c-language.patch => 0002-only-c-language.patch}  | 0
 ....patch => 0001-tests-disable-test_fork-if-fork-is-not-available.patch} | 0
 package/zic/{zic-fix-dependencies.patch => 0001-fix-dependencies.patch}   | 0
 ...compiling-on-Buildroot.patch => 0001-fix-compiling-on-Buildroot.patch} | 0
 ...ch => 0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch} | 0
 package/znc/{znc-01-time.patch => 0001-time.patch}                        | 0
 package/zxing/{zxing-makefile.patch => 0001-makefile.patch}               | 0
 936 files changed, 0 insertions(+), 0 deletions(-)
 rename package/acl/{acl-01-support-static-installation.patch => 0001-support-static-installation.patch} (100%)
 rename package/acpid/{acpid-01-dont-use-isfdtype.patch => 0001-dont-use-isfdtype.patch} (100%)
 rename package/acpid/{acpid-02-add-missing-defines.patch => 0002-add-missing-defines.patch} (100%)
 rename package/aiccu/{aiccu-0001-gnutls-and-uclibc-fixes.patch => 0001-gnutls-and-uclibc-fixes.patch} (100%)
 rename package/aiccu/{aiccu-0002-makefile-reorder-linked-libraries.patch => 0002-makefile-reorder-linked-libraries.patch} (100%)
 rename package/aiccu/{aiccu-0003-clock-suite-functions-fix.patch => 0003-clock-suite-functions-fix.patch} (100%)
 rename package/aircrack-ng/{aircrack-ng-01-CVE-2010-1159.patch => 0001-CVE-2010-1159.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0001-avr32-bad-inline.patch => 0001-avr32-bad-inline.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0002-no-mmu.patch => 0002-no-mmu.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0003-dlmisc.patch => 0003-dlmisc.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch => 0004-conditional-enabling-of-libdl-in-m4.patch} (100%)
 rename package/alsamixergui/{alsamixergui_0.9.0rc2-1-7.patch => 0001-misc-fixes.patch} (100%)
 rename package/am33x-cm3/{am33x-cm3-0001-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/apr-util/{apr-util-01-remove-checkapr.patch => 0001-remove-checkapr.patch} (100%)
 rename package/argp-standalone/{argp-standalone-throw-in-funcdef.patch => 0001-throw-in-funcdef.patch} (100%)
 rename package/at/{at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch => 0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch} (100%)
 rename package/at/{at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch => 0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} (100%)
 rename package/at/{at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch => 0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch} (100%)
 rename package/at/{at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch => 0004-Makefile.in-replace-IROOT-by-DESTDIR.patch} (100%)
 rename package/at/{at-0005-Makefile.in-make-install-fix.patch => 0005-Makefile.in-make-install-fix.patch} (100%)
 rename package/at/{at-0006-getloadavg.c-fix.patch => 0006-getloadavg.c-fix.patch} (100%)
 rename package/at/{at-0007-parsetime.l-include-config-h.patch => 0007-parsetime.l-include-config-h.patch} (100%)
 rename package/attr/{attr-01-support-static-installation.patch => 0001-support-static-installation.patch} (100%)
 rename package/aumix/{aumix-2.8-fix-incorrect-makefile-am.patch => 0001-fix-incorrect-makefile-am.patch} (100%)
 rename package/autoconf/{autoconf-dont-add-dirty-to-version.patch => 0001-dont-add-dirty-to-version.patch} (100%)
 rename package/automake/{automake-0001-noman.patch => 0001-noman.patch} (100%)
 rename package/avahi/{avahi-autoipd-perms.patch => 0001-autoipd-perms.patch} (100%)
 rename package/avahi/{avahi-disable-systemd-support.patch => 0002-disable-systemd-support.patch} (100%)
 rename package/avahi/{avahi-ipv6only.patch => 0003-ipv6only.patch} (100%)
 rename package/avahi/{avahi-optional-ipv6.patch => 0004-optional-ipv6.patch} (100%)
 rename package/bash/{bash-000-mkbuiltins-cross.patch => 0001-mkbuiltins-cross.patch} (100%)
 rename package/bash/{bash-001-patchlevel1-27.patch => 0002-patchlevel1-27.patch} (100%)
 rename package/bash/{bash-002-patchlevel28.patch => 0003-patchlevel28.patch} (100%)
 rename package/bash/{bash-003-patchlevel29.patch => 0004-patchlevel29.patch} (100%)
 rename package/bash/{bash-004-patchlevel30.patch => 0005-patchlevel30.patch} (100%)
 rename package/beecrypt/{beecrypt-0001-cppglue.cxx-cplusplus-only.patch => 0001-cppglue.cxx-cplusplus-only.patch} (100%)
 rename package/beecrypt/{beecrypt-0002-icu-check-cross-compile.patch => 0002-icu-check-cross-compile.patch} (100%)
 rename package/beecrypt/{beecrypt-0003-build-system.patch => 0003-build-system.patch} (100%)
 rename package/beecrypt/{beecrypt-0004-gcc-4.7.patch => 0004-gcc-4.7.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-drop-werror.patch => 0001-drop-werror.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-dynamicloader-linking.patch => 0002-dynamicloader-linking.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-parallel-build.patch => 0003-parallel-build.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-segfault-on-removeFromWaitResource.patch => 0004-segfault-on-removeFromWaitResource.patch} (100%)
 rename package/bind/{bind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/bind/{bind-02-cross.patch => 0002-cross.patch} (100%)
 rename package/bison/{bison-01-no-docs-regen.patch => 0001-no-docs-regen.patch} (100%)
 rename package/blackbox/{blackbox-001-Fix-configure-ac.patch => 0001-Fix-configure-ac.patch} (100%)
 rename package/blackbox/{blackbox-002-gcc43.patch => 0002-gcc43.patch} (100%)
 rename package/blackbox/{blackbox-003-gcc46-textpropertytostring.patch => 0003-gcc46-textpropertytostring.patch} (100%)
 rename package/bluez_utils/{bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch => 0001-enable_cg2900_on_upstream_4.91.patch} (100%)
 rename package/boost/{boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch => 0001-fix-ambiguous-format-call-on-64bit-builds.patch} (100%)
 rename package/bridge-utils/{bridge-utils-000-build-system.patch => 0001-build-system.patch} (100%)
 rename package/bridge-utils/{bridge-utils-001-fix-for-kernel-headers-3.8+.patch => 0002-fix-for-kernel-headers-3.8+.patch} (100%)
 rename package/busybox/{busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch => 0001-networking-libiproute-use-linux-if_packet.h-instead-.patch} (100%)
 rename package/busybox/{busybox-0002-busybox-1.22.1-ash.patch => 0002-busybox-1.22.1-ash.patch} (100%)
 rename package/busybox/{busybox-0003-busybox-1.22.1-date.patch => 0003-busybox-1.22.1-date.patch} (100%)
 rename package/busybox/{busybox-0004-busybox-1.22.1-iplink.patch => 0004-busybox-1.22.1-iplink.patch} (100%)
 rename package/busybox/{busybox-0005-busybox-1.22.1-nc.patch => 0005-busybox-1.22.1-nc.patch} (100%)
 rename package/busybox/{busybox-0006-lzop-add-overflow-check.patch => 0006-lzop-add-overflow-check.patch} (100%)
 rename package/bzip2/{bzip2-build-objects-twice.patch => 0001-build-objects-twice.patch} (100%)
 rename package/bzip2/{bzip2-improve-build-system.patch => 0002-improve-build-system.patch} (100%)
 rename package/c-ares/{c-ares-01-use_check_build_instead_of_check_user.patch => 0001-use_check_build_instead_of_check_user.patch} (100%)
 rename package/cache-calibrator/{cache-calibrator-Fix-conflicting-round-function.patch => 0001-Fix-conflicting-round-function.patch} (100%)
 rename package/cairo/{cairo-001-blackfin-build-fix.patch => 0001-blackfin-build-fix.patch} (100%)
 rename package/cairo/{cairo-002-openvg-build-fix.patch => 0002-openvg-build-fix.patch} (100%)
 rename package/cairo/{cairo-003-fix-nofork-build.patch => 0003-fix-nofork-build.patch} (100%)
 rename package/cairo/{cairo-004-fix-nofork-any2ppm.patch => 0004-fix-nofork-any2ppm.patch} (100%)
 rename package/cairo/{cairo-005-fix-gcc-49-build.patch => 0005-fix-gcc-49-build.patch} (100%)
 rename package/canfestival/{canfestival-0001-install-pkgconfig-module-for-canfestival.patch => 0001-install-pkgconfig-module-for-canfestival.patch} (100%)
 rename package/canfestival/{canfestival-0002-allow-to-set-python-interpreter.patch => 0002-allow-to-set-python-interpreter.patch} (100%)
 rename package/cdrkit/{cdrkit-1.1.11-no-rcmd.patch => 0001-no-rcmd.patch} (100%)
 rename package/cegui06/{cegui06-stddef.h.patch => 0001-stddef.h.patch} (100%)
 rename package/clapack/{clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch => 0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch} (100%)
 rename package/clapack/{clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch => 0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch} (100%)
 rename package/clapack/{clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch => 0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch} (100%)
 rename package/clapack/{clapack-0004-cmake-blas-add-library-and-header-install-rules.patch => 0004-cmake-blas-add-library-and-header-install-rules.patch} (100%)
 rename package/clapack/{clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch => 0005-cmake-lapack-add-library-and-header-install-rules.patch} (100%)
 rename package/classpath/{classpath-01-fix-gmp-include.patch => 0001-fix-gmp-include.patch} (100%)
 rename package/classpath/{classpath-02-add-config-rpath.patch => 0002-add-config-rpath.patch} (100%)
 rename package/cloog/{cloog-0001-add-missing-files.patch => 0001-add-missing-files.patch} (100%)
 rename package/cloop/{cloop-2.634-1-cflags.patch => 0001-cflags.patch} (100%)
 rename package/connman/{connman-000-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch} (100%)
 rename package/coreutils/{coreutils-01-fix-for-dummy-man-usage.patch => 0001-fix-for-dummy-man-usage.patch} (100%)
 rename package/cppdb/{cppdb-0001-mysql-library-suffix.patch => 0001-mysql-library-suffix.patch} (100%)
 rename package/cramfs/{cramfs-01-endian.patch => 0001-endian.patch} (100%)
 rename package/cramfs/{cramfs-02-cygwin_IO.patch => 0002-cygwin_IO.patch} (100%)
 rename package/crda/{crda-0001-Makefile-allow-to-override-python-interpreter.patch => 0001-Makefile-allow-to-override-python-interpreter.patch} (100%)
 rename package/crda/{crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch => 0002-Add-DESTDIR-support-in-install-libreg-rules.patch} (100%)
 rename package/cryptodev-linux/{cryptodev-linux-01-Replace_INIT_COMPLETION_with_reinit_completion.patch => 0001-Replace_INIT_COMPLETION_with_reinit_completion.patch} (100%)
 rename package/cryptsetup/{cryptsetup-0001-link-against-lrt-for-clock_gettime.patch => 0001-link-against-lrt-for-clock_gettime.patch} (100%)
 rename package/cryptsetup/{cryptsetup-0002-mkdir.patch => 0002-mkdir.patch} (100%)
 rename package/cups/{cups-0001-fix-static.patch => 0001-fix-static.patch} (100%)
 rename package/cups/{cups-0002-fix-stack-protector-check.patch => 0002-fix-stack-protector-check.patch} (100%)
 rename package/cups/{cups-0003-mantohtml.patch => 0003-mantohtml.patch} (100%)
 rename package/curlftpfs/{curlftpfs-000-fix-CURLOPT_INFILESIZE.patch => 0001-fix-CURLOPT_INFILESIZE.patch} (100%)
 rename package/curlftpfs/{curlftpfs-001-free_ftpfs_file-memleak-fix.patch => 0002-free_ftpfs_file-memleak-fix.patch} (100%)
 rename package/curlftpfs/{curlftpfs-002-nocache-memleak-fix.patch => 0003-nocache-memleak-fix.patch} (100%)
 rename package/cwiid/{cwiid-0001-fix-link-options-for-as-needed-90.patch => 0001-fix-link-options-for-as-needed-90.patch} (100%)
 rename package/cwiid/{cwiid-0002-Update-for-BlueZ-changes.patch => 0002-Update-for-BlueZ-changes.patch} (100%)
 rename package/cwiid/{cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch => 0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch} (100%)
 rename package/cwiid/{cwiid-0004-configure-make-wmgui-build-optional.patch => 0004-configure-make-wmgui-build-optional.patch} (100%)
 rename package/czmq/{czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch => 0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch} (100%)
 rename package/dash/{dash-0001-no-config.h-for-helpers.patch => 0001-no-config.h-for-helpers.patch} (100%)
 rename package/dbus-cpp/{dbus-cpp-0001-gcc4.7.patch => 0001-gcc4.7.patch} (100%)
 rename package/dbus-cpp/{dbus-cpp-0002-cxxflags-ldflags-for-build.patch => 0002-cxxflags-ldflags-for-build.patch} (100%)
 rename package/dbus-python/{dbus-python-0001-fix-python-configure-check.patch => 0001-fix-python-configure-check.patch} (100%)
 rename package/devmem2/{devmem2-0001-be-coherent-in-type-usage.patch => 0001-be-coherent-in-type-usage.patch} (100%)
 rename package/dhcpdump/{dhcpdump-0001-use-non-bsd-structures.patch => 0001-use-non-bsd-structures.patch} (100%)
 rename package/dhcpdump/{dhcpdump-0002-fix-strsep-feature-test.patch => 0002-fix-strsep-feature-test.patch} (100%)
 rename package/dhrystone/{dhrystone-2-cmdline-nruns.patch => 0001-cmdline-nruns.patch} (100%)
 rename package/dhrystone/{dhrystone-2-HZ.patch => 0002-HZ.patch} (100%)
 rename package/dhrystone/{dhrystone-2-exit.patch => 0003-exit.patch} (100%)
 rename package/dhrystone/{dhrystone-2-headers.patch => 0004-headers.patch} (100%)
 rename package/dhrystone/{dhrystone-2-prototypes.patch => 0005-prototypes.patch} (100%)
 rename package/dillo/{dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch => 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch} (100%)
 rename package/directfb-examples/{directfb-examples-remove-bzero.patch => 0001-remove-bzero.patch} (100%)
 rename package/directfb/{directfb-fix-missing-davinci-voodoo-header.patch => 0001-fix-missing-davinci-voodoo-header.patch} (100%)
 rename package/directfb/{directfb-imlib2-config.patch => 0002-imlib2-config.patch} (100%)
 rename package/directfb/{directfb-remove-redefinition-of-__typeof__.patch => 0003-remove-redefinition-of-__typeof__.patch} (100%)
 rename package/directfb/{directfb-setregion-lock.patch => 0004-setregion-lock.patch} (100%)
 rename package/directfb/{directfb-use-gcc-link.patch => 0005-use-gcc-link.patch} (100%)
 rename package/dmalloc/{dmalloc-5.4.3-add-fpic.patch => 0001-add-fpic.patch} (100%)
 rename package/dmalloc/{dmalloc-mips.patch => 0002-mips.patch} (100%)
 rename package/dmidecode/{dmidecode-build-system-fixes.patch => 0001-build-system-fixes.patch} (100%)
 rename package/dropwatch/{dropwatch-01-build.patch => 0001-build.patch} (100%)
 rename package/dropwatch/{dropwatch-02-binutils-2.23.1.patch => 0002-binutils-2.23.1.patch} (100%)
 rename package/dropwatch/{dropwatch-03-remove-werror.patch => 0003-remove-werror.patch} (100%)
 rename package/dtc/{dtc-extra_cflags.patch => 0001-extra_cflags.patch} (100%)
 rename package/dtc/{dtc-separate-lib-install.patch => 0002-separate-lib-install.patch} (100%)
 rename package/duma/{duma-01-fix-cross-compilation.patch => 0001-fix-cross-compilation.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0001-Fix-generate-keynames.patch => 0001-Fix-generate-keynames.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0002-Fix-compiler-warning-flags.patch => 0002-Fix-compiler-warning-flags.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0003-support-static-only-build.patch => 0003-support-static-only-build.patch} (100%)
 rename package/e2fsprogs/{e2fsprogs-0001-sem-init-libs.patch => 0001-sem-init-libs.patch} (100%)
 rename package/elftosb/{elftosb-fixes-includes.patch => 0001-fixes-includes.patch} (100%)
 rename package/elftosb/{elftosb-force-cxx-compiler.patch => 0002-force-cxx-compiler.patch} (100%)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (100%)
 rename package/elfutils/{elfutils-02-argp-support.patch => 0002-argp-support.patch} (100%)
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (100%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (100%)
 rename package/elfutils/{elfutils-05-disable-po.patch => 0005-disable-po.patch} (100%)
 rename package/empty/{empty-0001-respect-LDFLAGS.patch => 0001-respect-LDFLAGS.patch} (100%)
 rename package/erlang/{erlang-build-fix.patch => 0001-build-fix.patch} (100%)
 rename package/eudev/{eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch => 0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch} (100%)
 rename package/evemu/{evemu-0001-SYN_MAX.patch => 0001-SYN_MAX.patch} (100%)
 rename package/evemu/{evemu-0002-configure.ac-add-disable-tests-option.patch => 0002-configure.ac-add-disable-tests-option.patch} (100%)
 rename package/evemu/{evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch => 0003-make-event-names-use-input.h-from-sysroot-instead-of.patch} (100%)
 rename package/evemu/{evemu-0005-configure.ac-add-disable-python-bindings-option.patch => 0005-configure.ac-add-disable-python-bindings-option.patch} (100%)
 rename package/exim/{exim-0001-Build-buildconfig-for-the-host.patch => 0001-Build-buildconfig-for-the-host.patch} (100%)
 rename package/exim/{exim-0002-Don-t-make-backup-copies-of-installed-files.patch => 0002-Don-t-make-backup-copies-of-installed-files.patch} (100%)
 rename package/exim/{exim-0003-Skip-version-check-and-symlink-installation.patch => 0003-Skip-version-check-and-symlink-installation.patch} (100%)
 rename package/expect/{expect-0001-enable-cross-compilation.patch => 0001-enable-cross-compilation.patch} (100%)
 rename package/expect/{expect-0002-allow-tcl-build-directory.patch => 0002-allow-tcl-build-directory.patch} (100%)
 rename package/ezxml/{ezxml-0.8.6-allow-compiler-override.patch => 0001-allow-compiler-override.patch} (100%)
 rename package/fb-test-app/{fb-test-app-override-cflags.patch => 0001-override-cflags.patch} (100%)
 rename package/fbgrab/{fbgrab-01-fix-static-build.patch => 0001-fix-static-build.patch} (100%)
 rename package/fbv/{fbv-1.0b-arch.patch.avr32 => 0001-arch.patch.avr32} (100%)
 rename package/fbv/{fbv-1.0b-cross.patch => 0002-cross.patch} (100%)
 rename package/fbv/{fbv-1.0b-fix-24bpp-support-on-big-endian.patch => 0003-fix-24bpp-support-on-big-endian.patch} (100%)
 rename package/fbv/{fbv-1.0b-fix-bgr555.patch => 0004-fix-bgr555.patch} (100%)
 rename package/fbv/{fbv-1.0b-include.patch => 0005-include.patch} (100%)
 rename package/fbv/{fbv-1.0b-libpng15.patch => 0006-libpng15.patch} (100%)
 rename package/fetchmail/{fetchmail-0001-fix-openssl-static-link.patch => 0001-fix-openssl-static-link.patch} (100%)
 rename package/ffmpeg/{ffmpeg-0001-fminf.patch => 0001-fminf.patch} (100%)
 rename package/fis/{fis-001-checksum.patch => 0001-checksum.patch} (100%)
 rename package/fis/{fis-003-list_output.patch => 0003-list_output.patch} (100%)
 rename package/fis/{fis-004-sorted_list.patch => 0004-sorted_list.patch} (100%)
 rename package/flac/{flac-01-fix-altivec-logic.patch => 0001-fix-altivec-logic.patch} (100%)
 rename package/flex/{flex-prog-ar.patch => 0001-prog-ar.patch} (100%)
 rename package/flickcurl/{flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch => 0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch} (100%)
 rename package/flickcurl/{flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch => 0002-Oauth-services-are-on-https-www.flickr.com.patch} (100%)
 rename package/flite/{flite-0001-now-honor-DESTDIR-env.-var.patch => 0001-now-honor-DESTDIR-env.-var.patch} (100%)
 rename package/flite/{flite-0002-fix-alsa-static.patch => 0002-fix-alsa-static.patch} (100%)
 rename package/fltk/{fltk-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/fltk/{fltk-02-jpeg-9.patch => 0002-jpeg-9.patch} (100%)
 rename package/freerdp/{freerdp-0001-add-support-for-uclibc.patch => 0001-add-support-for-uclibc.patch} (100%)
 rename package/freescale-imx/gpu-viv-bin-mx6q/{gpu-viv-bin-mx6q-0001-correct-HAL-include.patch => 0001-correct-HAL-include.patch} (100%)
 rename package/freescale-imx/imx-vpu/{imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch => 0001-vpu-io-fix-IOSystemInit-failure.patch} (100%)
 rename package/freescale-imx/imx-vpu/{imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch => 0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch} (100%)
 rename package/ftop/{ftop-0001-overflow.patch => 0001-overflow.patch} (100%)
 rename package/gadgetfs-test/{gadgetfs-test-fix-usb-ch9-include.patch => 0001-fix-usb-ch9-include.patch} (100%)
 rename package/gadgetfs-test/{gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch => 0002-rename-include-usb_gadgetfs-to-usb-dir.patch} (100%)
 rename package/gamin/{gamin-0.1.10-no-abstract-sockets.patch => 0001-no-abstract-sockets.patch} (100%)
 rename package/gamin/{gamin-0.1.10-no-const-return.patch => 0002-no-const-return.patch} (100%)
 rename package/gawk/{gawk-01-no-versioned.patch => 0001-no-versioned.patch} (100%)
 rename package/gcc/4.4.7/{gcc-44-pr39429.patch => 0044-pr39429.patch} (100%)
 rename package/gd/{gd-01-gdlib-config.patch => 0001-gdlib-config.patch} (100%)
 rename package/gd/{gd-02-no-zlib.patch => 0002-no-zlib.patch} (100%)
 rename package/gd/{gd-03-gd_bmp-fix-build-with-uClibc.patch => 0003-gd_bmp-fix-build-with-uClibc.patch} (100%)
 rename package/gd/{gd-04-CVE-2014-2497.patch => 0004-CVE-2014-2497.patch} (100%)
 rename package/genext2fs/{genext2fs-update-genext2fs.c-to-rev-1.118.patch => 0001-update-genext2fs.c-to-rev-1.118.patch} (100%)
 rename package/genpart/{genpart-fix-return-code.patch => 0001-fix-return-code.patch} (100%)
 rename package/genromfs/{genromfs-0.5.2-build-system.patch => 0001-build-system.patch} (100%)
 rename package/gettext/{gettext-01-error_print_progname.patch => 0001-error_print_progname.patch} (100%)
 rename package/giblib/{giblib-fix-imlib2-detection.patch => 0001-fix-imlib2-detection.patch} (100%)
 rename package/glibc/2.18-svnr23787/{glibc-0001-accept-make4.patch => 0001-accept-make4.patch} (100%)
 rename package/gmp/{gmp-01-arm-asm-conditional-on-no-thumb-1.patch => 0001-arm-asm-conditional-on-no-thumb-1.patch} (100%)
 rename package/gmp/{gmp-02-arm-asm-conditional-on-no-thumb-2.patch => 0002-arm-asm-conditional-on-no-thumb-2.patch} (100%)
 rename package/gmp/{gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch => 0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch} (100%)
 rename package/gnu-efi/{gnu-efi-01-use-override-cflags.patch => 0001-use-override-cflags.patch} (100%)
 rename package/gnu-efi/{gnu-efi-02-parallel-make-archives.patch => 0002-parallel-make-archives.patch} (100%)
 rename package/gnu-efi/{gnu-efi-03-parallel-make.patch => 0003-parallel-make.patch} (100%)
 rename package/gnuchess/{gnuchess-5.07-getline-conflicts.patch => 0001-getline-conflicts.patch} (100%)
 rename package/gnuchess/{gnuchess-5.07.patch => 0002-misc-fixes.patch} (100%)
 rename package/gnupg2/{gnupg2-0001-fix-pth-config-usage.patch => 0001-fix-pth-config-usage.patch} (100%)
 rename package/gnuplot/{gnuplot-0001-configure-add-without-demo-option.patch => 0001-configure-add-without-demo-option.patch} (100%)
 rename package/gnuplot/{gnuplot-0002-use-gdlib-config-properly.patch => 0002-use-gdlib-config-properly.patch} (100%)
 rename package/gob2/{gob2-01-dont-include-from-prefix.patch => 0001-dont-include-from-prefix.patch} (100%)
 rename package/gpsd/{gpsd-01-Fix-build-error-when-ntpshm-is-false.patch => 0001-Fix-build-error-when-ntpshm-is-false.patch} (100%)
 rename package/gpsd/{gpsd-02-sconstruct-disable-rpath.patch => 0002-sconstruct-disable-rpath.patch} (100%)
 rename package/gpsd/{gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch => 0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch} (100%)
 rename package/gptfdisk/{gptfdisk-001-configurable-utf16-support.patch => 0001-configurable-utf16-support.patch} (100%)
 rename package/gqview/{gqview-2.1.5-make.patch => 0001-make.patch} (100%)
 rename package/grantlee/{grantlee-0.2.0-fix-lphread-link-error.patch => 0001-fix-lphread-link-error.patch} (100%)
 rename package/gstreamer/gst-ffmpeg/{gst-ffmpeg-0001-gcc47.patch => 0001-gcc47.patch} (100%)
 rename package/gstreamer/gst-ffmpeg/{gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch => 0002-arm-avoid-using-the-movw-instruction.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0001-gplay-add-missing-include.patch => 0001-gplay-add-missing-include.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch => 0002-Fix-bashism-in-configure-script.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0003-Use-proper-objdump.patch => 0003-Use-proper-objdump.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch => 0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch => 0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch} (100%)
 rename package/gstreamer/gst-plugin-x170/{gst-plugin-x170-01-correct-CFLAGS.patch => 0001-correct-CFLAGS.patch} (100%)
 rename package/gstreamer/gst-plugins-bad/{gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch => 0001-opus-jpegformat-unbreak-non-debug-build.patch} (100%)
 rename package/gstreamer/gst-plugins-bad/{gst-plugins-bad-0002-fix-dfb-example.patch => 0002-fix-dfb-example.patch} (100%)
 rename package/gstreamer/gst-plugins-base/{gst-plugins-base-tremor.patch => 0001-tremor.patch} (100%)
 rename package/gstreamer/gst-plugins-good/{gst-plugins-good-linux36.patch => 0001-linux36.patch} (100%)
 rename package/gstreamer/gst-plugins-good/{gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch => 0002-v4l2-fix-compilation-against-newer-kernel-headers.patch} (100%)
 rename package/gstreamer/gstreamer/{gstreamer-01-bison3.patch => 0001-bison3.patch} (100%)
 rename package/gstreamer1/gst1-plugins-bad/{gst1-plugins-bad-use-gettext-0.18.patch => 0001-use-gettext-0.18.patch} (100%)
 rename package/gutenprint/{gutenprint-000-use-pregen-xmli18n-header.patch => 0001-use-pregen-xmli18n-header.patch} (100%)
 rename package/gutenprint/{gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch => 0002-cups-support-replaces-static-with-static-libtool-lib.patch} (100%)
 rename package/haserl/0.8.0/{haserl-0.8.0-legacy.patch => 0001-legacy.patch} (100%)
 rename package/haserl/0.9.33/{haserl-001-add-haserl_lualib.inc.patch => 0001-add-haserl_lualib.inc.patch} (100%)
 rename package/heimdal/{heimdal-0001-add-roken-h-process.patch => 0001-add-roken-h-process.patch} (100%)
 rename package/heimdal/{heimdal-0002-use-Getopt-Std.patch => 0002-use-Getopt-Std.patch} (100%)
 rename package/heimdal/{heimdal-0003-vendor.patch => 0003-vendor.patch} (100%)
 rename package/heimdal/{heimdal-0004-compile_et.patch => 0004-compile_et.patch} (100%)
 rename package/hplip/{hplip-fix-make.patch => 0001-fix-make.patch} (100%)
 rename package/htop/{htop-01-native-affinity.patch => 0001-native-affinity.patch} (100%)
 rename package/httping/{httping-0001-fix-math-library-linking.patch => 0001-fix-math-library-linking.patch} (100%)
 rename package/icu/{icu-001-dont-build-static-dynamic-twice.patch => 0001-dont-build-static-dynamic-twice.patch} (100%)
 rename package/icu/{icu-002-workaround-toolchain-bugs.patch => 0002-workaround-toolchain-bugs.patch} (100%)
 rename package/icu/{icu-003-detect-compiler-symbol-prefix.patch => 0003-detect-compiler-symbol-prefix.patch} (100%)
 rename package/icu/{icu-004-link-icudata-as-data-only.patch => 0004-link-icudata-as-data-only.patch} (100%)
 rename package/ifplugd/{ifplugd-cross.patch => 0001-cross.patch} (100%)
 rename package/ifplugd/{ifplugd-fix-headers.patch => 0002-fix-headers.patch} (100%)
 rename package/ifplugd/{ifplugd-no-cxx.patch => 0003-no-cxx.patch} (100%)
 rename package/igmpproxy/{igmpproxy-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/imagemagick/{imagemagick-01-use-xml2-config.patch => 0001-use-xml2-config.patch} (100%)
 rename package/infozip/{infozip-0001-configure-fix-cross-build.patch => 0001-configure-fix-cross-build.patch} (100%)
 rename package/input-tools/{input-tools-20051019-rint.patch => 0001-rint.patch} (100%)
 rename package/iostat/{iostat-cpunum.patch => 0001-cpunum.patch} (100%)
 rename package/iozone/{iozone-01-targets.patch => 0001-targets.patch} (100%)
 rename package/iozone/{iozone-02-no-nptl-support.patch => 0002-no-nptl-support.patch} (100%)
 rename package/iproute2/{iproute2-01-optional-ipv6.patch => 0001-optional-ipv6.patch} (100%)
 rename package/iproute2/{iproute2-02-vxlan-optional-ipv6.patch => 0002-vxlan-optional-ipv6.patch} (100%)
 rename package/iprutils/{iprutils-0001-Don-t-use-gettext.patch => 0001-Don-t-use-gettext.patch} (100%)
 rename package/iprutils/{iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch => 0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch} (100%)
 rename package/iprutils/{iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch => 0003-Fix-static-build-by-passing-the-libraries-i.patch} (100%)
 rename package/ipsec-tools/{ipsec-tools-001-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/iptables/{iptables-01-fix-static-link.patch => 0001-fix-static-link.patch} (100%)
 rename package/iptables/{iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch => 0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-daemon.patch => 0001-daemon.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-nommu.patch => 0002-nommu.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-subdir.patch => 0003-subdir.patch} (100%)
 rename package/jhead/{jhead-use-ldflags.patch => 0001-use-ldflags.patch} (100%)
 rename package/joe/{joe-0001-disable-bessel-functions-on-uclibc.patch => 0001-disable-bessel-functions-on-uclibc.patch} (100%)
 rename package/jq/{jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch => 0001-libm.h-comment-j0-j1-y0-and-y1.patch} (100%)
 rename package/json-c/{json-c-no-reentrant.patch => 0001-no-reentrant.patch} (100%)
 rename package/kbd/{kbd-link-against-libintl.patch => 0001-link-against-libintl.patch} (100%)
 rename package/kexec-lite/{kexec-lite-01-clean-restart.patch => 0001-clean-restart.patch} (100%)
 rename package/kexec/{kexec-0001-largefile.patch => 0001-largefile.patch} (100%)
 rename package/keyutils/{keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch => 0001-allow-building-of-the-shared-library-to-be-suppressed.patch} (100%)
 rename package/keyutils/{keyutils-02-fix-install-rule.patch => 0002-fix-install-rule.patch} (100%)
 rename package/keyutils/{keyutils-03-cifs.patch => 0003-cifs.patch} (100%)
 rename package/keyutils/{keyutils-04-Makefile-for-buildroot.patch => 0004-Makefile-for-buildroot.patch} (100%)
 rename package/kismet/{kismet-ncurses.patch => 0001-ncurses.patch} (100%)
 rename package/kismet/{kismet-nobsd.patch => 0002-nobsd.patch} (100%)
 rename package/kmod/{kmod-0001-fix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch} (100%)
 rename package/kmod/{kmod-0002-add-backup-implementation-of-be32toh.patch => 0002-add-backup-implementation-of-be32toh.patch} (100%)
 rename package/kobs-ng/{kobs-ng-0001-fix-mtd-defines.patch => 0001-fix-mtd-defines.patch} (100%)
 rename package/latencytop/{latencytop-makefile.patch => 0001-makefile.patch} (100%)
 rename package/lcdapi/{lcdapi-0001-Remove-installation-of-docs-examples.patch => 0001-Remove-installation-of-docs-examples.patch} (100%)
 rename package/lcdproc/{lcdproc-LCDd.conf.patch => 0001-LCDd.conf.patch} (100%)
 rename package/leafnode2/{leafnode2-0001-cross_makefile.patch => 0001-cross_makefile.patch} (100%)
 rename package/libaio/{libaio-0.3.109-arches.patch => 0001-arches.patch} (100%)
 rename package/libaio/{libaio-0.3.109-avr32-support.patch => 0002-avr32-support.patch} (100%)
 rename package/libaio/{libaio-0.3.109-destdir.patch => 0003-destdir.patch} (100%)
 rename package/libart/{libart-art-config-cross.patch => 0001-art-config-cross.patch} (100%)
 rename package/libatasmart/{libatasmart-strpool-cross-flags.patch => 0001-strpool-cross-flags.patch} (100%)
 rename package/libcap/{libcap-01-build-system.patch => 0001-build-system.patch} (100%)
 rename package/libcap/{libcap-02-split-static-shared-install.patch => 0002-split-static-shared-install.patch} (100%)
 rename package/libcec/{libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch => 0001-Fix-unregistering-a-callback-that-wasn-t-register.patch} (100%)
 rename package/libcec/{libcec-0002-no-psabi-warning.patch => 0002-no-psabi-warning.patch} (100%)
 rename package/libcgi/{libcgi.patch => 0001-misc-fixes.patch} (100%)
 rename package/libcgicc/{libcgicc-01-disable-documentation-option.patch => 0001-disable-documentation-option.patch} (100%)
 rename package/libconfuse/{libconfuse-0000-fix-configure-ac.patch => 0001-fix-configure-ac.patch} (100%)
 rename package/libcue/{libcue-1.4.0-__unused-fix.patch => 0001-_unused-fix.patch} (100%)
 rename package/libcuefile/{libcuefile-0001-fix-static-link.patch => 0001-fix-static-link.patch} (100%)
 rename package/libcurl/{libcurl-0001-fixtimeout.patch => 0001-fixtimeout.patch} (100%)
 rename package/libdaemon/{libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch => 0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch} (100%)
 rename package/libdnet/{libdnet-001-python-gcc.patch => 0001-python-gcc.patch} (100%)
 rename package/libdnet/{libdnet-002-python-makefile.patch => 0002-python-makefile.patch} (100%)
 rename package/libdvdnav/{libdvdnav-01-fix-os2-support.patch => 0001-fix-os2-support.patch} (100%)
 rename package/libdvdread/{libdvdread-01-fix-os2-support.patch => 0001-fix-os2-support.patch} (100%)
 rename package/libeXosip2/{libeXosip2-0000-fix-non-ipv6-build.patch => 0001-fix-non-ipv6-build.patch} (100%)
 rename package/libeXosip2/{libeXosip2-0001-use-pkg-config-to-detect-openssl.patch => 0002-use-pkg-config-to-detect-openssl.patch} (100%)
 rename package/libedit/{libedit-000-check-bsd-functions-in-libbsd.patch => 0001-check-bsd-functions-in-libbsd.patch} (100%)
 rename package/libenca/{libenca-001-fix-installation-error.patch => 0001-fix-installation-error.patch} (100%)
 rename package/libenca/{libenca-002-remove-prefix-hack-in-configure.patch => 0002-remove-prefix-hack-in-configure.patch} (100%)
 rename package/libenca/{libenca-003-iconv.patch => 0003-iconv.patch} (100%)
 rename package/libfcgi/{libfcgi-0000-eof.patch => 0001-eof.patch} (100%)
 rename package/libfcgi/{libfcgi-0001-link-against-libfcgi-la.patch => 0002-link-against-libfcgi-la.patch} (100%)
 rename package/libfcgi/{libfcgi-0002-link-against-math.patch => 0003-link-against-math.patch} (100%)
 rename package/libfcgi/{libfcgi-0003-make-autoreconfable.patch => 0004-make-autoreconfable.patch} (100%)
 rename package/libfcgi/{libfcgi-0004-disable-examples.patch => 0005-disable-examples.patch} (100%)
 rename package/libffi/{libffi-001-Fix-installation-location-of-libffi.patch => 0001-Fix-installation-location-of-libffi.patch} (100%)
 rename package/libffi/{libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch => 0002-Fix-use-of-compact-eh-frames-on-MIPS.patch} (100%)
 rename package/libffi/{libffi-003-fix-typo.patch => 0003-fix-typo.patch} (100%)
 rename package/libffi/{libffi-004-Add-missing-GNU-stack-markings-in-win32.S.patch => 0004-Add-missing-GNU-stack-markings-in-win32.S.patch} (100%)
 rename package/libffi/{libffi-005-Fix-paths-in-libffi.pc.in.patch => 0005-Fix-paths-in-libffi.pc.in.patch} (100%)
 rename package/libfslvpuwrap/{libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch => 0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch} (100%)
 rename package/libftdi/{libftdi-0.19-01_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch} (100%)
 rename package/libfuse/{libfuse-fix-aarch64-build.patch => 0001-fix-aarch64-build.patch} (100%)
 rename package/libgail/{libgail-1.22.3-Relax-X11-dependencies.patch => 0001-Relax-X11-dependencies.patch} (100%)
 rename package/libgc/{libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch => 0001-Fix-build-on-Linux-x86_64-under-uClibc.patch} (100%)
 rename package/libgcrypt/{libgcrypt-00-ac_cv_sys_symbol_underscore.patch => 0001-ac_cv_sys_symbol_underscore.patch} (100%)
 rename package/libgcrypt/{libgcrypt-01-reconfigure.patch => 0002-reconfigure.patch} (100%)
 rename package/libgeotiff/{libgeotiff-0001-use-pkg-config.patch => 0001-use-pkg-config.patch} (100%)
 rename package/libglib2/{libglib2-0001-optional-ipv6.patch => 0001-optional-ipv6.patch} (100%)
 rename package/{pango/pango-0002-no-gtk-doc.patch => libglib2/0002-no-gtk-doc.patch} (100%)
 rename package/libglib2/{libglib2-0003-implement-GMutex-natively-on-Linux.patch => 0003-implement-GMutex-natively-on-Linux.patch} (100%)
 rename package/libgtk2/{libgtk2-reduce-dependencies.patch => 0001-reduce-dependencies.patch} (100%)
 rename package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} (100%)
 rename package/libgtk3/{libgtk3-0002-fix-introspection-check.patch => 0002-fix-introspection-check.patch} (100%)
 rename package/libgtk3/{libgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} (100%)
 rename package/libhid/{libhid-0001-dont-fiddle-with-debug-flags.patch => 0001-dont-fiddle-with-debug-flags.patch} (100%)
 rename package/libhid/{libhid-0002-no-newline-in-ldflags.patch => 0002-no-newline-in-ldflags.patch} (100%)
 rename package/libhid/{libhid-0003-uclinux.patch => 0003-uclinux.patch} (100%)
 rename package/libinput/{libinput-01-rename-log_msg-to-libinput_log_msg.patch => 0001-rename-log_msg-to-libinput_log_msg.patch} (100%)
 rename package/libiqrf/{libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch => 0001-cmake-handle-static-library-and-find-required-thread.patch} (100%)
 rename package/libiqrf/{libiqrf-use-only-c-language.patch => 0002-use-only-c-language.patch} (100%)
 rename package/libiscsi/{libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch => 0001-Fix-warnings-related-to-subdir-objects.patch} (100%)
 rename package/libiscsi/{libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch => 0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch} (100%)
 rename package/libiscsi/{libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch => 0003-Fix-CUnit-test-for-cross-compilation.patch} (100%)
 rename package/libiscsi/{libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch => 0004-examples-fix-uint64_t-formatting-issues.patch} (100%)
 rename package/libiscsi/{libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch => 0005-ld_iscsi-fix-largefile-related-issues.patch} (100%)
 rename package/libjson/{libjson-0001-fix-broken-makefile.patch => 0001-fix-broken-makefile.patch} (100%)
 rename package/liblockfile/{liblockfile-install.patch => 0001-install.patch} (100%)
 rename package/liblogging/{liblogging-01-stdarg.patch => 0001-stdarg.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-mips-h-constraint-removal.patch => 0001-mips-h-constraint-removal.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-optimization.patch.avr32 => 0002-optimization.patch.avr32} (100%)
 rename package/libmad/{libmad-0.15.1b-remove-deprecated-cflags.patch => 0003-remove-deprecated-cflags.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-thumb2-fixed-arm.patch => 0004-thumb2-fixed-arm.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-thumb2-imdct-arm.patch => 0005-thumb2-imdct-arm.patch} (100%)
 rename package/libmcrypt/{libmcrypt-nocxx.patch => 0001-nocxx.patch} (100%)
 rename package/libmemcached/{libmemcached-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/libmnl/{libmnl-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libmpdclient/{libmpdclient-0001-musl-fixes.patch => 0001-musl-fixes.patch} (100%)
 rename package/libmpeg2/{libmpeg2-0.5.1-altivec.patch => 0001-altivec.patch} (100%)
 rename package/libmpeg2/{libmpeg2-0.5.1-armv4l.patch => 0002-armv4l.patch} (100%)
 rename package/libnetfilter_acct/{libnetfilter_acct-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_conntrack/{libnetfilter_conntrack-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_cthelper/{libnetfilter_cthelper-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_cttimeout/{libnetfilter_cttimeout-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_log/{libnetfilter_log-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_queue/{libnetfilter_queue-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnfc/{libnfc-build-systems-make-example-build-optional.patch => 0001-build-systems-make-example-build-optional.patch} (100%)
 rename package/libnfnetlink/{libnfnetlink-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnftnl/{libnftnl-0001-rename-xfree.patch => 0001-rename-xfree.patch} (100%)
 rename package/libnl/{libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch => 0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch} (100%)
 rename package/libnspr/{libnspr-0001-nios2.patch => 0001-nios2.patch} (100%)
 rename package/libnspr/{libnspr-0002-microblaze.patch => 0002-microblaze.patch} (100%)
 rename package/libnss/{libnss-0001-cross-compile.patch => 0001-cross-compile.patch} (100%)
 rename package/libnss/{libnss-0002-uclibc.patch => 0002-uclibc.patch} (100%)
 rename package/libpcap/{libpcap-0001-remove-libnl-include-path.patch => 0001-remove-libnl-include-path.patch} (100%)
 rename package/libpcap/{libpcap-0002-configure.in-uclinux-is-also-linux.patch => 0002-configure.in-uclinux-is-also-linux.patch} (100%)
 rename package/libplayer/{libplayer-add-fpic.patch => 0001-add-fpic.patch} (100%)
 rename package/libplayer/{libplayer-fix-configure-cflags.patch => 0002-fix-configure-cflags.patch} (100%)
 rename package/libpng/{libpng-01-disable-tools.patch => 0001-disable-tools.patch} (100%)
 rename package/libpng/{libpng-02-ignore-symbol-prefix.patch => 0002-ignore-symbol-prefix.patch} (100%)
 rename package/libpthsem/{libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch => 0001-fix-build-on-linux-3.x-host.patch} (100%)
 rename package/librtlsdr/{librtlsdr_001_disable_shared_library_target_in_build.patch => 0001-disable_shared_library_target_in_build.patch} (100%)
 rename package/libseccomp/{libseccomp-0001-use-system-headers-from-sysroot.patch => 0001-use-system-headers-from-sysroot.patch} (100%)
 rename package/libseccomp/{libseccomp-0002-Remove-the-dependency-on-proc.patch => 0002-Remove-the-dependency-on-proc.patch} (100%)
 rename package/libsepol/{libsepol-01-support-static-only.patch => 0001-support-static-only.patch} (100%)
 rename package/libserial/{libserial-0001-disable-python-bindings.patch => 0001-disable-python-bindings.patch} (100%)
 rename package/libserial/{libserial-0002-add-missing-header-include.patch => 0002-add-missing-header-include.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0001-fix-avr32-build.patch => 0001-fix-avr32-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0002-fix-aarch64-build.patch => 0002-fix-aarch64-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0003-fix-microblaze-build.patch => 0003-fix-microblaze-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0004-fix-bfin-build.patch => 0004-fix-bfin-build.patch} (100%)
 rename package/libsndfile/{libsndfile-srconly.patch => 0001-srconly.patch} (100%)
 rename package/libsoup/{libsoup-01-python3-fix.patch => 0001-python3-fix.patch} (100%)
 rename package/libstrophe/{libstrophe-01-make-autoreconfable.patch => 0001-make-autoreconfable.patch} (100%)
 rename package/libstrophe/{libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch => 0002-configure.ac-fix-misdetection-of-libxml2.patch} (100%)
 rename package/libsvg/{libsvg-fix-expat-static-declaration.patch => 0001-fix-expat-static-declaration.patch} (100%)
 rename package/libsvgtiny/{libsvgtiny-01-disable-debug-printfs.patch => 0001-disable-debug-printfs.patch} (100%)
 rename package/libsvgtiny/{libsvgtiny-02-create-builddir.patch => 0002-create-builddir.patch} (100%)
 rename package/libtirpc/{libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} (100%)
 rename package/libtirpc/{libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} (100%)
 rename package/libtirpc/{libtirpc-0004-Make-IPv6-support-optional.patch => 0004-Make-IPv6-support-optional.patch} (100%)
 rename package/libtirpc/{libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch => 0008-Add-rpcgen-program-from-nfs-utils-sources.patch} (100%)
 rename package/libtirpc/{libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0009-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
 rename package/libtirpc/{libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)
 rename package/libtool/{libtool-01-mips64-n64-linking.patch => 0001-mips64-n64-linking.patch} (100%)
 rename package/libtorrent/{libtorrent-cross_compile.patch => 0001-cross_compile.patch} (100%)
 rename package/libubox/{libubox-01-drop-legacy-json-c.patch => 0001-drop-legacy-json-c.patch} (100%)
 rename package/libunwind/{libunwind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/libunwind/{libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (100%)
 rename package/liburcu/{liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch => 0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch} (100%)
 rename package/libv4l/{libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch => 0001-fixup-lfs-mismatch-in-preload-libraries.patch} (100%)
 rename package/libva-intel-driver/{libva-intel-driver-0001-wayland.patch => 0001-wayland.patch} (100%)
 rename package/libva/{libva-0001-no_test_decode.patch => 0001-no_test_decode.patch} (100%)
 rename package/libva/{libva-0002-wayland.patch => 0002-wayland.patch} (100%)
 rename package/libvncserver/{libvncserver-0001-CVE-2014-6051-6052.patch => 0001-CVE-2014-6051-6052.patch} (100%)
 rename package/libvncserver/{libvncserver-0002-CVE-2014-6053.patch => 0002-CVE-2014-6053.patch} (100%)
 rename package/libvncserver/{libvncserver-0003-CVE-2014-6054.patch => 0003-CVE-2014-6054.patch} (100%)
 rename package/libvncserver/{libvncserver-0004-CVE-2014-6055.patch => 0004-CVE-2014-6055.patch} (100%)
 rename package/libwebsockets/{libwebsockets-0001-cmake-set-the-project-language.patch => 0001-cmake-set-the-project-language.patch} (100%)
 rename package/libwebsockets/{libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0002-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0004-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} (100%)
 rename package/lighttpd/{lighttpd-01-Fix-default-config-file.patch => 0001-Fix-default-config-file.patch} (100%)
 rename package/links/{links-0001-no-largefile.patch => 0001-no-largefile.patch} (100%)
 rename package/links/{links-0002-CVE-2013-6050.patch => 0002-CVE-2013-6050.patch} (100%)
 rename package/linux-headers/3.0.101/{linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch => 0001-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)
 rename package/linux-pam/{linux-pam-01-configure.patch => 0001-configure.patch} (100%)
 rename package/linux-pam/{linux-pam-02-doc-makefile-am.patch => 0002-doc-makefile-am.patch} (100%)
 rename package/linux-pam/{linux-pam-03-group.patch => 0003-group.patch} (100%)
 rename package/linux-pam/{linux-pam-04-mkdir.patch => 0004-mkdir.patch} (100%)
 rename package/linux-pam/{linux-pam-05-succeed.patch => 0005-succeed.patch} (100%)
 rename package/linux-pam/{linux-pam-06-time.patch => 0006-time.patch} (100%)
 rename package/linux-pam/{linux-pam-07-rhosts.patch => 0007-rhosts.patch} (100%)
 rename package/linux-zigbee/{linux-zigbee-0001-test-serial-Remove-test-serial.patch => 0001-test-serial-Remove-test-serial.patch} (100%)
 rename package/lite/{lite-dfbspy-stat.patch => 0001-dfbspy-stat.patch} (100%)
 rename package/lite/{lite-no-tests.patch => 0002-no-tests.patch} (100%)
 rename package/lite/{lite-pkg-config.patch => 0003-pkg-config.patch} (100%)
 rename package/lm-sensors/{lm-sensors-0001-static-build.patch => 0001-static-build.patch} (100%)
 rename package/lm-sensors/{lm-sensors-0002-no-host-ldconfig.patch => 0002-no-host-ldconfig.patch} (100%)
 rename package/lockfile-progs/{lockfile-progs-01-sus3v-legacy.patch => 0001-sus3v-legacy.patch} (100%)
 rename package/log4cxx/{log4cxx-0001-charset-fixes.patch => 0001-charset-fixes.patch} (100%)
 rename package/log4cxx/{log4cxx-0002-missing-includes.patch => 0002-missing-includes.patch} (100%)
 rename package/log4cxx/{log4cxx-0003-missing-includes.patch => 0003-missing-includes.patch} (100%)
 rename package/lshw/{lshw-add-LIBS.patch => 0001-add-LIBS.patch} (100%)
 rename package/lsof/{lsof-0001-makefile.patch => 0001-makefile.patch} (100%)
 rename package/lsof/{lsof-0002-noportmap.patch => 0002-noportmap.patch} (100%)
 rename package/lsof/{lsof-0003-override-cflags.patch => 0003-override-cflags.patch} (100%)
 rename package/lsof/{lsof-0004-remove-susvlegacy-funcs.patch => 0004-remove-susvlegacy-funcs.patch} (100%)
 rename package/ltp-testsuite/{ltp-testsuite-fix-build-on-uClibc-exp10.patch => 0001-fix-build-on-uClibc-exp10.patch} (100%)
 rename package/ltrace/{ltrace-01-events.patch => 0001-events.patch} (100%)
 rename package/ltrace/{ltrace-02-arm-plt.patch => 0002-arm-plt.patch} (100%)
 rename package/ltrace/{ltrace-03-PPC-fix-PPC32-build.patch => 0003-PPC-fix-PPC32-build.patch} (100%)
 rename package/lttng-babeltrace/{lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch => 0001-no-posix-fallocate-in-uclibc.patch} (100%)
 rename package/lua/5.1.5/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.1.5/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.1.5/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)
 rename package/lua/5.1.5/{lua-12-fix-reader-at-eoz.patch => 0012-fix-reader-at-eoz.patch} (100%)
 rename package/lua/5.2.3/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.2.3/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.2.3/{lua-04-lua-pc.patch => 0004-lua-pc.patch} (100%)
 rename package/lua/5.2.3/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)
 rename package/luafilesystem/{luafilesystem-without_large_file.patch => 0001-without_large_file.patch} (100%)
 rename package/luajit/{luajit-04-no-bin-symlink.patch => 0004-no-bin-symlink.patch} (100%)
 rename package/luajit/{luajit-05-install-inc.patch => 0005-install-inc.patch} (100%)
 rename package/luajit/{luajit-06-install-so.patch => 0006-install-so.patch} (100%)
 rename package/luasocket/{luasocket-01-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} (100%)
 rename package/lxc/{lxc-01-drop-werror.patch => 0001-drop-werror.patch} (100%)
 rename package/madplay/{madplay-0.15.2b-switch-to-new-alsa-api.patch => 0001-switch-to-new-alsa-api.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0001-index-is-legacy.patch => 0001-index-is-legacy.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0002-libpng15.patch => 0002-libpng15.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0003-include-setjmp-h.patch => 0003-include-setjmp-h.patch} (100%)
 rename package/matchbox/matchbox-panel/{matchbox-panel-0.9.3-index-is-legacy.patch => 0001-index-is-legacy.patch} (100%)
 rename package/matchbox/matchbox-startup-monitor/{matchbox-startup-monitor-0.1-true-false.patch => 0001-true-false.patch} (100%)
 rename package/matchbox/matchbox-wm/{matchbox-wm-defaulttheme.patch => 0001-defaulttheme.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4409.patch => 0001-CVE-2012-4409.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4426.patch => 0002-CVE-2012-4426.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4527.patch => 0003-CVE-2012-4527.patch} (100%)
 rename package/mcrypt/{mcrypt-no-rpath.patch => 0004-no-rpath.patch} (100%)
 rename package/mdadm/{mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch => 0010-add-install-targets-for-mdadm-and-mdmon.patch} (100%)
 rename package/mdadm/{mdadm-020-uclibc-dont-force-largefile.patch => 0020-uclibc-dont-force-largefile.patch} (100%)
 rename package/mdadm/{mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch => 0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch} (100%)
 rename package/media-ctl/{media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch => 0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch} (100%)
 rename package/mediastreamer/{mediastreamer-0001.patch => 0001-misc-fixes.patch} (100%)
 rename package/memstat/{memstat-0001-PATH_MAX.patch => 0001-PATH_MAX.patch} (100%)
 rename package/memtester/{memtester-makefile-fix.patch => 0001-makefile-fix.patch} (100%)
 rename package/mesa3d/{mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch => 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch} (100%)
 rename package/mesa3d/{mesa3d-0002-execinfo_h.patch => 0002-execinfo_h.patch} (100%)
 rename package/metacity/{metacity-add-libm-reference.patch => 0001-add-libm-reference.patch} (100%)
 rename package/metacity/{metacity-gconf.patch => 0002-gconf.patch} (100%)
 rename package/metacity/{metacity-mag-add-libm-reference.patch => 0003-mag-add-libm-reference.patch} (100%)
 rename package/mii-diag/{mii-diag-strchr.patch => 0001-strchr.patch} (100%)
 rename package/mmc-utils/{mmc-utils-001-fix-mmc-h-includes.patch => 0001-fix-mmc-h-includes.patch} (100%)
 rename package/mongoose/{mongoose-0001-largefile-conditional-define.patch => 0001-largefile-conditional-define.patch} (100%)
 rename package/mongrel2/{mongrel2-0001-use-CC-variable-to-compile-procer.patch => 0001-use-CC-variable-to-compile-procer.patch} (100%)
 rename package/mongrel2/{mongrel2-0002-Do-not-run-tests.patch => 0002-Do-not-run-tests.patch} (100%)
 rename package/mongrel2/{mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch => 0003-Fix-Makefiles-for-cross-compilation.patch} (100%)
 rename package/monit/{monit-0001-no-force-static.patch => 0001-no-force-static.patch} (100%)
 rename package/mono/{mono-001-gc-fix-uclibc.patch => 0001-gc-fix-uclibc.patch} (100%)
 rename package/mono/{mono-002-support-uclibc-musl.patch => 0002-support-uclibc-musl.patch} (100%)
 rename package/mplayer/{mplayer-0001-disable-install-strip.patch => 0001-disable-install-strip.patch} (100%)
 rename package/mplayer/{mplayer-0002-fix-cc-parsing.patch => 0002-fix-cc-parsing.patch} (100%)
 rename package/mplayer/{mplayer-0003-mpdemux-live555-async-interface.patch => 0003-mpdemux-live555-async-interface.patch} (100%)
 rename package/mplayer/{mplayer-0004-add-arc-support.patch => 0004-add-arc-support.patch} (100%)
 rename package/mrouted/{mrouted-bcopy.patch => 0001-bcopy.patch} (100%)
 rename package/mtd/{mtd-01-Fix-rpmatch-call-under-uClibc.patch => 0001-Fix-rpmatch-call-under-uClibc.patch} (100%)
 rename package/musepack/{musepack-0001-shared.patch => 0001-shared.patch} (100%)
 rename package/musepack/{musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/mutt/{mutt-01-nodoc.patch => 0001-nodoc.patch} (100%)
 rename package/mxml/{mxml-fix-cross-target-installation.patch => 0001-fix-cross-target-installation.patch} (100%)
 rename package/mysql/{mysql-0000-ac_cache_check.patch => 0001-ac_cache_check.patch} (100%)
 rename package/mysql/{mysql-0001-configure-ps-cache-check.patch => 0002-configure-ps-cache-check.patch} (100%)
 rename package/mysql/{mysql-0002-use-new-readline-iface.patch => 0003-use-new-readline-iface.patch} (100%)
 rename package/mysql/{mysql-0003-ac_stack_direction-is-unset.patch => 0004-ac_stack_direction-is-unset.patch} (100%)
 rename package/mysql/{mysql-0004-Fix-gen_lex_hash-execution.patch => 0005-Fix-gen_lex_hash-execution.patch} (100%)
 rename package/mysql/{mysql-0005-bison_3_breaks_mysql_server_build.patch => 0006-bison_3_breaks_mysql_server_build.patch} (100%)
 rename package/ncurses/{ncurses-01-fixup-pkg-config-handling.patch => 0001-fixup-pkg-config-handling.patch} (100%)
 rename package/ndisc6/{ndisc6-trace-tcp-upd-uClibc-fix.patch => 0001-trace-tcp-upd-uClibc-fix.patch} (100%)
 rename package/ne10/{ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch => 0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch} (100%)
 rename package/netatalk/{netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch => 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} (100%)
 rename package/netcat/{netcat-0.7.1-signed-bit-counting.patch => 0001-signed-bit-counting.patch} (100%)
 rename package/netplug/{netplug-1.2.9.2-makefile-flags.patch => 0001-makefile-flags.patch} (100%)
 rename package/netsnmp/{netsnmp-001-CVE-2014-2285.patch => 0001-CVE-2014-2285.patch} (100%)
 rename package/network-manager/{network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch => 0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch} (100%)
 rename package/newt/{newt-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/nfacct/{nfacct-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0002-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} (100%)
 rename package/nginx/{nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch => 0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch} (100%)
 rename package/nginx/{nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch => 0002-auto-feature-add-mechanism-allowing-to-force-feature.patch} (100%)
 rename package/nginx/{nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch => 0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch} (100%)
 rename package/nginx/{nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch => 0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch} (100%)
 rename package/nginx/{nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch => 0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch} (100%)
 rename package/ngrep/{ngrep-0001-make-objs.patch => 0001-make-objs.patch} (100%)
 rename package/ngrep/{ngrep-0002-pcre-header.patch => 0002-pcre-header.patch} (100%)
 rename package/ngrep/{ngrep-0003-fix-static-link.patch => 0003-fix-static-link.patch} (100%)
 rename package/nodejs/{nodejs-0001-remove-python-bz2-dependency.patch => 0001-remove-python-bz2-dependency.patch} (100%)
 rename package/nodejs/{nodejs-0002-gyp-force-link-command-to-use-CXX.patch => 0002-gyp-force-link-command-to-use-CXX.patch} (100%)
 rename package/nodejs/{nodejs-0003-use-python-variable.patch => 0003-use-python-variable.patch} (100%)
 rename package/ntp/{ntp-001-adjtimex.patch => 0001-adjtimex.patch} (100%)
 rename package/ntp/{ntp-002-nano.patch => 0002-nano.patch} (100%)
 rename package/nut/{nut-0001-foo-config.patch => 0001-foo-config.patch} (100%)
 rename package/nut/{nut-0002-parallel-build.patch => 0002-parallel-build.patch} (100%)
 rename package/nuttcp/{nuttcp-6.1.2-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/ocf-linux/{ocf-linux-01-modules-cross.patch => 0001-modules-cross.patch} (100%)
 rename package/ofono/{ofono-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch} (100%)
 rename package/ola/{ola-0001-fix-build-warning.patch => 0001-fix-build-warning.patch} (100%)
 rename package/ola/{ola-0002-move-python-sub-check-to-configure.ac.patch => 0002-move-python-sub-check-to-configure.ac.patch} (100%)
 rename package/ola/{ola-0003-fix-check-for-python-module-for-cross-compilation.patch => 0003-fix-check-for-python-module-for-cross-compilation.patch} (100%)
 rename package/olsr/{olsr-configurable-ldconfig.patch => 0001-configurable-ldconfig.patch} (100%)
 rename package/open2300/{open2300-0001-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/opencv/{opencv-0001-core-fix-x86-PIC-code-compilation.patch => 0001-core-fix-x86-PIC-code-compilation.patch} (100%)
 rename package/openobex/{openobex-libusb_check_when_cross-compiling.patch => 0001-libusb_check_when_cross-compiling.patch} (100%)
 rename package/openobex/{openobex-replace_deprecated_functions.patch => 0002-replace_deprecated_functions.patch} (100%)
 rename package/openocd/{openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch => 0001-fix-cross-compilation-host-libsub-was-used-before.patch} (100%)
 rename package/openocd/{openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch => 0002-fix-xscale-uninitialise-breakpoint_pc.patch} (100%)
 rename package/openocd/{openocd-0003-force-gnu99.patch => 0003-force-gnu99.patch} (100%)
 rename package/openocd/{openocd-0004-force_jimtcl_static.patch => 0004-force_jimtcl_static.patch} (100%)
 rename package/openocd/{openocd-0005-dont-force-ldflags.patch => 0005-dont-force-ldflags.patch} (100%)
 rename package/openocd/{openocd-0006-automake-compat.patch => 0006-automake-compat.patch} (100%)
 rename package/openpgm/{openpgm-0001-version_generator.py-make-it-python3-compliant.patch => 0001-version_generator.py-make-it-python3-compliant.patch} (100%)
 rename package/openpgm/{openpgm-cross-compile.patch => 0002-cross-compile.patch} (100%)
 rename package/openpowerlink/{openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch => 0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} (100%)
 rename package/openssh/{openssh-01-fix-pam-uclibc-pthreads-clash.patch => 0001-fix-pam-uclibc-pthreads-clash.patch} (100%)
 rename package/openssh/{openssh-02-fix-howmany-include.patch => 0002-fix-howmany-include.patch} (100%)
 rename package/openssl/{openssl-001-do-not-build-docs.patch => 0001-do-not-build-docs.patch} (100%)
 rename package/openssl/{openssl-002-dont-force-large-file.patch => 0002-dont-force-large-file.patch} (100%)
 rename package/openssl/{openssl-003-cryptodev-Fix-issue-with-signature-generation.patch => 0003-cryptodev-Fix-issue-with-signature-generation.patch} (100%)
 rename package/openssl/{openssl-004-musl-termios.patch => 0004-musl-termios.patch} (100%)
 rename package/openvmtools/{openvmtools-01-has_bsd_printf.patch => 0001-has_bsd_printf.patch} (100%)
 rename package/openvmtools/{openvmtools-02-network_script.patch => 0002-network_script.patch} (100%)
 rename package/openvmtools/{openvmtools-03-conditionally-define-g_info.patch => 0003-conditionally-define-g_info.patch} (100%)
 rename package/openvmtools/{openvmtools-04-no_cflags_werror.patch => 0004-no_cflags_werror.patch} (100%)
 rename package/openvmtools/{openvmtools-05-dont-force-cppflags.patch => 0005-dont-force-cppflags.patch} (100%)
 rename package/oprofile/{oprofile-001-avr32-enable-lookup_dcookie.patch => 0001-avr32-enable-lookup_dcookie.patch} (100%)
 rename package/oprofile/{oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch => 0002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch} (100%)
 rename package/oprofile/{oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch => 0003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch} (100%)
 rename package/opus-tools/{opus-tools-largefile.patch => 0001-largefile.patch} (100%)
 rename package/opus/{opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch => 0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch} (100%)
 rename package/owl-linux/{owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch => 0001-fix-CROSS_COMPILE-usage-in-Makefile.patch} (100%)
 rename package/owl-linux/{owl-linux-fix-for-linux-3.3.x.patch => 0002-fix-for-linux-3.3.x.patch} (100%)
 rename package/p11-kit/{p11-kit-01-Fix-build-against-older-pthreads-implementations.patch => 0001-Fix-build-against-older-pthreads-implementations.patch} (100%)
 rename package/pango/{pango-0001-no-tests.patch => 0001-no-tests.patch} (100%)
 rename package/{libglib2/libglib2-0002-no-gtk-doc.patch => pango/0002-no-gtk-doc.patch} (100%)
 rename package/parted/{parted-001-readline-deprecated.patch => 0001-readline-deprecated.patch} (100%)
 rename package/parted/{parted-002-configure.ac-uclinux-is-also-linux.patch => 0002-configure.ac-uclinux-is-also-linux.patch} (100%)
 rename package/pcmanfm/{pcmanfm-link-against-libx11.patch => 0001-link-against-libx11.patch} (100%)
 rename package/pcre/{pcre-01-no-compat.patch => 0001-no-compat.patch} (100%)
 rename package/pcre/{pcre-02-no-cpp-tests.patch => 0002-no-cpp-tests.patch} (100%)
 rename package/pcsc-lite/{pcsc-lite-0001-pthread-needed-for-libusb.patch => 0001-pthread-needed-for-libusb.patch} (100%)
 rename package/perl-gd/{perl-gd-01-getoptions.patch => 0001-getoptions.patch} (100%)
 rename package/perl-gd/{perl-gd-02-lgd.patch => 0002-lgd.patch} (100%)
 rename package/perl-gd/{perl-gd-03-force.patch => 0003-force.patch} (100%)
 rename package/perl-net-ssleay/{perl-net-ssleay-0000-fix-build-system.patch => 0001-fix-build-system.patch} (100%)
 rename package/perl-xml-libxml/{perl-xml-libxml-01-Makefile-PL.patch => 0001-Makefile-PL.patch} (100%)
 rename package/perl/{perl-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} (100%)
 rename package/php/{php-01-no-iconv-search.patch => 0001-no-iconv-search.patch} (100%)
 rename package/php/{php-02-dlopen.patch => 0002-dlopen.patch} (100%)
 rename package/php/{php-03-disable-pharcmd.patch => 0003-disable-pharcmd.patch} (100%)
 rename package/pifmrds/{pifmrds-0001-Makefile-cross-compile-friendly.patch => 0001-Makefile-cross-compile-friendly.patch} (100%)
 rename package/pifmrds/{pifmrds-0002-Makefile-use-LDFLAGS.patch => 0002-Makefile-use-LDFLAGS.patch} (100%)
 rename package/pkgconf/{pkgconf-01-fix-variable.patch => 0001-fix-variable.patch} (100%)
 rename package/pkgconf/{pkgconf-02-fix-double-sysroot.patch => 0002-fix-double-sysroot.patch} (100%)
 rename package/poco/{poco-aarch64.patch => 0001-aarch64.patch} (100%)
 rename package/poco/{poco-add-cross-build-config.patch => 0002-add-cross-build-config.patch} (100%)
 rename package/poco/{poco-add-staging-search-path.patch => 0003-add-staging-search-path.patch} (100%)
 rename package/poco/{poco-dont-build-debug-libs.patch => 0004-dont-build-debug-libs.patch} (100%)
 rename package/polarssl/{polarssl-01-no-test-suite.patch => 0001-no-test-suite.patch} (100%)
 rename package/polarssl/{polarssl-02-disable-microblaze-asm.patch => 0002-disable-microblaze-asm.patch} (100%)
 rename package/polarssl/{polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/popt/{popt-01-no-wchar.patch => 0001-no-wchar.patch} (100%)
 rename package/popt/{popt-02-fix-autoreconf.patch => 0002-fix-autoreconf.patch} (100%)
 rename package/popt/{popt-03-glob-detection.patch => 0003-glob-detection.patch} (100%)
 rename package/portmap/{portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch => 0001-README-fix-typo-in-tcp-wrapper-doc.patch} (100%)
 rename package/portmap/{portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch => 0002-NO_PIE-make-PIE-support-controllable.patch} (100%)
 rename package/portmap/{portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch => 0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch} (100%)
 rename package/portmap/{portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch => 0004-NO_PERROR-control-overriding-of-perror-symbol.patch} (100%)
 rename package/portmap/{portmap-6.0-tcpd.patch => 0005-tcpd.patch} (100%)
 rename package/pptp-linux/{pptp-linux-001-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/pptp-linux/{pptp-linux-002-fix-parallel-build.patch => 0002-fix-parallel-build.patch} (100%)
 rename package/prboom/{prboom-2.5.0-libpng-1.4.patch => 0001-libpng-1.4.patch} (100%)
 rename package/procps-ng/{procps-ng-0000-remove-index.patch => 0001-remove-index.patch} (100%)
 rename package/proftpd/{proftpd-0001-fix-kernel-header-capability-version.patch => 0001-fix-kernel-header-capability-version.patch} (100%)
 rename package/proftpd/{proftpd-0002-__mempcpy.patch => 0002-__mempcpy.patch} (100%)
 rename package/psmisc/{psmisc-link-against-libintl.patch => 0001-link-against-libintl.patch} (100%)
 rename package/psmisc/{psmisc-no-__progname.patch => 0002-no-__progname.patch} (100%)
 rename package/pure-ftpd/{pure-ftpd-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/python-ipython/{python-ipython-001-set-correct-python-executable-path.patch => 0001-set-correct-python-executable-path.patch} (100%)
 rename package/python-netifaces/{python-netifaces-ifaddrs-uclibc.patch => 0001-ifaddrs-uclibc.patch} (100%)
 rename package/python-nfc/{python-nfc-add-setup-py.patch => 0001-add-setup-py.patch} (100%)
 rename package/python-numpy/{python-numpy-0001-no-fenv-on-uclibc.patch => 0001-no-fenv-on-uclibc.patch} (100%)
 rename package/python-pycrypto/{python-pycrypto-0001-remove-incorrect-header-path.patch => 0001-remove-incorrect-header-path.patch} (100%)
 rename package/python-pyzmq/{python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch => 0001-use-buildroot-zmq-version-instead-of-detect.patch} (100%)
 rename package/python-setuptools/{python-setuptools-0001-add-executable.patch => 0001-add-executable.patch} (100%)
 rename package/python/{python-001-remove-host-header-path.patch => 0001-remove-host-header-path.patch} (100%)
 rename package/python/{python-002-fix-get-python-inc.patch => 0002-fix-get-python-inc.patch} (100%)
 rename package/python/{python-003-properly-detect-if-python-build.patch => 0003-properly-detect-if-python-build.patch} (100%)
 rename package/python/{python-004-sysconfigdata-install-location.patch => 0004-sysconfigdata-install-location.patch} (100%)
 rename package/python/{python-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} (100%)
 rename package/python/{python-006-cross-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} (100%)
 rename package/python/{python-007-disable-extensions.patch => 0007-disable-extensions.patch} (100%)
 rename package/python/{python-008-distutils-use-python-sysroot.patch => 0008-distutils-use-python-sysroot.patch} (100%)
 rename package/python/{python-009-no-termcap-host-path.patch => 0009-no-termcap-host-path.patch} (100%)
 rename package/python/{python-010-fix-python-config.patch => 0010-fix-python-config.patch} (100%)
 rename package/python/{python-011-remove-python-symlink.patch => 0011-remove-python-symlink.patch} (100%)
 rename package/python/{python-012-support-library-path-old-compilers.patch => 0012-support-library-path-old-compilers.patch} (100%)
 rename package/python/{python-013-dont-add-multiarch-path.patch => 0013-dont-add-multiarch-path.patch} (100%)
 rename package/python/{python-014-abort-on-failed-modules.patch => 0014-abort-on-failed-modules.patch} (100%)
 rename package/python/{python-015-fix-sqlite-without-threads.patch => 0015-fix-sqlite-without-threads.patch} (100%)
 rename package/python/{python-016-serial-ioctl-workaround.patch => 0016-serial-ioctl-workaround.patch} (100%)
 rename package/python/{python-017-distutils-scripts-dont-adjust-shebang.patch => 0017-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python/{python-100-optional-test-modules.patch => 0100-optional-test-modules.patch} (100%)
 rename package/python/{python-101-optional-pydoc.patch => 0101-optional-pydoc.patch} (100%)
 rename package/python/{python-102-optional-2to3.patch => 0102-optional-2to3.patch} (100%)
 rename package/python/{python-103-optional-sqlite.patch => 0103-optional-sqlite.patch} (100%)
 rename package/python/{python-104-optional-tk.patch => 0104-optional-tk.patch} (100%)
 rename package/python/{python-105-optional-curses.patch => 0105-optional-curses.patch} (100%)
 rename package/python/{python-106-optional-expat.patch => 0106-optional-expat.patch} (100%)
 rename package/python/{python-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} (100%)
 rename package/python/{python-108-optional-nis.patch => 0108-optional-nis.patch} (100%)
 rename package/python/{python-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} (100%)
 rename package/python/{python-110-optional-db.patch => 0110-optional-db.patch} (100%)
 rename package/python/{python-111-optional-ssl.patch => 0111-optional-ssl.patch} (100%)
 rename package/python/{python-112-optional-bzip2.patch => 0112-optional-bzip2.patch} (100%)
 rename package/python/{python-113-optional-zlib.patch => 0113-optional-zlib.patch} (100%)
 rename package/python/{python-114-remove-idle-editor.patch => 0114-remove-idle-editor.patch} (100%)
 rename package/python3/{python3-001-remove-host-header-path.patch => 0001-remove-host-header-path.patch} (100%)
 rename package/python3/{python3-002-properly-detect-if-python-build.patch => 0002-properly-detect-if-python-build.patch} (100%)
 rename package/python3/{python3-003-sysconfigdata-install-location.patch => 0003-sysconfigdata-install-location.patch} (100%)
 rename package/python3/{python3-004-old-stdlib-cache.patch => 0004-old-stdlib-cache.patch} (100%)
 rename package/python3/{python3-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} (100%)
 rename package/python3/{python3-006-cross-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} (100%)
 rename package/python3/{python3-007-disable-extensions.patch => 0007-disable-extensions.patch} (100%)
 rename package/python3/{python3-008-distutils-sysconfig-use-sysconfigdata.patch => 0008-distutils-sysconfig-use-sysconfigdata.patch} (100%)
 rename package/python3/{python3-009-distutils-use-python-sysroot.patch => 0009-distutils-use-python-sysroot.patch} (100%)
 rename package/python3/{python3-010-no-termcap-host-path.patch => 0010-no-termcap-host-path.patch} (100%)
 rename package/python3/{python3-011-support-library-path-old-compilers.patch => 0011-support-library-path-old-compilers.patch} (100%)
 rename package/python3/{python3-012-dont-add-multiarch-path.patch => 0012-dont-add-multiarch-path.patch} (100%)
 rename package/python3/{python3-013-abort-on-failed-modules.patch => 0013-abort-on-failed-modules.patch} (100%)
 rename package/python3/{python3-014-serial-ioctl-workaround.patch => 0014-serial-ioctl-workaround.patch} (100%)
 rename package/python3/{python3-015-distutils-scripts-dont-adjust-shebang.patch => 0015-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python3/{python3-016-distutils-no-pep3147.patch => 0016-distutils-no-pep3147.patch} (100%)
 rename package/python3/{python3-100-optional-test-modules.patch => 0100-optional-test-modules.patch} (100%)
 rename package/python3/{python3-101-optional-pydoc.patch => 0101-optional-pydoc.patch} (100%)
 rename package/python3/{python3-102-optional-2to3.patch => 0102-optional-2to3.patch} (100%)
 rename package/python3/{python3-103-optional-sqlite.patch => 0103-optional-sqlite.patch} (100%)
 rename package/python3/{python3-104-optional-tk.patch => 0104-optional-tk.patch} (100%)
 rename package/python3/{python3-105-optional-curses.patch => 0105-optional-curses.patch} (100%)
 rename package/python3/{python3-106-optional-expat.patch => 0106-optional-expat.patch} (100%)
 rename package/python3/{python3-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} (100%)
 rename package/python3/{python3-108-optional-nis.patch => 0108-optional-nis.patch} (100%)
 rename package/python3/{python3-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} (100%)
 rename package/python3/{python3-110-optional-idle.patch => 0110-optional-idle.patch} (100%)
 rename package/python3/{python3-111-optional-decimal.patch => 0111-optional-decimal.patch} (100%)
 rename package/qdecoder/{qdecoder-0001-fix-make-install.patch => 0001-fix-make-install.patch} (100%)
 rename package/qdecoder/{qdecoder-0002-configure.ac-drop-hardcoded-paths.patch => 0002-configure.ac-drop-hardcoded-paths.patch} (100%)
 rename package/qdecoder/{qdecoder-0003-errno.patch => 0003-errno.patch} (100%)
 rename package/qextserialport/{qextserialport-gui.patch => 0001-gui.patch} (100%)
 rename package/qextserialport/{qextserialport-main-include.patch => 0002-main-include.patch} (100%)
 rename package/qextserialport/{qextserialport-pkgconfig.patch => 0003-pkgconfig.patch} (100%)
 rename package/qjson/{qjson-fix-qt4-package-error-in-cmakelists.patch => 0001-fix-qt4-package-error-in-cmakelists.patch} (100%)
 rename package/qlibc/{qlibc-0001-remove-absolute-paths.patch => 0001-remove-absolute-paths.patch} (100%)
 rename package/qlibc/{qlibc-0002-obey-destdir.patch => 0002-obey-destdir.patch} (100%)
 rename package/qlibc/{qlibc-0003-fix-openssl-mysql-checks.patch => 0003-fix-openssl-mysql-checks.patch} (100%)
 rename package/qt/{qt-configure.patch => 0001-configure.patch} (100%)
 rename package/qt/{qt-eglwsegl-use-system.patch => 0002-eglwsegl-use-system.patch} (100%)
 rename package/qt/{qt-fix-const-atomics.patch => 0003-fix-const-atomics.patch} (100%)
 rename package/qt/{qt-pthread_getattr_np.patch => 0004-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-script-qtdbus-no-gui.patch => 0005-script-qtdbus-no-gui.patch} (100%)
 rename package/qt/{qt-uClibc-lfs-fix.patch => 0006-uClibc-lfs-fix.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} (100%)
 rename package/qt5/qt5webkit-examples/{qt5webkit-examples-0001-build.patch => 0001-build.patch} (100%)
 rename package/qt5/qt5webkit/{qt5webkit-0001-egl-includepath.patch => 0001-egl-includepath.patch} (100%)
 rename package/qt5/qt5websockets/{qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch => 0001-Remove-dependency-on-unused-sql-module.patch} (100%)
 rename package/qtuio/{qtuio-TuioServer.cpp-add-missing-include.patch => 0001-TuioServer.cpp-add-missing-include.patch} (100%)
 rename package/qtuio/{qtuio-dont-append-_d-for-debug.patch => 0002-dont-append-_d-for-debug.patch} (100%)
 rename package/quagga/{quagga-fix-ipctl-forwarding.patch => 0001-fix-ipctl-forwarding.patch} (100%)
 rename package/quota/{quota-01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch} (100%)
 rename package/qwt/{qwt-remove-installed-check.patch => 0001-remove-installed-check.patch} (100%)
 rename package/radvd/{radvd-01-drop-check.patch => 0001-drop-check.patch} (100%)
 rename package/radvd/{radvd-02-drop-stack-protector.patch => 0002-drop-stack-protector.patch} (100%)
 rename package/rdesktop/{rdesktop-01-8bit-colors.patch => 0001-8bit-colors.patch} (100%)
 rename package/readline/{readline-001-curses-link.patch => 0001-curses-link.patch} (100%)
 rename package/redis/{redis-001-uclibc.patch => 0001-uclibc.patch} (100%)
 rename package/redis/{redis-002-lua-AR.patch => 0002-lua-AR.patch} (100%)
 rename package/redis/{redis-003-largefile-conditional-define.patch => 0003-largefile-conditional-define.patch} (100%)
 rename package/rp-pppoe/{rp-pppoe-3.10-002-krn-plugin.patch => 0002-krn-plugin.patch} (100%)
 rename package/rpcbind/{rpcbind-0001-Remove-yellow-pages-support.patch => 0001-Remove-yellow-pages-support.patch} (100%)
 rename package/rpcbind/{rpcbind-0003-Make-IPv6-configurable.patch => 0003-Make-IPv6-configurable.patch} (100%)
 rename package/rpi-userland/{rpi-userland-000-add-pkgconfig-files.patch => 0001-add-pkgconfig-files.patch} (100%)
 rename package/rpi-userland/{rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch => 0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} (100%)
 rename package/rpi-userland/{rpi-userland-002-remove-faulty-assert.patch => 0003-remove-faulty-assert.patch} (100%)
 rename package/rpi-userland/{rpi-userland-003-fix-musl-compile.patch => 0004-fix-musl-compile.patch} (100%)
 rename package/rpm/{rpm-5.2.0-uclibc-no-lfs-fix.patch => 0001-uclibc-no-lfs-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_depends-fix.patch => 0002-depends-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_exclude-some-tools.patch => 0003-exclude-some-tools.patch} (100%)
 rename package/rpm/{rpm-5.2.0_ignore-shared-mutexes.patch => 0004-ignore-shared-mutexes.patch} (100%)
 rename package/rpm/{rpm-5.2.0_no-parentdirs.patch => 0005-no-parentdirs.patch} (100%)
 rename package/rpm/{rpm-5.2.0_ordering-fix.patch => 0006-ordering-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_parentdir-vs-requires.patch => 0007-parentdir-vs-requires.patch} (100%)
 rename package/rpm/{rpm-5.2.0_short-circuit-c99.patch => 0008-short-circuit-c99.patch} (100%)
 rename package/rrdtool/{rrdtool-automake-compat.patch => 0001-automake-compat.patch} (100%)
 rename package/rrdtool/{rrdtool-configure-dont-hardcode-include-dirs.patch => 0002-configure-dont-hardcode-include-dirs.patch} (100%)
 rename package/rt-tests/{rt-tests-fix-build-system.patch => 0001-fix-build-system.patch} (100%)
 rename package/rt-tests/{rt-tests-uclibc.patch => 0002-uclibc.patch} (100%)
 rename package/rtorrent/{rtorrent-cross_compile.patch => 0001-cross_compile.patch} (100%)
 rename package/rtptools/{rtptools-01-host2ip-no-nis-on-uClibc.patch => 0001-host2ip-no-nis-on-uClibc.patch} (100%)
 rename package/rubix/{rubix-1.0.5-dont-use-legacy-functions.patch => 0001-dont-use-legacy-functions.patch} (100%)
 rename package/rubix/{rubix-1.0.5.patch => 0002-misc-fixes.patch} (100%)
 rename package/samba/{samba-0001-fix-smbd-libs-avahi.patch => 0001-fix-smbd-libs-avahi.patch} (100%)
 rename package/samba/{samba-0002-getaddrinfo.patch => 0002-getaddrinfo.patch} (100%)
 rename package/samba4/{samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch => 0003-build-find-FILE_OFFSET_BITS-via-array.patch} (100%)
 rename package/samba4/{samba4-0004-build-allow-some-python-variable-overrides.patch => 0004-build-allow-some-python-variable-overrides.patch} (100%)
 rename package/samba4/{samba4-0005-build-find-blkcnt_t-size-via-array.patch => 0005-build-find-blkcnt_t-size-via-array.patch} (100%)
 rename package/samba4/{samba4-0006-build-unify-and-fix-endian-tests.patch => 0006-build-unify-and-fix-endian-tests.patch} (100%)
 rename package/samba4/{samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch => 0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch} (100%)
 rename package/samba4/{samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch => 0008-build-tweak-SIZEOF-utmp-ut_line.patch} (100%)
 rename package/samba4/{samba4-0009-disable-libbsd.patch => 0009-disable-libbsd.patch} (100%)
 rename package/sane-backends/{sane-backends-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch} (100%)
 rename package/sane-backends/{sane-backends-1.0.22-v4l.patch => 0002-v4l.patch} (100%)
 rename package/sawman/{sawman-001-link-using-gcc-instead-of-ld.patch => 0001-link-using-gcc-instead-of-ld.patch} (100%)
 rename package/screen/{screen-0001-compiler-sanity-checks.patch => 0001-compiler-sanity-checks.patch} (100%)
 rename package/screen/{screen-0002-no-memcpy-fallback.patch => 0002-no-memcpy-fallback.patch} (100%)
 rename package/screen/{screen-0003-cross-compilation-AC_TRY_RUN.patch => 0003-cross-compilation-AC_TRY_RUN.patch} (100%)
 rename package/screen/{screen-0004-cross-compilation-ignore-host-fs.patch => 0004-cross-compilation-ignore-host-fs.patch} (100%)
 rename package/screen/{screen-0005-avoid-identifying-as-SVR4.patch => 0005-avoid-identifying-as-SVR4.patch} (100%)
 rename package/screen/{screen-0006-install-no-backup-binary.patch => 0006-install-no-backup-binary.patch} (100%)
 rename package/screen/{screen-0007-install-always-chmod.patch => 0007-install-always-chmod.patch} (100%)
 rename package/screen/{screen-0008-install-nonversioned-binary.patch => 0008-install-nonversioned-binary.patch} (100%)
 rename package/screen/{screen-0009-install-dir-dependency.patch => 0009-install-dir-dependency.patch} (100%)
 rename package/screen/{screen-0010-rename-sched_h.patch => 0010-rename-sched_h.patch} (100%)
 rename package/sdl/{sdl-0001-use-correct-directfb-config.patch => 0001-use-correct-directfb-config.patch} (100%)
 rename package/sdl/{sdl-0002-fix-compilation-with-libx11.patch => 0002-fix-compilation-with-libx11.patch} (100%)
 rename package/ser2net/{ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch => 0001-Fix-TIOCSRS485-undeclared-error.patch} (100%)
 rename package/setserial/{setserial-0001-build-system-fix.patch => 0001-build-system-fix.patch} (100%)
 rename package/setserial/{setserial-0002-tiocghayesesp-build-fix.patch => 0002-tiocghayesesp-build-fix.patch} (100%)
 rename package/sispmctl/{sispmctl-01-configure-add-pkg-config-support.patch => 0001-configure-add-pkg-config-support.patch} (100%)
 rename package/slang/{slang-01-slsh-libs.patch => 0001-slsh-libs.patch} (100%)
 rename package/smstools3/{smstools3-0000-fix-Makefile.patch => 0001-fix-Makefile.patch} (100%)
 rename package/snmppp/{snmppp-01-Add-missing-includes.patch => 0001-Add-missing-includes.patch} (100%)
 rename package/socat/{socat-001-no-documentation.patch => 0001-no-documentation.patch} (100%)
 rename package/sox/{sox-0001-uclibc.patch => 0001-uclibc.patch} (100%)
 rename package/speex/{speex-thumb2-support.patch => 0001-thumb2-support.patch} (100%)
 rename package/spice/{spice-0001-fix-missing-monitor_latency-argument.patch => 0001-fix-missing-monitor_latency-argument.patch} (100%)
 rename package/squid/{squid-01-assume-get-certificate-ok.patch => 0001-assume-get-certificate-ok.patch} (100%)
 rename package/squid/{squid-02-missing-include-time_h.patch => 0002-missing-include-time_h.patch} (100%)
 rename package/statserial/{statserial-01-ncurses-link.patch => 0001-ncurses-link.patch} (100%)
 rename package/strace/{strace-0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch => 0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch} (100%)
 rename package/stress/{stress-0001-Remove-largefile.patch => 0001-Remove-largefile.patch} (100%)
 rename package/sudo/{sudo-0001-no-netgroup.patch => 0001-no-netgroup.patch} (100%)
 rename package/sudo/{sudo-0002-drop-sspcflags-piecflags-for-host.patch => 0002-drop-sspcflags-piecflags-for-host.patch} (100%)
 rename package/sunxi-mali/{sunxi-mali-0001-Add-missing-GLchar-definitions.patch => 0001-Add-missing-GLchar-definitions.patch} (100%)
 rename package/synergy/{synergy-1.3.1-includes.patch => 0001-includes.patch} (100%)
 rename package/synergy/{synergy-1.3.1-remove-werror.patch => 0002-remove-werror.patch} (100%)
 rename package/sysprof/{sysprof-01-define-NT_GNU_BUILD_ID.patch => 0001-define-NT_GNU_BUILD_ID.patch} (100%)
 rename package/systemd/{systemd-01-fix-getty-unit.patch => 0001-fix-getty-unit.patch} (100%)
 rename package/systemd/{systemd-02-build-sys-revert-use-of-ln-relative-option.patch => 0002-build-sys-revert-use-of-ln-relative-option.patch} (100%)
 rename package/systemd/{systemd-03-fix-am-path-libgcrypt-no-found.patch => 0003-fix-am-path-libgcrypt-no-found.patch} (100%)
 rename package/taglib/{taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/tar/{tar-0001-fix-build-failure.patch => 0001-fix-build-failure.patch} (100%)
 rename package/tcl/{tcl-0001-dont-build-compat.patch => 0001-dont-build-compat.patch} (100%)
 rename package/thrift/{thrift-01-libevent-cross.patch => 0001-libevent-cross.patch} (100%)
 rename package/thrift/{thrift-02-autoreconf.patch => 0002-autoreconf.patch} (100%)
 rename package/thrift/{thrift-03-zlib-cross.patch => 0003-zlib-cross.patch} (100%)
 rename package/thrift/{thrift-04-failed-to-build-on-OSX-10.9-GM.patch => 0004-failed-to-build-on-OSX-10.9-GM.patch} (100%)
 rename package/thrift/{thrift-05-stdlib-and-boost-both-define-uint64_t.patch => 0005-stdlib-and-boost-both-define-uint64_t.patch} (100%)
 rename package/thttpd/{thttpd-2.25b-getline.patch => 0001-getline.patch} (100%)
 rename package/ti-gfx/{ti-gfx-0000-newclkapi.patch => 0001-newclkapi.patch} (100%)
 rename package/ti-gfx/{ti-gfx-0001-fix-build-omaplfb-linux.patch => 0002-fix-build-omaplfb-linux.patch} (100%)
 rename package/ti-gfx/{ti-gfx-km_install_modules.patch => 0003-km_install_modules.patch} (100%)
 rename package/tinyhttpd/{tinyhttpd.patch => 0001-misc-fixes.patch} (100%)
 rename package/tn5250/{tn5250-01-ssldir.patch => 0001-ssldir.patch} (100%)
 rename package/trace-cmd/{trace-cmd-0001-Fix-ptrace-detection.patch => 0001-Fix-ptrace-detection.patch} (100%)
 rename package/transmission/{transmission-01-fix-utypes.patch => 0001-fix-utypes.patch} (100%)
 rename package/tslib/{tslib-enable_raw_module.patch => 0001-enable_raw_module.patch} (100%)
 rename package/tslib/{tslib_add_finddef_and_inputattach_utils.patch => 0002-add_finddef_and_inputattach_utils.patch} (100%)
 rename package/tstools/{tstools-001-build-get-along-with-buildroot.patch => 0001-build-get-along-with-buildroot.patch} (100%)
 rename package/tstools/{tstools-002-build-fix-parallel-build-failure.patch => 0002-build-fix-parallel-build-failure.patch} (100%)
 rename package/tvheadend/{tvheadend-002-no-check_config.patch => 0002-no-check_config.patch} (100%)
 rename package/tvheadend/{tvheadend-003-remove-werror.patch => 0003-remove-werror.patch} (100%)
 rename package/uboot-tools/{uboot-tools-01-drop-configh-from-tools.patch => 0001-drop-configh-from-tools.patch} (100%)
 rename package/uboot-tools/{uboot-tools-02-nostrip.patch => 0002-nostrip.patch} (100%)
 rename package/udpcast/{udpcast-select-h.patch => 0001-select-h.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.01.patch => 0001-lt.01.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.02.patch => 0002-lt.02.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.03.ixon.patch => 0003-lt.03.ixon.patch} (100%)
 rename package/unionfs/{unionfs-fuse-no-cxx-needed.patch => 0001-fuse-no-cxx-needed.patch} (100%)
 rename package/urg/{urg-select-h.patch => 0001-select-h.patch} (100%)
 rename package/usb_modeswitch_data/{usb_modeswitch_data-makefile.patch => 0001-makefile.patch} (100%)
 rename package/usbmount/{usbmount-rules-fix.patch => 0001-rules-fix.patch} (100%)
 rename package/usbmount/{usbmount-use-udev-environment-instead-of-blkid.patch => 0002-use-udev-environment-instead-of-blkid.patch} (100%)
 rename package/ushare/{ushare-compile-fixes.patch => 0001-compile-fixes.patch} (100%)
 rename package/ussp-push/{ussp-push-fix-build-against-bluez-4.patch => 0001-fix-build-against-bluez-4.patch} (100%)
 rename package/util-linux/{util-linux-001-sscanf-no-ms-as.patch => 0001-sscanf-no-ms-as.patch} (100%)
 rename package/util-linux/{util-linux-002-program-invocation-short-name.patch => 0002-program-invocation-short-name.patch} (100%)
 rename package/util-linux/{util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch => 0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} (100%)
 rename package/vala/{vala-dont-add-dirty-to-valac-version.patch => 0001-dont-add-dirty-to-valac-version.patch} (100%)
 rename package/valgrind/{valgrind-0001-workaround-SIGSEGV-on-PPC.patch => 0001-workaround-SIGSEGV-on-PPC.patch} (100%)
 rename package/valgrind/{valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch => 0002-don-t-enable-largefile-support-unconditionally-on-uC.patch} (100%)
 rename package/valgrind/{valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch => 0003-add-missing-ptrace-getsiginfo-on-powerpc.patch} (100%)
 rename package/vde2/{vde2-no-cxx.patch => 0001-no-cxx.patch} (100%)
 rename package/vlc/{vlc-0001-vlc-static.patch => 0001-vlc-static.patch} (100%)
 rename package/vlc/{vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch => 0002-configure.ac-add-check-for-libgcrypt-config-program.patch} (100%)
 rename package/vlc/{vlc-0003-automake-add-subdir-objects-option.patch => 0003-automake-add-subdir-objects-option.patch} (100%)
 rename package/vlc/{vlc-0004-libav.patch => 0004-libav.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-fix-build.patch => 0001-fix-build.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-nomanual.patch => 0002-nomanual.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-susv3-legacy.patch => 0003-susv3-legacy.patch} (100%)
 rename package/vsftpd/{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} (100%)
 rename package/vsftpd/{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} (100%)
 rename package/vtun/{vtun-001-fix-installation.patch => 0001-fix-installation.patch} (100%)
 rename package/vtun/{vtun-002-fix-ssl-headers-checks.patch => 0002-fix-ssl-headers-checks.patch} (100%)
 rename package/vtun/{vtun-003-fixup-configure.in.patch => 0003-fixup-configure.in.patch} (100%)
 rename package/webkit/{webkit-0001-build-fix-for-32-bit-autotools.patch => 0001-build-fix-for-32-bit-autotools.patch} (100%)
 rename package/webkit/{webkit-0002-build-fix-for-gtklauncher.patch => 0002-build-fix-for-gtklauncher.patch} (100%)
 rename package/webkit/{webkit-0003-detect-harfbuzz-icu.patch => 0003-detect-harfbuzz-icu.patch} (100%)
 rename package/webkit/{webkit-0004-disable-docrebase.patch => 0004-disable-docrebase.patch} (100%)
 rename package/webkit/{webkit-0005-disable-tests.patch => 0005-disable-tests.patch} (100%)
 rename package/webkit/{webkit-0006-execinfo_h.patch => 0006-execinfo_h.patch} (100%)
 rename package/webkit/{webkit-0007-mips-dfg.patch => 0007-mips-dfg.patch} (100%)
 rename package/webkit/{webkit-0008-support-bison-3.0.patch => 0008-support-bison-3.0.patch} (100%)
 rename package/wget/{wget-0001-spawn-fix-link-error-on-uclibc.patch => 0001-spawn-fix-link-error-on-uclibc.patch} (100%)
 rename package/wipe/{wipe-dont-force-lfs.patch => 0001-dont-force-lfs.patch} (100%)
 rename package/wireless_tools/{wireless_tools-01-remove-bzero.patch => 0001-remove-bzero.patch} (100%)
 rename package/wireshark/{wireshark-0001-fix-wrong-cflags-for-build-assumption.patch => 0001-fix-wrong-cflags-for-build-assumption.patch} (100%)
 rename package/wvdial/{wvdial-0001-uClibc-scandir.patch => 0001-uClibc-scandir.patch} (100%)
 rename package/wvstreams/{wvstreams-0001-fix-uClibc-compile-getcontext.patch => 0001-fix-uClibc-compile-getcontext.patch} (100%)
 rename package/wvstreams/{wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch => 0002-fix-uClibc-compile-execinfo-backtrace.patch} (100%)
 rename package/wvstreams/{wvstreams-0003-fix-uClibc-compile-misc.patch => 0003-fix-uClibc-compile-misc.patch} (100%)
 rename package/wvstreams/{wvstreams-0004-build-fixes.patch => 0004-build-fixes.patch} (100%)
 rename package/wvstreams/{wvstreams-0005-getuid.patch => 0005-getuid.patch} (100%)
 rename package/x11r7/xapp_luit/{xapp_luit-posix-openpt.patch => 0001-posix-openpt.patch} (100%)
 rename package/x11r7/xcursor-transparent-theme/{xcursor-transparent-theme-0001-fix-symlink.patch => 0001-fix-symlink.patch} (100%)
 rename package/x11r7/xdriver_xf86-input-tslib/{xdriver_xf86-input-tslib-0001-fix-segfault.patch => 0001-fix-segfault.patch} (100%)
 rename package/x11r7/xdriver_xf86-input-tslib/{xdriver_xf86-input-tslib-0002-port-abi-12.patch => 0002-port-abi-12.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ark/{xdriver_xf86-video-ark-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0001-noxaa.patch => 0001-noxaa.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0003-DamageUnregister.patch => 0003-DamageUnregister.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-geode/{xdriver_xf86-video-geode-0001-include.patch => 0001-include.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-glint/{xdriver_xf86-video-glint-0001-mbstring.patch => 0001-mbstring.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-i128/{xdriver_xf86-video-i128-0001-mbstring.patch => 0001-mbstring.patch} (100%)
 rename package/x11r7/{xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch => xdriver_xf86-video-mach64/0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-mga/{xdriver_xf86-video-mga-1.4.9.patch => 0001-misc-fixes.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-nv/{xdriver_xf86-video-nv-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/{xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch => xdriver_xf86-video-r128/0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-savage/{xdriver_xf86-video-savage-2.2.1-cross-compile.patch => 0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-siliconmotion/{xdriver_xf86-video-siliconmotion-0001-smi_driver.patch => 0001-smi_driver.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch => 0003-xf86UnMapVidMem.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0004-xf86Priv.patch => 0004-xf86Priv.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0005-hvdisplay.patch => 0005-hvdisplay.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0006-fixwarnings.patch => 0006-fixwarnings.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0007-xi.patch => 0007-xi.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tdfx/{xdriver_xf86-video-tdfx-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tdfx/{xdriver_xf86-video-tdfx-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tga/{xdriver_xf86-video-tga-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-trident/{xdriver_xf86-video-trident-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-trident/{xdriver_xf86-video-trident-0002-xaa.patch => 0002-xaa.patch} (100%)
 rename package/x11r7/xlib_libXpm/{xlib_libXpm-01-fork-check.patch => 0001-fork-check.patch} (100%)
 rename package/x11r7/xlib_libXt/{xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch => 0001-util-don-t-link-makestrs-with-target-cflags.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch => 0001-os-log-adjust-gcc-version-conditions-for-pragma.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0002-glyphpadbytes.patch => 0002-glyphpadbytes.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0003-microblaze.patch => 0003-microblaze.patch} (100%)
 rename package/x11vnc/{x11vnc-ipv6.patch => 0001-ipv6.patch} (100%)
 rename package/xbmc/{xbmc-0001-Fixup-include-path.patch => 0001-Fixup-include-path.patch} (100%)
 rename package/xbmc/{xbmc-0002-mathutil.patch => 0002-mathutil.patch} (100%)
 rename package/xbmc/{xbmc-0003-dbus.patch => 0003-dbus.patch} (100%)
 rename package/xinetd/{xinetd-001-ar.patch => 0001-ar.patch} (100%)
 rename package/xinetd/{xinetd-002-destdir.patch => 0002-destdir.patch} (100%)
 rename package/xinetd/{xinetd-003-rpc-fix.patch => 0003-rpc-fix.patch} (100%)
 rename package/xinetd/{xinetd-004-configure-rlim_t.patch => 0004-configure-rlim_t.patch} (100%)
 rename package/xl2tp/{xl2tp-legacy.patch => 0001-legacy.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch => 0001-fix-cross-compile-ansi-c-bailout.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0002-fix-minixpm-build-problem.patch => 0002-fix-minixpm-build-problem.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0003-driver-fix-linking-with-lintl.patch => 0003-driver-fix-linking-with-lintl.patch} (100%)
 rename package/xvkbd/{xvkbd-makefile.patch => 0001-makefile.patch} (100%)
 rename package/yajl/{yajl-0001-math-link.patch => 0001-math-link.patch} (100%)
 rename package/yajl/{yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} (100%)
 rename package/ympd/{ympd-0001-CMake-cross-compile-mkdata.patch => 0001-CMake-cross-compile-mkdata.patch} (100%)
 rename package/ympd/{ympd-0002-only-c-language.patch => 0002-only-c-language.patch} (100%)
 rename package/zeromq/{zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch => 0001-tests-disable-test_fork-if-fork-is-not-available.patch} (100%)
 rename package/zic/{zic-fix-dependencies.patch => 0001-fix-dependencies.patch} (100%)
 rename package/zlog/{zlog-01-fix-compiling-on-Buildroot.patch => 0001-fix-compiling-on-Buildroot.patch} (100%)
 rename package/zlog/{zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch => 0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch} (100%)
 rename package/znc/{znc-01-time.patch => 0001-time.patch} (100%)
 rename package/zxing/{zxing-makefile.patch => 0001-makefile.patch} (100%)

diff --git a/package/acl/acl-01-support-static-installation.patch b/package/acl/0001-support-static-installation.patch
similarity index 100%
rename from package/acl/acl-01-support-static-installation.patch
rename to package/acl/0001-support-static-installation.patch
diff --git a/package/acpid/acpid-01-dont-use-isfdtype.patch b/package/acpid/0001-dont-use-isfdtype.patch
similarity index 100%
rename from package/acpid/acpid-01-dont-use-isfdtype.patch
rename to package/acpid/0001-dont-use-isfdtype.patch
diff --git a/package/acpid/acpid-02-add-missing-defines.patch b/package/acpid/0002-add-missing-defines.patch
similarity index 100%
rename from package/acpid/acpid-02-add-missing-defines.patch
rename to package/acpid/0002-add-missing-defines.patch
diff --git a/package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch b/package/aiccu/0001-gnutls-and-uclibc-fixes.patch
similarity index 100%
rename from package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch
rename to package/aiccu/0001-gnutls-and-uclibc-fixes.patch
diff --git a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch b/package/aiccu/0002-makefile-reorder-linked-libraries.patch
similarity index 100%
rename from package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
rename to package/aiccu/0002-makefile-reorder-linked-libraries.patch
diff --git a/package/aiccu/aiccu-0003-clock-suite-functions-fix.patch b/package/aiccu/0003-clock-suite-functions-fix.patch
similarity index 100%
rename from package/aiccu/aiccu-0003-clock-suite-functions-fix.patch
rename to package/aiccu/0003-clock-suite-functions-fix.patch
diff --git a/package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch b/package/aircrack-ng/0001-CVE-2010-1159.patch
similarity index 100%
rename from package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch
rename to package/aircrack-ng/0001-CVE-2010-1159.patch
diff --git a/package/alsa-lib/alsa-lib-0001-avr32-bad-inline.patch b/package/alsa-lib/0001-avr32-bad-inline.patch
similarity index 100%
rename from package/alsa-lib/alsa-lib-0001-avr32-bad-inline.patch
rename to package/alsa-lib/0001-avr32-bad-inline.patch
diff --git a/package/alsa-lib/alsa-lib-0002-no-mmu.patch b/package/alsa-lib/0002-no-mmu.patch
similarity index 100%
rename from package/alsa-lib/alsa-lib-0002-no-mmu.patch
rename to package/alsa-lib/0002-no-mmu.patch
diff --git a/package/alsa-lib/alsa-lib-0003-dlmisc.patch b/package/alsa-lib/0003-dlmisc.patch
similarity index 100%
rename from package/alsa-lib/alsa-lib-0003-dlmisc.patch
rename to package/alsa-lib/0003-dlmisc.patch
diff --git a/package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch b/package/alsa-lib/0004-conditional-enabling-of-libdl-in-m4.patch
similarity index 100%
rename from package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch
rename to package/alsa-lib/0004-conditional-enabling-of-libdl-in-m4.patch
diff --git a/package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch b/package/alsamixergui/0001-misc-fixes.patch
similarity index 100%
rename from package/alsamixergui/alsamixergui_0.9.0rc2-1-7.patch
rename to package/alsamixergui/0001-misc-fixes.patch
diff --git a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch b/package/am33x-cm3/0001-fix-makefile.patch
similarity index 100%
rename from package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
rename to package/am33x-cm3/0001-fix-makefile.patch
diff --git a/package/apr-util/apr-util-01-remove-checkapr.patch b/package/apr-util/0001-remove-checkapr.patch
similarity index 100%
rename from package/apr-util/apr-util-01-remove-checkapr.patch
rename to package/apr-util/0001-remove-checkapr.patch
diff --git a/package/argp-standalone/argp-standalone-throw-in-funcdef.patch b/package/argp-standalone/0001-throw-in-funcdef.patch
similarity index 100%
rename from package/argp-standalone/argp-standalone-throw-in-funcdef.patch
rename to package/argp-standalone/0001-throw-in-funcdef.patch
diff --git a/package/at/at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch b/package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
similarity index 100%
rename from package/at/at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
rename to package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
diff --git a/package/at/at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
similarity index 100%
rename from package/at/at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
rename to package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
diff --git a/package/at/at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch b/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
similarity index 100%
rename from package/at/at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
rename to package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
diff --git a/package/at/at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 100%
rename from package/at/at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
diff --git a/package/at/at-0005-Makefile.in-make-install-fix.patch b/package/at/0005-Makefile.in-make-install-fix.patch
similarity index 100%
rename from package/at/at-0005-Makefile.in-make-install-fix.patch
rename to package/at/0005-Makefile.in-make-install-fix.patch
diff --git a/package/at/at-0006-getloadavg.c-fix.patch b/package/at/0006-getloadavg.c-fix.patch
similarity index 100%
rename from package/at/at-0006-getloadavg.c-fix.patch
rename to package/at/0006-getloadavg.c-fix.patch
diff --git a/package/at/at-0007-parsetime.l-include-config-h.patch b/package/at/0007-parsetime.l-include-config-h.patch
similarity index 100%
rename from package/at/at-0007-parsetime.l-include-config-h.patch
rename to package/at/0007-parsetime.l-include-config-h.patch
diff --git a/package/attr/attr-01-support-static-installation.patch b/package/attr/0001-support-static-installation.patch
similarity index 100%
rename from package/attr/attr-01-support-static-installation.patch
rename to package/attr/0001-support-static-installation.patch
diff --git a/package/aumix/aumix-2.8-fix-incorrect-makefile-am.patch b/package/aumix/0001-fix-incorrect-makefile-am.patch
similarity index 100%
rename from package/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
rename to package/aumix/0001-fix-incorrect-makefile-am.patch
diff --git a/package/autoconf/autoconf-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
similarity index 100%
rename from package/autoconf/autoconf-dont-add-dirty-to-version.patch
rename to package/autoconf/0001-dont-add-dirty-to-version.patch
diff --git a/package/automake/automake-0001-noman.patch b/package/automake/0001-noman.patch
similarity index 100%
rename from package/automake/automake-0001-noman.patch
rename to package/automake/0001-noman.patch
diff --git a/package/avahi/avahi-autoipd-perms.patch b/package/avahi/0001-autoipd-perms.patch
similarity index 100%
rename from package/avahi/avahi-autoipd-perms.patch
rename to package/avahi/0001-autoipd-perms.patch
diff --git a/package/avahi/avahi-disable-systemd-support.patch b/package/avahi/0002-disable-systemd-support.patch
similarity index 100%
rename from package/avahi/avahi-disable-systemd-support.patch
rename to package/avahi/0002-disable-systemd-support.patch
diff --git a/package/avahi/avahi-ipv6only.patch b/package/avahi/0003-ipv6only.patch
similarity index 100%
rename from package/avahi/avahi-ipv6only.patch
rename to package/avahi/0003-ipv6only.patch
diff --git a/package/avahi/avahi-optional-ipv6.patch b/package/avahi/0004-optional-ipv6.patch
similarity index 100%
rename from package/avahi/avahi-optional-ipv6.patch
rename to package/avahi/0004-optional-ipv6.patch
diff --git a/package/bash/bash-000-mkbuiltins-cross.patch b/package/bash/0001-mkbuiltins-cross.patch
similarity index 100%
rename from package/bash/bash-000-mkbuiltins-cross.patch
rename to package/bash/0001-mkbuiltins-cross.patch
diff --git a/package/bash/bash-001-patchlevel1-27.patch b/package/bash/0002-patchlevel1-27.patch
similarity index 100%
rename from package/bash/bash-001-patchlevel1-27.patch
rename to package/bash/0002-patchlevel1-27.patch
diff --git a/package/bash/bash-002-patchlevel28.patch b/package/bash/0003-patchlevel28.patch
similarity index 100%
rename from package/bash/bash-002-patchlevel28.patch
rename to package/bash/0003-patchlevel28.patch
diff --git a/package/bash/bash-003-patchlevel29.patch b/package/bash/0004-patchlevel29.patch
similarity index 100%
rename from package/bash/bash-003-patchlevel29.patch
rename to package/bash/0004-patchlevel29.patch
diff --git a/package/bash/bash-004-patchlevel30.patch b/package/bash/0005-patchlevel30.patch
similarity index 100%
rename from package/bash/bash-004-patchlevel30.patch
rename to package/bash/0005-patchlevel30.patch
diff --git a/package/beecrypt/beecrypt-0001-cppglue.cxx-cplusplus-only.patch b/package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch
similarity index 100%
rename from package/beecrypt/beecrypt-0001-cppglue.cxx-cplusplus-only.patch
rename to package/beecrypt/0001-cppglue.cxx-cplusplus-only.patch
diff --git a/package/beecrypt/beecrypt-0002-icu-check-cross-compile.patch b/package/beecrypt/0002-icu-check-cross-compile.patch
similarity index 100%
rename from package/beecrypt/beecrypt-0002-icu-check-cross-compile.patch
rename to package/beecrypt/0002-icu-check-cross-compile.patch
diff --git a/package/beecrypt/beecrypt-0003-build-system.patch b/package/beecrypt/0003-build-system.patch
similarity index 100%
rename from package/beecrypt/beecrypt-0003-build-system.patch
rename to package/beecrypt/0003-build-system.patch
diff --git a/package/beecrypt/beecrypt-0004-gcc-4.7.patch b/package/beecrypt/0004-gcc-4.7.patch
similarity index 100%
rename from package/beecrypt/beecrypt-0004-gcc-4.7.patch
rename to package/beecrypt/0004-gcc-4.7.patch
diff --git a/package/bellagio/bellagio-0.9.3-drop-werror.patch b/package/bellagio/0001-drop-werror.patch
similarity index 100%
rename from package/bellagio/bellagio-0.9.3-drop-werror.patch
rename to package/bellagio/0001-drop-werror.patch
diff --git a/package/bellagio/bellagio-0.9.3-dynamicloader-linking.patch b/package/bellagio/0002-dynamicloader-linking.patch
similarity index 100%
rename from package/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
rename to package/bellagio/0002-dynamicloader-linking.patch
diff --git a/package/bellagio/bellagio-0.9.3-parallel-build.patch b/package/bellagio/0003-parallel-build.patch
similarity index 100%
rename from package/bellagio/bellagio-0.9.3-parallel-build.patch
rename to package/bellagio/0003-parallel-build.patch
diff --git a/package/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch b/package/bellagio/0004-segfault-on-removeFromWaitResource.patch
similarity index 100%
rename from package/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
rename to package/bellagio/0004-segfault-on-removeFromWaitResource.patch
diff --git a/package/bind/bind-01-disable-tests.patch b/package/bind/0001-disable-tests.patch
similarity index 100%
rename from package/bind/bind-01-disable-tests.patch
rename to package/bind/0001-disable-tests.patch
diff --git a/package/bind/bind-02-cross.patch b/package/bind/0002-cross.patch
similarity index 100%
rename from package/bind/bind-02-cross.patch
rename to package/bind/0002-cross.patch
diff --git a/package/bison/bison-01-no-docs-regen.patch b/package/bison/0001-no-docs-regen.patch
similarity index 100%
rename from package/bison/bison-01-no-docs-regen.patch
rename to package/bison/0001-no-docs-regen.patch
diff --git a/package/blackbox/blackbox-001-Fix-configure-ac.patch b/package/blackbox/0001-Fix-configure-ac.patch
similarity index 100%
rename from package/blackbox/blackbox-001-Fix-configure-ac.patch
rename to package/blackbox/0001-Fix-configure-ac.patch
diff --git a/package/blackbox/blackbox-002-gcc43.patch b/package/blackbox/0002-gcc43.patch
similarity index 100%
rename from package/blackbox/blackbox-002-gcc43.patch
rename to package/blackbox/0002-gcc43.patch
diff --git a/package/blackbox/blackbox-003-gcc46-textpropertytostring.patch b/package/blackbox/0003-gcc46-textpropertytostring.patch
similarity index 100%
rename from package/blackbox/blackbox-003-gcc46-textpropertytostring.patch
rename to package/blackbox/0003-gcc46-textpropertytostring.patch
diff --git a/package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch b/package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch
similarity index 100%
rename from package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch
rename to package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch
diff --git a/package/boost/boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch b/package/boost/0001-fix-ambiguous-format-call-on-64bit-builds.patch
similarity index 100%
rename from package/boost/boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch
rename to package/boost/0001-fix-ambiguous-format-call-on-64bit-builds.patch
diff --git a/package/bridge-utils/bridge-utils-000-build-system.patch b/package/bridge-utils/0001-build-system.patch
similarity index 100%
rename from package/bridge-utils/bridge-utils-000-build-system.patch
rename to package/bridge-utils/0001-build-system.patch
diff --git a/package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch b/package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch
similarity index 100%
rename from package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
rename to package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch
diff --git a/package/busybox/busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
similarity index 100%
rename from package/busybox/busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
rename to package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
diff --git a/package/busybox/busybox-0002-busybox-1.22.1-ash.patch b/package/busybox/0002-busybox-1.22.1-ash.patch
similarity index 100%
rename from package/busybox/busybox-0002-busybox-1.22.1-ash.patch
rename to package/busybox/0002-busybox-1.22.1-ash.patch
diff --git a/package/busybox/busybox-0003-busybox-1.22.1-date.patch b/package/busybox/0003-busybox-1.22.1-date.patch
similarity index 100%
rename from package/busybox/busybox-0003-busybox-1.22.1-date.patch
rename to package/busybox/0003-busybox-1.22.1-date.patch
diff --git a/package/busybox/busybox-0004-busybox-1.22.1-iplink.patch b/package/busybox/0004-busybox-1.22.1-iplink.patch
similarity index 100%
rename from package/busybox/busybox-0004-busybox-1.22.1-iplink.patch
rename to package/busybox/0004-busybox-1.22.1-iplink.patch
diff --git a/package/busybox/busybox-0005-busybox-1.22.1-nc.patch b/package/busybox/0005-busybox-1.22.1-nc.patch
similarity index 100%
rename from package/busybox/busybox-0005-busybox-1.22.1-nc.patch
rename to package/busybox/0005-busybox-1.22.1-nc.patch
diff --git a/package/busybox/busybox-0006-lzop-add-overflow-check.patch b/package/busybox/0006-lzop-add-overflow-check.patch
similarity index 100%
rename from package/busybox/busybox-0006-lzop-add-overflow-check.patch
rename to package/busybox/0006-lzop-add-overflow-check.patch
diff --git a/package/bzip2/bzip2-build-objects-twice.patch b/package/bzip2/0001-build-objects-twice.patch
similarity index 100%
rename from package/bzip2/bzip2-build-objects-twice.patch
rename to package/bzip2/0001-build-objects-twice.patch
diff --git a/package/bzip2/bzip2-improve-build-system.patch b/package/bzip2/0002-improve-build-system.patch
similarity index 100%
rename from package/bzip2/bzip2-improve-build-system.patch
rename to package/bzip2/0002-improve-build-system.patch
diff --git a/package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch b/package/c-ares/0001-use_check_build_instead_of_check_user.patch
similarity index 100%
rename from package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch
rename to package/c-ares/0001-use_check_build_instead_of_check_user.patch
diff --git a/package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch b/package/cache-calibrator/0001-Fix-conflicting-round-function.patch
similarity index 100%
rename from package/cache-calibrator/cache-calibrator-Fix-conflicting-round-function.patch
rename to package/cache-calibrator/0001-Fix-conflicting-round-function.patch
diff --git a/package/cairo/cairo-001-blackfin-build-fix.patch b/package/cairo/0001-blackfin-build-fix.patch
similarity index 100%
rename from package/cairo/cairo-001-blackfin-build-fix.patch
rename to package/cairo/0001-blackfin-build-fix.patch
diff --git a/package/cairo/cairo-002-openvg-build-fix.patch b/package/cairo/0002-openvg-build-fix.patch
similarity index 100%
rename from package/cairo/cairo-002-openvg-build-fix.patch
rename to package/cairo/0002-openvg-build-fix.patch
diff --git a/package/cairo/cairo-003-fix-nofork-build.patch b/package/cairo/0003-fix-nofork-build.patch
similarity index 100%
rename from package/cairo/cairo-003-fix-nofork-build.patch
rename to package/cairo/0003-fix-nofork-build.patch
diff --git a/package/cairo/cairo-004-fix-nofork-any2ppm.patch b/package/cairo/0004-fix-nofork-any2ppm.patch
similarity index 100%
rename from package/cairo/cairo-004-fix-nofork-any2ppm.patch
rename to package/cairo/0004-fix-nofork-any2ppm.patch
diff --git a/package/cairo/cairo-005-fix-gcc-49-build.patch b/package/cairo/0005-fix-gcc-49-build.patch
similarity index 100%
rename from package/cairo/cairo-005-fix-gcc-49-build.patch
rename to package/cairo/0005-fix-gcc-49-build.patch
diff --git a/package/canfestival/canfestival-0001-install-pkgconfig-module-for-canfestival.patch b/package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
similarity index 100%
rename from package/canfestival/canfestival-0001-install-pkgconfig-module-for-canfestival.patch
rename to package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch
diff --git a/package/canfestival/canfestival-0002-allow-to-set-python-interpreter.patch b/package/canfestival/0002-allow-to-set-python-interpreter.patch
similarity index 100%
rename from package/canfestival/canfestival-0002-allow-to-set-python-interpreter.patch
rename to package/canfestival/0002-allow-to-set-python-interpreter.patch
diff --git a/package/cdrkit/cdrkit-1.1.11-no-rcmd.patch b/package/cdrkit/0001-no-rcmd.patch
similarity index 100%
rename from package/cdrkit/cdrkit-1.1.11-no-rcmd.patch
rename to package/cdrkit/0001-no-rcmd.patch
diff --git a/package/cegui06/cegui06-stddef.h.patch b/package/cegui06/0001-stddef.h.patch
similarity index 100%
rename from package/cegui06/cegui06-stddef.h.patch
rename to package/cegui06/0001-stddef.h.patch
diff --git a/package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch b/package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
similarity index 100%
rename from package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
rename to package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
diff --git a/package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch b/package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
similarity index 100%
rename from package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
rename to package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
diff --git a/package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch b/package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
similarity index 100%
rename from package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
rename to package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
diff --git a/package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch b/package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
similarity index 100%
rename from package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch
rename to package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
diff --git a/package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch b/package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
similarity index 100%
rename from package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch
rename to package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
diff --git a/package/classpath/classpath-01-fix-gmp-include.patch b/package/classpath/0001-fix-gmp-include.patch
similarity index 100%
rename from package/classpath/classpath-01-fix-gmp-include.patch
rename to package/classpath/0001-fix-gmp-include.patch
diff --git a/package/classpath/classpath-02-add-config-rpath.patch b/package/classpath/0002-add-config-rpath.patch
similarity index 100%
rename from package/classpath/classpath-02-add-config-rpath.patch
rename to package/classpath/0002-add-config-rpath.patch
diff --git a/package/cloog/cloog-0001-add-missing-files.patch b/package/cloog/0001-add-missing-files.patch
similarity index 100%
rename from package/cloog/cloog-0001-add-missing-files.patch
rename to package/cloog/0001-add-missing-files.patch
diff --git a/package/cloop/cloop-2.634-1-cflags.patch b/package/cloop/0001-cflags.patch
similarity index 100%
rename from package/cloop/cloop-2.634-1-cflags.patch
rename to package/cloop/0001-cflags.patch
diff --git a/package/connman/connman-000-uclibc-backtrace.patch b/package/connman/0001-uclibc-backtrace.patch
similarity index 100%
rename from package/connman/connman-000-uclibc-backtrace.patch
rename to package/connman/0001-uclibc-backtrace.patch
diff --git a/package/coreutils/coreutils-01-fix-for-dummy-man-usage.patch b/package/coreutils/0001-fix-for-dummy-man-usage.patch
similarity index 100%
rename from package/coreutils/coreutils-01-fix-for-dummy-man-usage.patch
rename to package/coreutils/0001-fix-for-dummy-man-usage.patch
diff --git a/package/cppdb/cppdb-0001-mysql-library-suffix.patch b/package/cppdb/0001-mysql-library-suffix.patch
similarity index 100%
rename from package/cppdb/cppdb-0001-mysql-library-suffix.patch
rename to package/cppdb/0001-mysql-library-suffix.patch
diff --git a/package/cramfs/cramfs-01-endian.patch b/package/cramfs/0001-endian.patch
similarity index 100%
rename from package/cramfs/cramfs-01-endian.patch
rename to package/cramfs/0001-endian.patch
diff --git a/package/cramfs/cramfs-02-cygwin_IO.patch b/package/cramfs/0002-cygwin_IO.patch
similarity index 100%
rename from package/cramfs/cramfs-02-cygwin_IO.patch
rename to package/cramfs/0002-cygwin_IO.patch
diff --git a/package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch b/package/crda/0001-Makefile-allow-to-override-python-interpreter.patch
similarity index 100%
rename from package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch
rename to package/crda/0001-Makefile-allow-to-override-python-interpreter.patch
diff --git a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch
similarity index 100%
rename from package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
rename to package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch
diff --git a/package/cryptodev-linux/cryptodev-linux-01-Replace_INIT_COMPLETION_with_reinit_completion.patch b/package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch
similarity index 100%
rename from package/cryptodev-linux/cryptodev-linux-01-Replace_INIT_COMPLETION_with_reinit_completion.patch
rename to package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch
diff --git a/package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch b/package/cryptsetup/0001-link-against-lrt-for-clock_gettime.patch
similarity index 100%
rename from package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
rename to package/cryptsetup/0001-link-against-lrt-for-clock_gettime.patch
diff --git a/package/cryptsetup/cryptsetup-0002-mkdir.patch b/package/cryptsetup/0002-mkdir.patch
similarity index 100%
rename from package/cryptsetup/cryptsetup-0002-mkdir.patch
rename to package/cryptsetup/0002-mkdir.patch
diff --git a/package/cups/cups-0001-fix-static.patch b/package/cups/0001-fix-static.patch
similarity index 100%
rename from package/cups/cups-0001-fix-static.patch
rename to package/cups/0001-fix-static.patch
diff --git a/package/cups/cups-0002-fix-stack-protector-check.patch b/package/cups/0002-fix-stack-protector-check.patch
similarity index 100%
rename from package/cups/cups-0002-fix-stack-protector-check.patch
rename to package/cups/0002-fix-stack-protector-check.patch
diff --git a/package/cups/cups-0003-mantohtml.patch b/package/cups/0003-mantohtml.patch
similarity index 100%
rename from package/cups/cups-0003-mantohtml.patch
rename to package/cups/0003-mantohtml.patch
diff --git a/package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch b/package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch
similarity index 100%
rename from package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch
rename to package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch
diff --git a/package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch b/package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch
similarity index 100%
rename from package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch
rename to package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch
diff --git a/package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch b/package/curlftpfs/0003-nocache-memleak-fix.patch
similarity index 100%
rename from package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch
rename to package/curlftpfs/0003-nocache-memleak-fix.patch
diff --git a/package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch b/package/cwiid/0001-fix-link-options-for-as-needed-90.patch
similarity index 100%
rename from package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch
rename to package/cwiid/0001-fix-link-options-for-as-needed-90.patch
diff --git a/package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch b/package/cwiid/0002-Update-for-BlueZ-changes.patch
similarity index 100%
rename from package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch
rename to package/cwiid/0002-Update-for-BlueZ-changes.patch
diff --git a/package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch b/package/cwiid/0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
similarity index 100%
rename from package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
rename to package/cwiid/0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
diff --git a/package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch b/package/cwiid/0004-configure-make-wmgui-build-optional.patch
similarity index 100%
rename from package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch
rename to package/cwiid/0004-configure-make-wmgui-build-optional.patch
diff --git a/package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch b/package/czmq/0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch
similarity index 100%
rename from package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch
rename to package/czmq/0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch
diff --git a/package/dash/dash-0001-no-config.h-for-helpers.patch b/package/dash/0001-no-config.h-for-helpers.patch
similarity index 100%
rename from package/dash/dash-0001-no-config.h-for-helpers.patch
rename to package/dash/0001-no-config.h-for-helpers.patch
diff --git a/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch b/package/dbus-cpp/0001-gcc4.7.patch
similarity index 100%
rename from package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
rename to package/dbus-cpp/0001-gcc4.7.patch
diff --git a/package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch b/package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch
similarity index 100%
rename from package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch
rename to package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch
diff --git a/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch b/package/dbus-python/0001-fix-python-configure-check.patch
similarity index 100%
rename from package/dbus-python/dbus-python-0001-fix-python-configure-check.patch
rename to package/dbus-python/0001-fix-python-configure-check.patch
diff --git a/package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch b/package/devmem2/0001-be-coherent-in-type-usage.patch
similarity index 100%
rename from package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch
rename to package/devmem2/0001-be-coherent-in-type-usage.patch
diff --git a/package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
similarity index 100%
rename from package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch
rename to package/dhcpdump/0001-use-non-bsd-structures.patch
diff --git a/package/dhcpdump/dhcpdump-0002-fix-strsep-feature-test.patch b/package/dhcpdump/0002-fix-strsep-feature-test.patch
similarity index 100%
rename from package/dhcpdump/dhcpdump-0002-fix-strsep-feature-test.patch
rename to package/dhcpdump/0002-fix-strsep-feature-test.patch
diff --git a/package/dhrystone/dhrystone-2-cmdline-nruns.patch b/package/dhrystone/0001-cmdline-nruns.patch
similarity index 100%
rename from package/dhrystone/dhrystone-2-cmdline-nruns.patch
rename to package/dhrystone/0001-cmdline-nruns.patch
diff --git a/package/dhrystone/dhrystone-2-HZ.patch b/package/dhrystone/0002-HZ.patch
similarity index 100%
rename from package/dhrystone/dhrystone-2-HZ.patch
rename to package/dhrystone/0002-HZ.patch
diff --git a/package/dhrystone/dhrystone-2-exit.patch b/package/dhrystone/0003-exit.patch
similarity index 100%
rename from package/dhrystone/dhrystone-2-exit.patch
rename to package/dhrystone/0003-exit.patch
diff --git a/package/dhrystone/dhrystone-2-headers.patch b/package/dhrystone/0004-headers.patch
similarity index 100%
rename from package/dhrystone/dhrystone-2-headers.patch
rename to package/dhrystone/0004-headers.patch
diff --git a/package/dhrystone/dhrystone-2-prototypes.patch b/package/dhrystone/0005-prototypes.patch
similarity index 100%
rename from package/dhrystone/dhrystone-2-prototypes.patch
rename to package/dhrystone/0005-prototypes.patch
diff --git a/package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch b/package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
similarity index 100%
rename from package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
rename to package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
diff --git a/package/directfb-examples/directfb-examples-remove-bzero.patch b/package/directfb-examples/0001-remove-bzero.patch
similarity index 100%
rename from package/directfb-examples/directfb-examples-remove-bzero.patch
rename to package/directfb-examples/0001-remove-bzero.patch
diff --git a/package/directfb/directfb-fix-missing-davinci-voodoo-header.patch b/package/directfb/0001-fix-missing-davinci-voodoo-header.patch
similarity index 100%
rename from package/directfb/directfb-fix-missing-davinci-voodoo-header.patch
rename to package/directfb/0001-fix-missing-davinci-voodoo-header.patch
diff --git a/package/directfb/directfb-imlib2-config.patch b/package/directfb/0002-imlib2-config.patch
similarity index 100%
rename from package/directfb/directfb-imlib2-config.patch
rename to package/directfb/0002-imlib2-config.patch
diff --git a/package/directfb/directfb-remove-redefinition-of-__typeof__.patch b/package/directfb/0003-remove-redefinition-of-__typeof__.patch
similarity index 100%
rename from package/directfb/directfb-remove-redefinition-of-__typeof__.patch
rename to package/directfb/0003-remove-redefinition-of-__typeof__.patch
diff --git a/package/directfb/directfb-setregion-lock.patch b/package/directfb/0004-setregion-lock.patch
similarity index 100%
rename from package/directfb/directfb-setregion-lock.patch
rename to package/directfb/0004-setregion-lock.patch
diff --git a/package/directfb/directfb-use-gcc-link.patch b/package/directfb/0005-use-gcc-link.patch
similarity index 100%
rename from package/directfb/directfb-use-gcc-link.patch
rename to package/directfb/0005-use-gcc-link.patch
diff --git a/package/dmalloc/dmalloc-5.4.3-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
similarity index 100%
rename from package/dmalloc/dmalloc-5.4.3-add-fpic.patch
rename to package/dmalloc/0001-add-fpic.patch
diff --git a/package/dmalloc/dmalloc-mips.patch b/package/dmalloc/0002-mips.patch
similarity index 100%
rename from package/dmalloc/dmalloc-mips.patch
rename to package/dmalloc/0002-mips.patch
diff --git a/package/dmidecode/dmidecode-build-system-fixes.patch b/package/dmidecode/0001-build-system-fixes.patch
similarity index 100%
rename from package/dmidecode/dmidecode-build-system-fixes.patch
rename to package/dmidecode/0001-build-system-fixes.patch
diff --git a/package/dropwatch/dropwatch-01-build.patch b/package/dropwatch/0001-build.patch
similarity index 100%
rename from package/dropwatch/dropwatch-01-build.patch
rename to package/dropwatch/0001-build.patch
diff --git a/package/dropwatch/dropwatch-02-binutils-2.23.1.patch b/package/dropwatch/0002-binutils-2.23.1.patch
similarity index 100%
rename from package/dropwatch/dropwatch-02-binutils-2.23.1.patch
rename to package/dropwatch/0002-binutils-2.23.1.patch
diff --git a/package/dropwatch/dropwatch-03-remove-werror.patch b/package/dropwatch/0003-remove-werror.patch
similarity index 100%
rename from package/dropwatch/dropwatch-03-remove-werror.patch
rename to package/dropwatch/0003-remove-werror.patch
diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/0001-extra_cflags.patch
similarity index 100%
rename from package/dtc/dtc-extra_cflags.patch
rename to package/dtc/0001-extra_cflags.patch
diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/0002-separate-lib-install.patch
similarity index 100%
rename from package/dtc/dtc-separate-lib-install.patch
rename to package/dtc/0002-separate-lib-install.patch
diff --git a/package/duma/duma-01-fix-cross-compilation.patch b/package/duma/0001-fix-cross-compilation.patch
similarity index 100%
rename from package/duma/duma-01-fix-cross-compilation.patch
rename to package/duma/0001-fix-cross-compilation.patch
diff --git a/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch b/package/dvb-apps/0001-Fix-generate-keynames.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
rename to package/dvb-apps/0001-Fix-generate-keynames.patch
diff --git a/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
rename to package/dvb-apps/0002-Fix-compiler-warning-flags.patch
diff --git a/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch b/package/dvb-apps/0003-support-static-only-build.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
rename to package/dvb-apps/0003-support-static-only-build.patch
diff --git a/package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch b/package/e2fsprogs/0001-sem-init-libs.patch
similarity index 100%
rename from package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
rename to package/e2fsprogs/0001-sem-init-libs.patch
diff --git a/package/elftosb/elftosb-fixes-includes.patch b/package/elftosb/0001-fixes-includes.patch
similarity index 100%
rename from package/elftosb/elftosb-fixes-includes.patch
rename to package/elftosb/0001-fixes-includes.patch
diff --git a/package/elftosb/elftosb-force-cxx-compiler.patch b/package/elftosb/0002-force-cxx-compiler.patch
similarity index 100%
rename from package/elftosb/elftosb-force-cxx-compiler.patch
rename to package/elftosb/0002-force-cxx-compiler.patch
diff --git a/package/elfutils/elfutils-01-disable-progs.patch b/package/elfutils/0001-disable-progs.patch
similarity index 100%
rename from package/elfutils/elfutils-01-disable-progs.patch
rename to package/elfutils/0001-disable-progs.patch
diff --git a/package/elfutils/elfutils-02-argp-support.patch b/package/elfutils/0002-argp-support.patch
similarity index 100%
rename from package/elfutils/elfutils-02-argp-support.patch
rename to package/elfutils/0002-argp-support.patch
diff --git a/package/elfutils/elfutils-03-memcpy-def.patch b/package/elfutils/0003-memcpy-def.patch
similarity index 100%
rename from package/elfutils/elfutils-03-memcpy-def.patch
rename to package/elfutils/0003-memcpy-def.patch
diff --git a/package/elfutils/elfutils-04-fts.patch b/package/elfutils/0004-fts.patch
similarity index 100%
rename from package/elfutils/elfutils-04-fts.patch
rename to package/elfutils/0004-fts.patch
diff --git a/package/elfutils/elfutils-05-disable-po.patch b/package/elfutils/0005-disable-po.patch
similarity index 100%
rename from package/elfutils/elfutils-05-disable-po.patch
rename to package/elfutils/0005-disable-po.patch
diff --git a/package/empty/empty-0001-respect-LDFLAGS.patch b/package/empty/0001-respect-LDFLAGS.patch
similarity index 100%
rename from package/empty/empty-0001-respect-LDFLAGS.patch
rename to package/empty/0001-respect-LDFLAGS.patch
diff --git a/package/erlang/erlang-build-fix.patch b/package/erlang/0001-build-fix.patch
similarity index 100%
rename from package/erlang/erlang-build-fix.patch
rename to package/erlang/0001-build-fix.patch
diff --git a/package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
similarity index 100%
rename from package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
rename to package/eudev/0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
diff --git a/package/evemu/evemu-0001-SYN_MAX.patch b/package/evemu/0001-SYN_MAX.patch
similarity index 100%
rename from package/evemu/evemu-0001-SYN_MAX.patch
rename to package/evemu/0001-SYN_MAX.patch
diff --git a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch b/package/evemu/0002-configure.ac-add-disable-tests-option.patch
similarity index 100%
rename from package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
rename to package/evemu/0002-configure.ac-add-disable-tests-option.patch
diff --git a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch b/package/evemu/0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
similarity index 100%
rename from package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
rename to package/evemu/0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
diff --git a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch b/package/evemu/0005-configure.ac-add-disable-python-bindings-option.patch
similarity index 100%
rename from package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
rename to package/evemu/0005-configure.ac-add-disable-python-bindings-option.patch
diff --git a/package/exim/exim-0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
similarity index 100%
rename from package/exim/exim-0001-Build-buildconfig-for-the-host.patch
rename to package/exim/0001-Build-buildconfig-for-the-host.patch
diff --git a/package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
similarity index 100%
rename from package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch
rename to package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
diff --git a/package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
similarity index 100%
rename from package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch
rename to package/exim/0003-Skip-version-check-and-symlink-installation.patch
diff --git a/package/expect/expect-0001-enable-cross-compilation.patch b/package/expect/0001-enable-cross-compilation.patch
similarity index 100%
rename from package/expect/expect-0001-enable-cross-compilation.patch
rename to package/expect/0001-enable-cross-compilation.patch
diff --git a/package/expect/expect-0002-allow-tcl-build-directory.patch b/package/expect/0002-allow-tcl-build-directory.patch
similarity index 100%
rename from package/expect/expect-0002-allow-tcl-build-directory.patch
rename to package/expect/0002-allow-tcl-build-directory.patch
diff --git a/package/ezxml/ezxml-0.8.6-allow-compiler-override.patch b/package/ezxml/0001-allow-compiler-override.patch
similarity index 100%
rename from package/ezxml/ezxml-0.8.6-allow-compiler-override.patch
rename to package/ezxml/0001-allow-compiler-override.patch
diff --git a/package/fb-test-app/fb-test-app-override-cflags.patch b/package/fb-test-app/0001-override-cflags.patch
similarity index 100%
rename from package/fb-test-app/fb-test-app-override-cflags.patch
rename to package/fb-test-app/0001-override-cflags.patch
diff --git a/package/fbgrab/fbgrab-01-fix-static-build.patch b/package/fbgrab/0001-fix-static-build.patch
similarity index 100%
rename from package/fbgrab/fbgrab-01-fix-static-build.patch
rename to package/fbgrab/0001-fix-static-build.patch
diff --git a/package/fbv/fbv-1.0b-arch.patch.avr32 b/package/fbv/0001-arch.patch.avr32
similarity index 100%
rename from package/fbv/fbv-1.0b-arch.patch.avr32
rename to package/fbv/0001-arch.patch.avr32
diff --git a/package/fbv/fbv-1.0b-cross.patch b/package/fbv/0002-cross.patch
similarity index 100%
rename from package/fbv/fbv-1.0b-cross.patch
rename to package/fbv/0002-cross.patch
diff --git a/package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch b/package/fbv/0003-fix-24bpp-support-on-big-endian.patch
similarity index 100%
rename from package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch
rename to package/fbv/0003-fix-24bpp-support-on-big-endian.patch
diff --git a/package/fbv/fbv-1.0b-fix-bgr555.patch b/package/fbv/0004-fix-bgr555.patch
similarity index 100%
rename from package/fbv/fbv-1.0b-fix-bgr555.patch
rename to package/fbv/0004-fix-bgr555.patch
diff --git a/package/fbv/fbv-1.0b-include.patch b/package/fbv/0005-include.patch
similarity index 100%
rename from package/fbv/fbv-1.0b-include.patch
rename to package/fbv/0005-include.patch
diff --git a/package/fbv/fbv-1.0b-libpng15.patch b/package/fbv/0006-libpng15.patch
similarity index 100%
rename from package/fbv/fbv-1.0b-libpng15.patch
rename to package/fbv/0006-libpng15.patch
diff --git a/package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch b/package/fetchmail/0001-fix-openssl-static-link.patch
similarity index 100%
rename from package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch
rename to package/fetchmail/0001-fix-openssl-static-link.patch
diff --git a/package/ffmpeg/ffmpeg-0001-fminf.patch b/package/ffmpeg/0001-fminf.patch
similarity index 100%
rename from package/ffmpeg/ffmpeg-0001-fminf.patch
rename to package/ffmpeg/0001-fminf.patch
diff --git a/package/fis/fis-001-checksum.patch b/package/fis/0001-checksum.patch
similarity index 100%
rename from package/fis/fis-001-checksum.patch
rename to package/fis/0001-checksum.patch
diff --git a/package/fis/fis-003-list_output.patch b/package/fis/0003-list_output.patch
similarity index 100%
rename from package/fis/fis-003-list_output.patch
rename to package/fis/0003-list_output.patch
diff --git a/package/fis/fis-004-sorted_list.patch b/package/fis/0004-sorted_list.patch
similarity index 100%
rename from package/fis/fis-004-sorted_list.patch
rename to package/fis/0004-sorted_list.patch
diff --git a/package/flac/flac-01-fix-altivec-logic.patch b/package/flac/0001-fix-altivec-logic.patch
similarity index 100%
rename from package/flac/flac-01-fix-altivec-logic.patch
rename to package/flac/0001-fix-altivec-logic.patch
diff --git a/package/flex/flex-prog-ar.patch b/package/flex/0001-prog-ar.patch
similarity index 100%
rename from package/flex/flex-prog-ar.patch
rename to package/flex/0001-prog-ar.patch
diff --git a/package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch b/package/flickcurl/0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
similarity index 100%
rename from package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
rename to package/flickcurl/0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
diff --git a/package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch b/package/flickcurl/0002-Oauth-services-are-on-https-www.flickr.com.patch
similarity index 100%
rename from package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch
rename to package/flickcurl/0002-Oauth-services-are-on-https-www.flickr.com.patch
diff --git a/package/flite/flite-0001-now-honor-DESTDIR-env.-var.patch b/package/flite/0001-now-honor-DESTDIR-env.-var.patch
similarity index 100%
rename from package/flite/flite-0001-now-honor-DESTDIR-env.-var.patch
rename to package/flite/0001-now-honor-DESTDIR-env.-var.patch
diff --git a/package/flite/flite-0002-fix-alsa-static.patch b/package/flite/0002-fix-alsa-static.patch
similarity index 100%
rename from package/flite/flite-0002-fix-alsa-static.patch
rename to package/flite/0002-fix-alsa-static.patch
diff --git a/package/fltk/fltk-01-disable-tests.patch b/package/fltk/0001-disable-tests.patch
similarity index 100%
rename from package/fltk/fltk-01-disable-tests.patch
rename to package/fltk/0001-disable-tests.patch
diff --git a/package/fltk/fltk-02-jpeg-9.patch b/package/fltk/0002-jpeg-9.patch
similarity index 100%
rename from package/fltk/fltk-02-jpeg-9.patch
rename to package/fltk/0002-jpeg-9.patch
diff --git a/package/freerdp/freerdp-0001-add-support-for-uclibc.patch b/package/freerdp/0001-add-support-for-uclibc.patch
similarity index 100%
rename from package/freerdp/freerdp-0001-add-support-for-uclibc.patch
rename to package/freerdp/0001-add-support-for-uclibc.patch
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch b/package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
similarity index 100%
rename from package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
rename to package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch b/package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
similarity index 100%
rename from package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
rename to package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch b/package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
similarity index 100%
rename from package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
rename to package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
diff --git a/package/ftop/ftop-0001-overflow.patch b/package/ftop/0001-overflow.patch
similarity index 100%
rename from package/ftop/ftop-0001-overflow.patch
rename to package/ftop/0001-overflow.patch
diff --git a/package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch b/package/gadgetfs-test/0001-fix-usb-ch9-include.patch
similarity index 100%
rename from package/gadgetfs-test/gadgetfs-test-fix-usb-ch9-include.patch
rename to package/gadgetfs-test/0001-fix-usb-ch9-include.patch
diff --git a/package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch b/package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch
similarity index 100%
rename from package/gadgetfs-test/gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch
rename to package/gadgetfs-test/0002-rename-include-usb_gadgetfs-to-usb-dir.patch
diff --git a/package/gamin/gamin-0.1.10-no-abstract-sockets.patch b/package/gamin/0001-no-abstract-sockets.patch
similarity index 100%
rename from package/gamin/gamin-0.1.10-no-abstract-sockets.patch
rename to package/gamin/0001-no-abstract-sockets.patch
diff --git a/package/gamin/gamin-0.1.10-no-const-return.patch b/package/gamin/0002-no-const-return.patch
similarity index 100%
rename from package/gamin/gamin-0.1.10-no-const-return.patch
rename to package/gamin/0002-no-const-return.patch
diff --git a/package/gawk/gawk-01-no-versioned.patch b/package/gawk/0001-no-versioned.patch
similarity index 100%
rename from package/gawk/gawk-01-no-versioned.patch
rename to package/gawk/0001-no-versioned.patch
diff --git a/package/gcc/4.4.7/gcc-44-pr39429.patch b/package/gcc/4.4.7/0044-pr39429.patch
similarity index 100%
rename from package/gcc/4.4.7/gcc-44-pr39429.patch
rename to package/gcc/4.4.7/0044-pr39429.patch
diff --git a/package/gd/gd-01-gdlib-config.patch b/package/gd/0001-gdlib-config.patch
similarity index 100%
rename from package/gd/gd-01-gdlib-config.patch
rename to package/gd/0001-gdlib-config.patch
diff --git a/package/gd/gd-02-no-zlib.patch b/package/gd/0002-no-zlib.patch
similarity index 100%
rename from package/gd/gd-02-no-zlib.patch
rename to package/gd/0002-no-zlib.patch
diff --git a/package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch b/package/gd/0003-gd_bmp-fix-build-with-uClibc.patch
similarity index 100%
rename from package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch
rename to package/gd/0003-gd_bmp-fix-build-with-uClibc.patch
diff --git a/package/gd/gd-04-CVE-2014-2497.patch b/package/gd/0004-CVE-2014-2497.patch
similarity index 100%
rename from package/gd/gd-04-CVE-2014-2497.patch
rename to package/gd/0004-CVE-2014-2497.patch
diff --git a/package/genext2fs/genext2fs-update-genext2fs.c-to-rev-1.118.patch b/package/genext2fs/0001-update-genext2fs.c-to-rev-1.118.patch
similarity index 100%
rename from package/genext2fs/genext2fs-update-genext2fs.c-to-rev-1.118.patch
rename to package/genext2fs/0001-update-genext2fs.c-to-rev-1.118.patch
diff --git a/package/genpart/genpart-fix-return-code.patch b/package/genpart/0001-fix-return-code.patch
similarity index 100%
rename from package/genpart/genpart-fix-return-code.patch
rename to package/genpart/0001-fix-return-code.patch
diff --git a/package/genromfs/genromfs-0.5.2-build-system.patch b/package/genromfs/0001-build-system.patch
similarity index 100%
rename from package/genromfs/genromfs-0.5.2-build-system.patch
rename to package/genromfs/0001-build-system.patch
diff --git a/package/gettext/gettext-01-error_print_progname.patch b/package/gettext/0001-error_print_progname.patch
similarity index 100%
rename from package/gettext/gettext-01-error_print_progname.patch
rename to package/gettext/0001-error_print_progname.patch
diff --git a/package/giblib/giblib-fix-imlib2-detection.patch b/package/giblib/0001-fix-imlib2-detection.patch
similarity index 100%
rename from package/giblib/giblib-fix-imlib2-detection.patch
rename to package/giblib/0001-fix-imlib2-detection.patch
diff --git a/package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch b/package/glibc/2.18-svnr23787/0001-accept-make4.patch
similarity index 100%
rename from package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch
rename to package/glibc/2.18-svnr23787/0001-accept-make4.patch
diff --git a/package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch b/package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch
similarity index 100%
rename from package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch
rename to package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch
diff --git a/package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch b/package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch
similarity index 100%
rename from package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch
rename to package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch
diff --git a/package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch b/package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch
similarity index 100%
rename from package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
rename to package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch
diff --git a/package/gnu-efi/gnu-efi-01-use-override-cflags.patch b/package/gnu-efi/0001-use-override-cflags.patch
similarity index 100%
rename from package/gnu-efi/gnu-efi-01-use-override-cflags.patch
rename to package/gnu-efi/0001-use-override-cflags.patch
diff --git a/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch b/package/gnu-efi/0002-parallel-make-archives.patch
similarity index 100%
rename from package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
rename to package/gnu-efi/0002-parallel-make-archives.patch
diff --git a/package/gnu-efi/gnu-efi-03-parallel-make.patch b/package/gnu-efi/0003-parallel-make.patch
similarity index 100%
rename from package/gnu-efi/gnu-efi-03-parallel-make.patch
rename to package/gnu-efi/0003-parallel-make.patch
diff --git a/package/gnuchess/gnuchess-5.07-getline-conflicts.patch b/package/gnuchess/0001-getline-conflicts.patch
similarity index 100%
rename from package/gnuchess/gnuchess-5.07-getline-conflicts.patch
rename to package/gnuchess/0001-getline-conflicts.patch
diff --git a/package/gnuchess/gnuchess-5.07.patch b/package/gnuchess/0002-misc-fixes.patch
similarity index 100%
rename from package/gnuchess/gnuchess-5.07.patch
rename to package/gnuchess/0002-misc-fixes.patch
diff --git a/package/gnupg2/gnupg2-0001-fix-pth-config-usage.patch b/package/gnupg2/0001-fix-pth-config-usage.patch
similarity index 100%
rename from package/gnupg2/gnupg2-0001-fix-pth-config-usage.patch
rename to package/gnupg2/0001-fix-pth-config-usage.patch
diff --git a/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
similarity index 100%
rename from package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
rename to package/gnuplot/0001-configure-add-without-demo-option.patch
diff --git a/package/gnuplot/gnuplot-0002-use-gdlib-config-properly.patch b/package/gnuplot/0002-use-gdlib-config-properly.patch
similarity index 100%
rename from package/gnuplot/gnuplot-0002-use-gdlib-config-properly.patch
rename to package/gnuplot/0002-use-gdlib-config-properly.patch
diff --git a/package/gob2/gob2-01-dont-include-from-prefix.patch b/package/gob2/0001-dont-include-from-prefix.patch
similarity index 100%
rename from package/gob2/gob2-01-dont-include-from-prefix.patch
rename to package/gob2/0001-dont-include-from-prefix.patch
diff --git a/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch b/package/gpsd/0001-Fix-build-error-when-ntpshm-is-false.patch
similarity index 100%
rename from package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
rename to package/gpsd/0001-Fix-build-error-when-ntpshm-is-false.patch
diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/0002-sconstruct-disable-rpath.patch
similarity index 100%
rename from package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
rename to package/gpsd/0002-sconstruct-disable-rpath.patch
diff --git a/package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch b/package/gpsd/0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
similarity index 100%
rename from package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
rename to package/gpsd/0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
diff --git a/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch b/package/gptfdisk/0001-configurable-utf16-support.patch
similarity index 100%
rename from package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
rename to package/gptfdisk/0001-configurable-utf16-support.patch
diff --git a/package/gqview/gqview-2.1.5-make.patch b/package/gqview/0001-make.patch
similarity index 100%
rename from package/gqview/gqview-2.1.5-make.patch
rename to package/gqview/0001-make.patch
diff --git a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch b/package/grantlee/0001-fix-lphread-link-error.patch
similarity index 100%
rename from package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
rename to package/grantlee/0001-fix-lphread-link-error.patch
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0001-gcc47.patch b/package/gstreamer/gst-ffmpeg/0001-gcc47.patch
similarity index 100%
rename from package/gstreamer/gst-ffmpeg/gst-ffmpeg-0001-gcc47.patch
rename to package/gstreamer/gst-ffmpeg/0001-gcc47.patch
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch b/package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
similarity index 100%
rename from package/gstreamer/gst-ffmpeg/gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch
rename to package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch b/package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
similarity index 100%
rename from package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
rename to package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch b/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
similarity index 100%
rename from package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
rename to package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch b/package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
similarity index 100%
rename from package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
rename to package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch b/package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
similarity index 100%
rename from package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
rename to package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch b/package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
similarity index 100%
rename from package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
rename to package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch b/package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
similarity index 100%
rename from package/gstreamer/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
rename to package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch b/package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
similarity index 100%
rename from package/gstreamer/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
rename to package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch b/package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
similarity index 100%
rename from package/gstreamer/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
rename to package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base-tremor.patch b/package/gstreamer/gst-plugins-base/0001-tremor.patch
similarity index 100%
rename from package/gstreamer/gst-plugins-base/gst-plugins-base-tremor.patch
rename to package/gstreamer/gst-plugins-base/0001-tremor.patch
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good-linux36.patch b/package/gstreamer/gst-plugins-good/0001-linux36.patch
similarity index 100%
rename from package/gstreamer/gst-plugins-good/gst-plugins-good-linux36.patch
rename to package/gstreamer/gst-plugins-good/0001-linux36.patch
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch b/package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
similarity index 100%
rename from package/gstreamer/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
rename to package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
diff --git a/package/gstreamer/gstreamer/gstreamer-01-bison3.patch b/package/gstreamer/gstreamer/0001-bison3.patch
similarity index 100%
rename from package/gstreamer/gstreamer/gstreamer-01-bison3.patch
rename to package/gstreamer/gstreamer/0001-bison3.patch
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch b/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
similarity index 100%
rename from package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
rename to package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
diff --git a/package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch b/package/gutenprint/0001-use-pregen-xmli18n-header.patch
similarity index 100%
rename from package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch
rename to package/gutenprint/0001-use-pregen-xmli18n-header.patch
diff --git a/package/gutenprint/gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch b/package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch
similarity index 100%
rename from package/gutenprint/gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch
rename to package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch
diff --git a/package/haserl/0.8.0/haserl-0.8.0-legacy.patch b/package/haserl/0.8.0/0001-legacy.patch
similarity index 100%
rename from package/haserl/0.8.0/haserl-0.8.0-legacy.patch
rename to package/haserl/0.8.0/0001-legacy.patch
diff --git a/package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch b/package/haserl/0.9.33/0001-add-haserl_lualib.inc.patch
similarity index 100%
rename from package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch
rename to package/haserl/0.9.33/0001-add-haserl_lualib.inc.patch
diff --git a/package/heimdal/heimdal-0001-add-roken-h-process.patch b/package/heimdal/0001-add-roken-h-process.patch
similarity index 100%
rename from package/heimdal/heimdal-0001-add-roken-h-process.patch
rename to package/heimdal/0001-add-roken-h-process.patch
diff --git a/package/heimdal/heimdal-0002-use-Getopt-Std.patch b/package/heimdal/0002-use-Getopt-Std.patch
similarity index 100%
rename from package/heimdal/heimdal-0002-use-Getopt-Std.patch
rename to package/heimdal/0002-use-Getopt-Std.patch
diff --git a/package/heimdal/heimdal-0003-vendor.patch b/package/heimdal/0003-vendor.patch
similarity index 100%
rename from package/heimdal/heimdal-0003-vendor.patch
rename to package/heimdal/0003-vendor.patch
diff --git a/package/heimdal/heimdal-0004-compile_et.patch b/package/heimdal/0004-compile_et.patch
similarity index 100%
rename from package/heimdal/heimdal-0004-compile_et.patch
rename to package/heimdal/0004-compile_et.patch
diff --git a/package/hplip/hplip-fix-make.patch b/package/hplip/0001-fix-make.patch
similarity index 100%
rename from package/hplip/hplip-fix-make.patch
rename to package/hplip/0001-fix-make.patch
diff --git a/package/htop/htop-01-native-affinity.patch b/package/htop/0001-native-affinity.patch
similarity index 100%
rename from package/htop/htop-01-native-affinity.patch
rename to package/htop/0001-native-affinity.patch
diff --git a/package/httping/httping-0001-fix-math-library-linking.patch b/package/httping/0001-fix-math-library-linking.patch
similarity index 100%
rename from package/httping/httping-0001-fix-math-library-linking.patch
rename to package/httping/0001-fix-math-library-linking.patch
diff --git a/package/icu/icu-001-dont-build-static-dynamic-twice.patch b/package/icu/0001-dont-build-static-dynamic-twice.patch
similarity index 100%
rename from package/icu/icu-001-dont-build-static-dynamic-twice.patch
rename to package/icu/0001-dont-build-static-dynamic-twice.patch
diff --git a/package/icu/icu-002-workaround-toolchain-bugs.patch b/package/icu/0002-workaround-toolchain-bugs.patch
similarity index 100%
rename from package/icu/icu-002-workaround-toolchain-bugs.patch
rename to package/icu/0002-workaround-toolchain-bugs.patch
diff --git a/package/icu/icu-003-detect-compiler-symbol-prefix.patch b/package/icu/0003-detect-compiler-symbol-prefix.patch
similarity index 100%
rename from package/icu/icu-003-detect-compiler-symbol-prefix.patch
rename to package/icu/0003-detect-compiler-symbol-prefix.patch
diff --git a/package/icu/icu-004-link-icudata-as-data-only.patch b/package/icu/0004-link-icudata-as-data-only.patch
similarity index 100%
rename from package/icu/icu-004-link-icudata-as-data-only.patch
rename to package/icu/0004-link-icudata-as-data-only.patch
diff --git a/package/ifplugd/ifplugd-cross.patch b/package/ifplugd/0001-cross.patch
similarity index 100%
rename from package/ifplugd/ifplugd-cross.patch
rename to package/ifplugd/0001-cross.patch
diff --git a/package/ifplugd/ifplugd-fix-headers.patch b/package/ifplugd/0002-fix-headers.patch
similarity index 100%
rename from package/ifplugd/ifplugd-fix-headers.patch
rename to package/ifplugd/0002-fix-headers.patch
diff --git a/package/ifplugd/ifplugd-no-cxx.patch b/package/ifplugd/0003-no-cxx.patch
similarity index 100%
rename from package/ifplugd/ifplugd-no-cxx.patch
rename to package/ifplugd/0003-no-cxx.patch
diff --git a/package/igmpproxy/igmpproxy-01-uclinux.patch b/package/igmpproxy/0001-uclinux.patch
similarity index 100%
rename from package/igmpproxy/igmpproxy-01-uclinux.patch
rename to package/igmpproxy/0001-uclinux.patch
diff --git a/package/imagemagick/imagemagick-01-use-xml2-config.patch b/package/imagemagick/0001-use-xml2-config.patch
similarity index 100%
rename from package/imagemagick/imagemagick-01-use-xml2-config.patch
rename to package/imagemagick/0001-use-xml2-config.patch
diff --git a/package/infozip/infozip-0001-configure-fix-cross-build.patch b/package/infozip/0001-configure-fix-cross-build.patch
similarity index 100%
rename from package/infozip/infozip-0001-configure-fix-cross-build.patch
rename to package/infozip/0001-configure-fix-cross-build.patch
diff --git a/package/input-tools/input-tools-20051019-rint.patch b/package/input-tools/0001-rint.patch
similarity index 100%
rename from package/input-tools/input-tools-20051019-rint.patch
rename to package/input-tools/0001-rint.patch
diff --git a/package/iostat/iostat-cpunum.patch b/package/iostat/0001-cpunum.patch
similarity index 100%
rename from package/iostat/iostat-cpunum.patch
rename to package/iostat/0001-cpunum.patch
diff --git a/package/iozone/iozone-01-targets.patch b/package/iozone/0001-targets.patch
similarity index 100%
rename from package/iozone/iozone-01-targets.patch
rename to package/iozone/0001-targets.patch
diff --git a/package/iozone/iozone-02-no-nptl-support.patch b/package/iozone/0002-no-nptl-support.patch
similarity index 100%
rename from package/iozone/iozone-02-no-nptl-support.patch
rename to package/iozone/0002-no-nptl-support.patch
diff --git a/package/iproute2/iproute2-01-optional-ipv6.patch b/package/iproute2/0001-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-01-optional-ipv6.patch
rename to package/iproute2/0001-optional-ipv6.patch
diff --git a/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch b/package/iproute2/0002-vxlan-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
rename to package/iproute2/0002-vxlan-optional-ipv6.patch
diff --git a/package/iprutils/iprutils-0001-Don-t-use-gettext.patch b/package/iprutils/0001-Don-t-use-gettext.patch
similarity index 100%
rename from package/iprutils/iprutils-0001-Don-t-use-gettext.patch
rename to package/iprutils/0001-Don-t-use-gettext.patch
diff --git a/package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch b/package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
similarity index 100%
rename from package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
rename to package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
diff --git a/package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch b/package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
similarity index 100%
rename from package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch
rename to package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
diff --git a/package/ipsec-tools/ipsec-tools-001-susv3-legacy.patch b/package/ipsec-tools/0001-susv3-legacy.patch
similarity index 100%
rename from package/ipsec-tools/ipsec-tools-001-susv3-legacy.patch
rename to package/ipsec-tools/0001-susv3-legacy.patch
diff --git a/package/iptables/iptables-01-fix-static-link.patch b/package/iptables/0001-fix-static-link.patch
similarity index 100%
rename from package/iptables/iptables-01-fix-static-link.patch
rename to package/iptables/0001-fix-static-link.patch
diff --git a/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch b/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
similarity index 100%
rename from package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
rename to package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
diff --git a/package/irda-utils/irda-utils-0.9.18-daemon.patch b/package/irda-utils/0001-daemon.patch
similarity index 100%
rename from package/irda-utils/irda-utils-0.9.18-daemon.patch
rename to package/irda-utils/0001-daemon.patch
diff --git a/package/irda-utils/irda-utils-0.9.18-nommu.patch b/package/irda-utils/0002-nommu.patch
similarity index 100%
rename from package/irda-utils/irda-utils-0.9.18-nommu.patch
rename to package/irda-utils/0002-nommu.patch
diff --git a/package/irda-utils/irda-utils-0.9.18-subdir.patch b/package/irda-utils/0003-subdir.patch
similarity index 100%
rename from package/irda-utils/irda-utils-0.9.18-subdir.patch
rename to package/irda-utils/0003-subdir.patch
diff --git a/package/jhead/jhead-use-ldflags.patch b/package/jhead/0001-use-ldflags.patch
similarity index 100%
rename from package/jhead/jhead-use-ldflags.patch
rename to package/jhead/0001-use-ldflags.patch
diff --git a/package/joe/joe-0001-disable-bessel-functions-on-uclibc.patch b/package/joe/0001-disable-bessel-functions-on-uclibc.patch
similarity index 100%
rename from package/joe/joe-0001-disable-bessel-functions-on-uclibc.patch
rename to package/joe/0001-disable-bessel-functions-on-uclibc.patch
diff --git a/package/jq/jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch b/package/jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch
similarity index 100%
rename from package/jq/jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch
rename to package/jq/0001-libm.h-comment-j0-j1-y0-and-y1.patch
diff --git a/package/json-c/json-c-no-reentrant.patch b/package/json-c/0001-no-reentrant.patch
similarity index 100%
rename from package/json-c/json-c-no-reentrant.patch
rename to package/json-c/0001-no-reentrant.patch
diff --git a/package/kbd/kbd-link-against-libintl.patch b/package/kbd/0001-link-against-libintl.patch
similarity index 100%
rename from package/kbd/kbd-link-against-libintl.patch
rename to package/kbd/0001-link-against-libintl.patch
diff --git a/package/kexec-lite/kexec-lite-01-clean-restart.patch b/package/kexec-lite/0001-clean-restart.patch
similarity index 100%
rename from package/kexec-lite/kexec-lite-01-clean-restart.patch
rename to package/kexec-lite/0001-clean-restart.patch
diff --git a/package/kexec/kexec-0001-largefile.patch b/package/kexec/0001-largefile.patch
similarity index 100%
rename from package/kexec/kexec-0001-largefile.patch
rename to package/kexec/0001-largefile.patch
diff --git a/package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch b/package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch
similarity index 100%
rename from package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch
rename to package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch
diff --git a/package/keyutils/keyutils-02-fix-install-rule.patch b/package/keyutils/0002-fix-install-rule.patch
similarity index 100%
rename from package/keyutils/keyutils-02-fix-install-rule.patch
rename to package/keyutils/0002-fix-install-rule.patch
diff --git a/package/keyutils/keyutils-03-cifs.patch b/package/keyutils/0003-cifs.patch
similarity index 100%
rename from package/keyutils/keyutils-03-cifs.patch
rename to package/keyutils/0003-cifs.patch
diff --git a/package/keyutils/keyutils-04-Makefile-for-buildroot.patch b/package/keyutils/0004-Makefile-for-buildroot.patch
similarity index 100%
rename from package/keyutils/keyutils-04-Makefile-for-buildroot.patch
rename to package/keyutils/0004-Makefile-for-buildroot.patch
diff --git a/package/kismet/kismet-ncurses.patch b/package/kismet/0001-ncurses.patch
similarity index 100%
rename from package/kismet/kismet-ncurses.patch
rename to package/kismet/0001-ncurses.patch
diff --git a/package/kismet/kismet-nobsd.patch b/package/kismet/0002-nobsd.patch
similarity index 100%
rename from package/kismet/kismet-nobsd.patch
rename to package/kismet/0002-nobsd.patch
diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
similarity index 100%
rename from package/kmod/kmod-0001-fix-O_CLOEXEC.patch
rename to package/kmod/0001-fix-O_CLOEXEC.patch
diff --git a/package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch b/package/kmod/0002-add-backup-implementation-of-be32toh.patch
similarity index 100%
rename from package/kmod/kmod-0002-add-backup-implementation-of-be32toh.patch
rename to package/kmod/0002-add-backup-implementation-of-be32toh.patch
diff --git a/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch b/package/kobs-ng/0001-fix-mtd-defines.patch
similarity index 100%
rename from package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
rename to package/kobs-ng/0001-fix-mtd-defines.patch
diff --git a/package/latencytop/latencytop-makefile.patch b/package/latencytop/0001-makefile.patch
similarity index 100%
rename from package/latencytop/latencytop-makefile.patch
rename to package/latencytop/0001-makefile.patch
diff --git a/package/lcdapi/lcdapi-0001-Remove-installation-of-docs-examples.patch b/package/lcdapi/0001-Remove-installation-of-docs-examples.patch
similarity index 100%
rename from package/lcdapi/lcdapi-0001-Remove-installation-of-docs-examples.patch
rename to package/lcdapi/0001-Remove-installation-of-docs-examples.patch
diff --git a/package/lcdproc/lcdproc-LCDd.conf.patch b/package/lcdproc/0001-LCDd.conf.patch
similarity index 100%
rename from package/lcdproc/lcdproc-LCDd.conf.patch
rename to package/lcdproc/0001-LCDd.conf.patch
diff --git a/package/leafnode2/leafnode2-0001-cross_makefile.patch b/package/leafnode2/0001-cross_makefile.patch
similarity index 100%
rename from package/leafnode2/leafnode2-0001-cross_makefile.patch
rename to package/leafnode2/0001-cross_makefile.patch
diff --git a/package/libaio/libaio-0.3.109-arches.patch b/package/libaio/0001-arches.patch
similarity index 100%
rename from package/libaio/libaio-0.3.109-arches.patch
rename to package/libaio/0001-arches.patch
diff --git a/package/libaio/libaio-0.3.109-avr32-support.patch b/package/libaio/0002-avr32-support.patch
similarity index 100%
rename from package/libaio/libaio-0.3.109-avr32-support.patch
rename to package/libaio/0002-avr32-support.patch
diff --git a/package/libaio/libaio-0.3.109-destdir.patch b/package/libaio/0003-destdir.patch
similarity index 100%
rename from package/libaio/libaio-0.3.109-destdir.patch
rename to package/libaio/0003-destdir.patch
diff --git a/package/libart/libart-art-config-cross.patch b/package/libart/0001-art-config-cross.patch
similarity index 100%
rename from package/libart/libart-art-config-cross.patch
rename to package/libart/0001-art-config-cross.patch
diff --git a/package/libatasmart/libatasmart-strpool-cross-flags.patch b/package/libatasmart/0001-strpool-cross-flags.patch
similarity index 100%
rename from package/libatasmart/libatasmart-strpool-cross-flags.patch
rename to package/libatasmart/0001-strpool-cross-flags.patch
diff --git a/package/libcap/libcap-01-build-system.patch b/package/libcap/0001-build-system.patch
similarity index 100%
rename from package/libcap/libcap-01-build-system.patch
rename to package/libcap/0001-build-system.patch
diff --git a/package/libcap/libcap-02-split-static-shared-install.patch b/package/libcap/0002-split-static-shared-install.patch
similarity index 100%
rename from package/libcap/libcap-02-split-static-shared-install.patch
rename to package/libcap/0002-split-static-shared-install.patch
diff --git a/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch b/package/libcec/0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
similarity index 100%
rename from package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
rename to package/libcec/0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
diff --git a/package/libcec/libcec-0002-no-psabi-warning.patch b/package/libcec/0002-no-psabi-warning.patch
similarity index 100%
rename from package/libcec/libcec-0002-no-psabi-warning.patch
rename to package/libcec/0002-no-psabi-warning.patch
diff --git a/package/libcgi/libcgi.patch b/package/libcgi/0001-misc-fixes.patch
similarity index 100%
rename from package/libcgi/libcgi.patch
rename to package/libcgi/0001-misc-fixes.patch
diff --git a/package/libcgicc/libcgicc-01-disable-documentation-option.patch b/package/libcgicc/0001-disable-documentation-option.patch
similarity index 100%
rename from package/libcgicc/libcgicc-01-disable-documentation-option.patch
rename to package/libcgicc/0001-disable-documentation-option.patch
diff --git a/package/libconfuse/libconfuse-0000-fix-configure-ac.patch b/package/libconfuse/0001-fix-configure-ac.patch
similarity index 100%
rename from package/libconfuse/libconfuse-0000-fix-configure-ac.patch
rename to package/libconfuse/0001-fix-configure-ac.patch
diff --git a/package/libcue/libcue-1.4.0-__unused-fix.patch b/package/libcue/0001-_unused-fix.patch
similarity index 100%
rename from package/libcue/libcue-1.4.0-__unused-fix.patch
rename to package/libcue/0001-_unused-fix.patch
diff --git a/package/libcuefile/libcuefile-0001-fix-static-link.patch b/package/libcuefile/0001-fix-static-link.patch
similarity index 100%
rename from package/libcuefile/libcuefile-0001-fix-static-link.patch
rename to package/libcuefile/0001-fix-static-link.patch
diff --git a/package/libcurl/libcurl-0001-fixtimeout.patch b/package/libcurl/0001-fixtimeout.patch
similarity index 100%
rename from package/libcurl/libcurl-0001-fixtimeout.patch
rename to package/libcurl/0001-fixtimeout.patch
diff --git a/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch b/package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
similarity index 100%
rename from package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
rename to package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
diff --git a/package/libdnet/libdnet-001-python-gcc.patch b/package/libdnet/0001-python-gcc.patch
similarity index 100%
rename from package/libdnet/libdnet-001-python-gcc.patch
rename to package/libdnet/0001-python-gcc.patch
diff --git a/package/libdnet/libdnet-002-python-makefile.patch b/package/libdnet/0002-python-makefile.patch
similarity index 100%
rename from package/libdnet/libdnet-002-python-makefile.patch
rename to package/libdnet/0002-python-makefile.patch
diff --git a/package/libdvdnav/libdvdnav-01-fix-os2-support.patch b/package/libdvdnav/0001-fix-os2-support.patch
similarity index 100%
rename from package/libdvdnav/libdvdnav-01-fix-os2-support.patch
rename to package/libdvdnav/0001-fix-os2-support.patch
diff --git a/package/libdvdread/libdvdread-01-fix-os2-support.patch b/package/libdvdread/0001-fix-os2-support.patch
similarity index 100%
rename from package/libdvdread/libdvdread-01-fix-os2-support.patch
rename to package/libdvdread/0001-fix-os2-support.patch
diff --git a/package/libeXosip2/libeXosip2-0000-fix-non-ipv6-build.patch b/package/libeXosip2/0001-fix-non-ipv6-build.patch
similarity index 100%
rename from package/libeXosip2/libeXosip2-0000-fix-non-ipv6-build.patch
rename to package/libeXosip2/0001-fix-non-ipv6-build.patch
diff --git a/package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch b/package/libeXosip2/0002-use-pkg-config-to-detect-openssl.patch
similarity index 100%
rename from package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch
rename to package/libeXosip2/0002-use-pkg-config-to-detect-openssl.patch
diff --git a/package/libedit/libedit-000-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
similarity index 100%
rename from package/libedit/libedit-000-check-bsd-functions-in-libbsd.patch
rename to package/libedit/0001-check-bsd-functions-in-libbsd.patch
diff --git a/package/libenca/libenca-001-fix-installation-error.patch b/package/libenca/0001-fix-installation-error.patch
similarity index 100%
rename from package/libenca/libenca-001-fix-installation-error.patch
rename to package/libenca/0001-fix-installation-error.patch
diff --git a/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch b/package/libenca/0002-remove-prefix-hack-in-configure.patch
similarity index 100%
rename from package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
rename to package/libenca/0002-remove-prefix-hack-in-configure.patch
diff --git a/package/libenca/libenca-003-iconv.patch b/package/libenca/0003-iconv.patch
similarity index 100%
rename from package/libenca/libenca-003-iconv.patch
rename to package/libenca/0003-iconv.patch
diff --git a/package/libfcgi/libfcgi-0000-eof.patch b/package/libfcgi/0001-eof.patch
similarity index 100%
rename from package/libfcgi/libfcgi-0000-eof.patch
rename to package/libfcgi/0001-eof.patch
diff --git a/package/libfcgi/libfcgi-0001-link-against-libfcgi-la.patch b/package/libfcgi/0002-link-against-libfcgi-la.patch
similarity index 100%
rename from package/libfcgi/libfcgi-0001-link-against-libfcgi-la.patch
rename to package/libfcgi/0002-link-against-libfcgi-la.patch
diff --git a/package/libfcgi/libfcgi-0002-link-against-math.patch b/package/libfcgi/0003-link-against-math.patch
similarity index 100%
rename from package/libfcgi/libfcgi-0002-link-against-math.patch
rename to package/libfcgi/0003-link-against-math.patch
diff --git a/package/libfcgi/libfcgi-0003-make-autoreconfable.patch b/package/libfcgi/0004-make-autoreconfable.patch
similarity index 100%
rename from package/libfcgi/libfcgi-0003-make-autoreconfable.patch
rename to package/libfcgi/0004-make-autoreconfable.patch
diff --git a/package/libfcgi/libfcgi-0004-disable-examples.patch b/package/libfcgi/0005-disable-examples.patch
similarity index 100%
rename from package/libfcgi/libfcgi-0004-disable-examples.patch
rename to package/libfcgi/0005-disable-examples.patch
diff --git a/package/libffi/libffi-001-Fix-installation-location-of-libffi.patch b/package/libffi/0001-Fix-installation-location-of-libffi.patch
similarity index 100%
rename from package/libffi/libffi-001-Fix-installation-location-of-libffi.patch
rename to package/libffi/0001-Fix-installation-location-of-libffi.patch
diff --git a/package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch b/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
similarity index 100%
rename from package/libffi/libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch
rename to package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
diff --git a/package/libffi/libffi-003-fix-typo.patch b/package/libffi/0003-fix-typo.patch
similarity index 100%
rename from package/libffi/libffi-003-fix-typo.patch
rename to package/libffi/0003-fix-typo.patch
diff --git a/package/libffi/libffi-004-Add-missing-GNU-stack-markings-in-win32.S.patch b/package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
similarity index 100%
rename from package/libffi/libffi-004-Add-missing-GNU-stack-markings-in-win32.S.patch
rename to package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
diff --git a/package/libffi/libffi-005-Fix-paths-in-libffi.pc.in.patch b/package/libffi/0005-Fix-paths-in-libffi.pc.in.patch
similarity index 100%
rename from package/libffi/libffi-005-Fix-paths-in-libffi.pc.in.patch
rename to package/libffi/0005-Fix-paths-in-libffi.pc.in.patch
diff --git a/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch b/package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
similarity index 100%
rename from package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
rename to package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
diff --git a/package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch b/package/libftdi/0001-pkgconfig_libusb.patch
similarity index 100%
rename from package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch
rename to package/libftdi/0001-pkgconfig_libusb.patch
diff --git a/package/libfuse/libfuse-fix-aarch64-build.patch b/package/libfuse/0001-fix-aarch64-build.patch
similarity index 100%
rename from package/libfuse/libfuse-fix-aarch64-build.patch
rename to package/libfuse/0001-fix-aarch64-build.patch
diff --git a/package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch b/package/libgail/0001-Relax-X11-dependencies.patch
similarity index 100%
rename from package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch
rename to package/libgail/0001-Relax-X11-dependencies.patch
diff --git a/package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch b/package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
similarity index 100%
rename from package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch
rename to package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
diff --git a/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch b/package/libgcrypt/0001-ac_cv_sys_symbol_underscore.patch
similarity index 100%
rename from package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
rename to package/libgcrypt/0001-ac_cv_sys_symbol_underscore.patch
diff --git a/package/libgcrypt/libgcrypt-01-reconfigure.patch b/package/libgcrypt/0002-reconfigure.patch
similarity index 100%
rename from package/libgcrypt/libgcrypt-01-reconfigure.patch
rename to package/libgcrypt/0002-reconfigure.patch
diff --git a/package/libgeotiff/libgeotiff-0001-use-pkg-config.patch b/package/libgeotiff/0001-use-pkg-config.patch
similarity index 100%
rename from package/libgeotiff/libgeotiff-0001-use-pkg-config.patch
rename to package/libgeotiff/0001-use-pkg-config.patch
diff --git a/package/libglib2/libglib2-0001-optional-ipv6.patch b/package/libglib2/0001-optional-ipv6.patch
similarity index 100%
rename from package/libglib2/libglib2-0001-optional-ipv6.patch
rename to package/libglib2/0001-optional-ipv6.patch
diff --git a/package/pango/pango-0002-no-gtk-doc.patch b/package/libglib2/0002-no-gtk-doc.patch
similarity index 100%
rename from package/pango/pango-0002-no-gtk-doc.patch
rename to package/libglib2/0002-no-gtk-doc.patch
diff --git a/package/libglib2/libglib2-0003-implement-GMutex-natively-on-Linux.patch b/package/libglib2/0003-implement-GMutex-natively-on-Linux.patch
similarity index 100%
rename from package/libglib2/libglib2-0003-implement-GMutex-natively-on-Linux.patch
rename to package/libglib2/0003-implement-GMutex-natively-on-Linux.patch
diff --git a/package/libgtk2/libgtk2-reduce-dependencies.patch b/package/libgtk2/0001-reduce-dependencies.patch
similarity index 100%
rename from package/libgtk2/libgtk2-reduce-dependencies.patch
rename to package/libgtk2/0001-reduce-dependencies.patch
diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0001-no-gtk-doc.patch
rename to package/libgtk3/0001-no-gtk-doc.patch
diff --git a/package/libgtk3/libgtk3-0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0002-fix-introspection-check.patch
rename to package/libgtk3/0002-fix-introspection-check.patch
diff --git a/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
similarity index 100%
rename from package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
rename to package/libgtk3/0003-disable-atk-bridge.patch
diff --git a/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch b/package/libhid/0001-dont-fiddle-with-debug-flags.patch
similarity index 100%
rename from package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
rename to package/libhid/0001-dont-fiddle-with-debug-flags.patch
diff --git a/package/libhid/libhid-0002-no-newline-in-ldflags.patch b/package/libhid/0002-no-newline-in-ldflags.patch
similarity index 100%
rename from package/libhid/libhid-0002-no-newline-in-ldflags.patch
rename to package/libhid/0002-no-newline-in-ldflags.patch
diff --git a/package/libhid/libhid-0003-uclinux.patch b/package/libhid/0003-uclinux.patch
similarity index 100%
rename from package/libhid/libhid-0003-uclinux.patch
rename to package/libhid/0003-uclinux.patch
diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
similarity index 100%
rename from package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
rename to package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
diff --git a/package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch b/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
similarity index 100%
rename from package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch
rename to package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
diff --git a/package/libiqrf/libiqrf-use-only-c-language.patch b/package/libiqrf/0002-use-only-c-language.patch
similarity index 100%
rename from package/libiqrf/libiqrf-use-only-c-language.patch
rename to package/libiqrf/0002-use-only-c-language.patch
diff --git a/package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch b/package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch
rename to package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
diff --git a/package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch b/package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
rename to package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
diff --git a/package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch b/package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch
rename to package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
diff --git a/package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch b/package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch
rename to package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
diff --git a/package/libiscsi/libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch b/package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch
rename to package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
diff --git a/package/libjson/libjson-0001-fix-broken-makefile.patch b/package/libjson/0001-fix-broken-makefile.patch
similarity index 100%
rename from package/libjson/libjson-0001-fix-broken-makefile.patch
rename to package/libjson/0001-fix-broken-makefile.patch
diff --git a/package/liblockfile/liblockfile-install.patch b/package/liblockfile/0001-install.patch
similarity index 100%
rename from package/liblockfile/liblockfile-install.patch
rename to package/liblockfile/0001-install.patch
diff --git a/package/liblogging/liblogging-01-stdarg.patch b/package/liblogging/0001-stdarg.patch
similarity index 100%
rename from package/liblogging/liblogging-01-stdarg.patch
rename to package/liblogging/0001-stdarg.patch
diff --git a/package/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch b/package/libmad/0001-mips-h-constraint-removal.patch
similarity index 100%
rename from package/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
rename to package/libmad/0001-mips-h-constraint-removal.patch
diff --git a/package/libmad/libmad-0.15.1b-optimization.patch.avr32 b/package/libmad/0002-optimization.patch.avr32
similarity index 100%
rename from package/libmad/libmad-0.15.1b-optimization.patch.avr32
rename to package/libmad/0002-optimization.patch.avr32
diff --git a/package/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch b/package/libmad/0003-remove-deprecated-cflags.patch
similarity index 100%
rename from package/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch
rename to package/libmad/0003-remove-deprecated-cflags.patch
diff --git a/package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch b/package/libmad/0004-thumb2-fixed-arm.patch
similarity index 100%
rename from package/libmad/libmad-0.15.1b-thumb2-fixed-arm.patch
rename to package/libmad/0004-thumb2-fixed-arm.patch
diff --git a/package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch b/package/libmad/0005-thumb2-imdct-arm.patch
similarity index 100%
rename from package/libmad/libmad-0.15.1b-thumb2-imdct-arm.patch
rename to package/libmad/0005-thumb2-imdct-arm.patch
diff --git a/package/libmcrypt/libmcrypt-nocxx.patch b/package/libmcrypt/0001-nocxx.patch
similarity index 100%
rename from package/libmcrypt/libmcrypt-nocxx.patch
rename to package/libmcrypt/0001-nocxx.patch
diff --git a/package/libmemcached/libmemcached-01-disable-tests.patch b/package/libmemcached/0001-disable-tests.patch
similarity index 100%
rename from package/libmemcached/libmemcached-01-disable-tests.patch
rename to package/libmemcached/0001-disable-tests.patch
diff --git a/package/libmnl/libmnl-01-uclinux.patch b/package/libmnl/0001-uclinux.patch
similarity index 100%
rename from package/libmnl/libmnl-01-uclinux.patch
rename to package/libmnl/0001-uclinux.patch
diff --git a/package/libmpdclient/libmpdclient-0001-musl-fixes.patch b/package/libmpdclient/0001-musl-fixes.patch
similarity index 100%
rename from package/libmpdclient/libmpdclient-0001-musl-fixes.patch
rename to package/libmpdclient/0001-musl-fixes.patch
diff --git a/package/libmpeg2/libmpeg2-0.5.1-altivec.patch b/package/libmpeg2/0001-altivec.patch
similarity index 100%
rename from package/libmpeg2/libmpeg2-0.5.1-altivec.patch
rename to package/libmpeg2/0001-altivec.patch
diff --git a/package/libmpeg2/libmpeg2-0.5.1-armv4l.patch b/package/libmpeg2/0002-armv4l.patch
similarity index 100%
rename from package/libmpeg2/libmpeg2-0.5.1-armv4l.patch
rename to package/libmpeg2/0002-armv4l.patch
diff --git a/package/libnetfilter_acct/libnetfilter_acct-01-uclinux.patch b/package/libnetfilter_acct/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_acct/libnetfilter_acct-01-uclinux.patch
rename to package/libnetfilter_acct/0001-uclinux.patch
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch b/package/libnetfilter_conntrack/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch
rename to package/libnetfilter_conntrack/0001-uclinux.patch
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper-01-uclinux.patch b/package/libnetfilter_cthelper/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_cthelper/libnetfilter_cthelper-01-uclinux.patch
rename to package/libnetfilter_cthelper/0001-uclinux.patch
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout-01-uclinux.patch b/package/libnetfilter_cttimeout/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_cttimeout/libnetfilter_cttimeout-01-uclinux.patch
rename to package/libnetfilter_cttimeout/0001-uclinux.patch
diff --git a/package/libnetfilter_log/libnetfilter_log-01-uclinux.patch b/package/libnetfilter_log/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_log/libnetfilter_log-01-uclinux.patch
rename to package/libnetfilter_log/0001-uclinux.patch
diff --git a/package/libnetfilter_queue/libnetfilter_queue-01-uclinux.patch b/package/libnetfilter_queue/0001-uclinux.patch
similarity index 100%
rename from package/libnetfilter_queue/libnetfilter_queue-01-uclinux.patch
rename to package/libnetfilter_queue/0001-uclinux.patch
diff --git a/package/libnfc/libnfc-build-systems-make-example-build-optional.patch b/package/libnfc/0001-build-systems-make-example-build-optional.patch
similarity index 100%
rename from package/libnfc/libnfc-build-systems-make-example-build-optional.patch
rename to package/libnfc/0001-build-systems-make-example-build-optional.patch
diff --git a/package/libnfnetlink/libnfnetlink-01-uclinux.patch b/package/libnfnetlink/0001-uclinux.patch
similarity index 100%
rename from package/libnfnetlink/libnfnetlink-01-uclinux.patch
rename to package/libnfnetlink/0001-uclinux.patch
diff --git a/package/libnftnl/libnftnl-0001-rename-xfree.patch b/package/libnftnl/0001-rename-xfree.patch
similarity index 100%
rename from package/libnftnl/libnftnl-0001-rename-xfree.patch
rename to package/libnftnl/0001-rename-xfree.patch
diff --git a/package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch b/package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
similarity index 100%
rename from package/libnl/libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
rename to package/libnl/0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch
diff --git a/package/libnspr/libnspr-0001-nios2.patch b/package/libnspr/0001-nios2.patch
similarity index 100%
rename from package/libnspr/libnspr-0001-nios2.patch
rename to package/libnspr/0001-nios2.patch
diff --git a/package/libnspr/libnspr-0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
similarity index 100%
rename from package/libnspr/libnspr-0002-microblaze.patch
rename to package/libnspr/0002-microblaze.patch
diff --git a/package/libnss/libnss-0001-cross-compile.patch b/package/libnss/0001-cross-compile.patch
similarity index 100%
rename from package/libnss/libnss-0001-cross-compile.patch
rename to package/libnss/0001-cross-compile.patch
diff --git a/package/libnss/libnss-0002-uclibc.patch b/package/libnss/0002-uclibc.patch
similarity index 100%
rename from package/libnss/libnss-0002-uclibc.patch
rename to package/libnss/0002-uclibc.patch
diff --git a/package/libpcap/libpcap-0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
similarity index 100%
rename from package/libpcap/libpcap-0001-remove-libnl-include-path.patch
rename to package/libpcap/0001-remove-libnl-include-path.patch
diff --git a/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch b/package/libpcap/0002-configure.in-uclinux-is-also-linux.patch
similarity index 100%
rename from package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch
rename to package/libpcap/0002-configure.in-uclinux-is-also-linux.patch
diff --git a/package/libplayer/libplayer-add-fpic.patch b/package/libplayer/0001-add-fpic.patch
similarity index 100%
rename from package/libplayer/libplayer-add-fpic.patch
rename to package/libplayer/0001-add-fpic.patch
diff --git a/package/libplayer/libplayer-fix-configure-cflags.patch b/package/libplayer/0002-fix-configure-cflags.patch
similarity index 100%
rename from package/libplayer/libplayer-fix-configure-cflags.patch
rename to package/libplayer/0002-fix-configure-cflags.patch
diff --git a/package/libpng/libpng-01-disable-tools.patch b/package/libpng/0001-disable-tools.patch
similarity index 100%
rename from package/libpng/libpng-01-disable-tools.patch
rename to package/libpng/0001-disable-tools.patch
diff --git a/package/libpng/libpng-02-ignore-symbol-prefix.patch b/package/libpng/0002-ignore-symbol-prefix.patch
similarity index 100%
rename from package/libpng/libpng-02-ignore-symbol-prefix.patch
rename to package/libpng/0002-ignore-symbol-prefix.patch
diff --git a/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch b/package/libpthsem/0001-fix-build-on-linux-3.x-host.patch
similarity index 100%
rename from package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
rename to package/libpthsem/0001-fix-build-on-linux-3.x-host.patch
diff --git a/package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
similarity index 100%
rename from package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch
rename to package/librtlsdr/0001-disable_shared_library_target_in_build.patch
diff --git a/package/libseccomp/libseccomp-0001-use-system-headers-from-sysroot.patch b/package/libseccomp/0001-use-system-headers-from-sysroot.patch
similarity index 100%
rename from package/libseccomp/libseccomp-0001-use-system-headers-from-sysroot.patch
rename to package/libseccomp/0001-use-system-headers-from-sysroot.patch
diff --git a/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch b/package/libseccomp/0002-Remove-the-dependency-on-proc.patch
similarity index 100%
rename from package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
rename to package/libseccomp/0002-Remove-the-dependency-on-proc.patch
diff --git a/package/libsepol/libsepol-01-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
similarity index 100%
rename from package/libsepol/libsepol-01-support-static-only.patch
rename to package/libsepol/0001-support-static-only.patch
diff --git a/package/libserial/libserial-0001-disable-python-bindings.patch b/package/libserial/0001-disable-python-bindings.patch
similarity index 100%
rename from package/libserial/libserial-0001-disable-python-bindings.patch
rename to package/libserial/0001-disable-python-bindings.patch
diff --git a/package/libserial/libserial-0002-add-missing-header-include.patch b/package/libserial/0002-add-missing-header-include.patch
similarity index 100%
rename from package/libserial/libserial-0002-add-missing-header-include.patch
rename to package/libserial/0002-add-missing-header-include.patch
diff --git a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch b/package/libsigsegv/0001-fix-avr32-build.patch
similarity index 100%
rename from package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
rename to package/libsigsegv/0001-fix-avr32-build.patch
diff --git a/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch b/package/libsigsegv/0002-fix-aarch64-build.patch
similarity index 100%
rename from package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch
rename to package/libsigsegv/0002-fix-aarch64-build.patch
diff --git a/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch b/package/libsigsegv/0003-fix-microblaze-build.patch
similarity index 100%
rename from package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
rename to package/libsigsegv/0003-fix-microblaze-build.patch
diff --git a/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch b/package/libsigsegv/0004-fix-bfin-build.patch
similarity index 100%
rename from package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch
rename to package/libsigsegv/0004-fix-bfin-build.patch
diff --git a/package/libsndfile/libsndfile-srconly.patch b/package/libsndfile/0001-srconly.patch
similarity index 100%
rename from package/libsndfile/libsndfile-srconly.patch
rename to package/libsndfile/0001-srconly.patch
diff --git a/package/libsoup/libsoup-01-python3-fix.patch b/package/libsoup/0001-python3-fix.patch
similarity index 100%
rename from package/libsoup/libsoup-01-python3-fix.patch
rename to package/libsoup/0001-python3-fix.patch
diff --git a/package/libstrophe/libstrophe-01-make-autoreconfable.patch b/package/libstrophe/0001-make-autoreconfable.patch
similarity index 100%
rename from package/libstrophe/libstrophe-01-make-autoreconfable.patch
rename to package/libstrophe/0001-make-autoreconfable.patch
diff --git a/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch b/package/libstrophe/0002-configure.ac-fix-misdetection-of-libxml2.patch
similarity index 100%
rename from package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch
rename to package/libstrophe/0002-configure.ac-fix-misdetection-of-libxml2.patch
diff --git a/package/libsvg/libsvg-fix-expat-static-declaration.patch b/package/libsvg/0001-fix-expat-static-declaration.patch
similarity index 100%
rename from package/libsvg/libsvg-fix-expat-static-declaration.patch
rename to package/libsvg/0001-fix-expat-static-declaration.patch
diff --git a/package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch b/package/libsvgtiny/0001-disable-debug-printfs.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch
rename to package/libsvgtiny/0001-disable-debug-printfs.patch
diff --git a/package/libsvgtiny/libsvgtiny-02-create-builddir.patch b/package/libsvgtiny/0002-create-builddir.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-02-create-builddir.patch
rename to package/libsvgtiny/0002-create-builddir.patch
diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
rename to package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
rename to package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
diff --git a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch b/package/libtirpc/0004-Make-IPv6-support-optional.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
rename to package/libtirpc/0004-Make-IPv6-support-optional.patch
diff --git a/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0008-Add-rpcgen-program-from-nfs-utils-sources.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
rename to package/libtirpc/0008-Add-rpcgen-program-from-nfs-utils-sources.patch
diff --git a/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
diff --git a/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
diff --git a/package/libtool/libtool-01-mips64-n64-linking.patch b/package/libtool/0001-mips64-n64-linking.patch
similarity index 100%
rename from package/libtool/libtool-01-mips64-n64-linking.patch
rename to package/libtool/0001-mips64-n64-linking.patch
diff --git a/package/libtorrent/libtorrent-cross_compile.patch b/package/libtorrent/0001-cross_compile.patch
similarity index 100%
rename from package/libtorrent/libtorrent-cross_compile.patch
rename to package/libtorrent/0001-cross_compile.patch
diff --git a/package/libubox/libubox-01-drop-legacy-json-c.patch b/package/libubox/0001-drop-legacy-json-c.patch
similarity index 100%
rename from package/libubox/libubox-01-drop-legacy-json-c.patch
rename to package/libubox/0001-drop-legacy-json-c.patch
diff --git a/package/libunwind/libunwind-01-disable-tests.patch b/package/libunwind/0001-disable-tests.patch
similarity index 100%
rename from package/libunwind/libunwind-01-disable-tests.patch
rename to package/libunwind/0001-disable-tests.patch
diff --git a/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
similarity index 100%
rename from package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
rename to package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
diff --git a/package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
similarity index 100%
rename from package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
rename to package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
diff --git a/package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch b/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
similarity index 100%
rename from package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
rename to package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
diff --git a/package/libva-intel-driver/libva-intel-driver-0001-wayland.patch b/package/libva-intel-driver/0001-wayland.patch
similarity index 100%
rename from package/libva-intel-driver/libva-intel-driver-0001-wayland.patch
rename to package/libva-intel-driver/0001-wayland.patch
diff --git a/package/libva/libva-0001-no_test_decode.patch b/package/libva/0001-no_test_decode.patch
similarity index 100%
rename from package/libva/libva-0001-no_test_decode.patch
rename to package/libva/0001-no_test_decode.patch
diff --git a/package/libva/libva-0002-wayland.patch b/package/libva/0002-wayland.patch
similarity index 100%
rename from package/libva/libva-0002-wayland.patch
rename to package/libva/0002-wayland.patch
diff --git a/package/libvncserver/libvncserver-0001-CVE-2014-6051-6052.patch b/package/libvncserver/0001-CVE-2014-6051-6052.patch
similarity index 100%
rename from package/libvncserver/libvncserver-0001-CVE-2014-6051-6052.patch
rename to package/libvncserver/0001-CVE-2014-6051-6052.patch
diff --git a/package/libvncserver/libvncserver-0002-CVE-2014-6053.patch b/package/libvncserver/0002-CVE-2014-6053.patch
similarity index 100%
rename from package/libvncserver/libvncserver-0002-CVE-2014-6053.patch
rename to package/libvncserver/0002-CVE-2014-6053.patch
diff --git a/package/libvncserver/libvncserver-0003-CVE-2014-6054.patch b/package/libvncserver/0003-CVE-2014-6054.patch
similarity index 100%
rename from package/libvncserver/libvncserver-0003-CVE-2014-6054.patch
rename to package/libvncserver/0003-CVE-2014-6054.patch
diff --git a/package/libvncserver/libvncserver-0004-CVE-2014-6055.patch b/package/libvncserver/0004-CVE-2014-6055.patch
similarity index 100%
rename from package/libvncserver/libvncserver-0004-CVE-2014-6055.patch
rename to package/libvncserver/0004-CVE-2014-6055.patch
diff --git a/package/libwebsockets/libwebsockets-0001-cmake-set-the-project-language.patch b/package/libwebsockets/0001-cmake-set-the-project-language.patch
similarity index 100%
rename from package/libwebsockets/libwebsockets-0001-cmake-set-the-project-language.patch
rename to package/libwebsockets/0001-cmake-set-the-project-language.patch
diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
similarity index 100%
rename from package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
rename to package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
diff --git a/package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch
rename to package/libxmlrpc/0001-fix-gennmtab-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch
rename to package/libxmlrpc/0002-fix-non-cplusplus-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch b/package/libxmlrpc/0003-non-wchar-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch
rename to package/libxmlrpc/0003-non-wchar-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch
rename to package/libxmlrpc/0004-use-correct-curl-config.patch
diff --git a/package/lighttpd/lighttpd-01-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
similarity index 100%
rename from package/lighttpd/lighttpd-01-Fix-default-config-file.patch
rename to package/lighttpd/0001-Fix-default-config-file.patch
diff --git a/package/links/links-0001-no-largefile.patch b/package/links/0001-no-largefile.patch
similarity index 100%
rename from package/links/links-0001-no-largefile.patch
rename to package/links/0001-no-largefile.patch
diff --git a/package/links/links-0002-CVE-2013-6050.patch b/package/links/0002-CVE-2013-6050.patch
similarity index 100%
rename from package/links/links-0002-CVE-2013-6050.patch
rename to package/links/0002-CVE-2013-6050.patch
diff --git a/package/linux-headers/3.0.101/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.101/0001-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from package/linux-headers/3.0.101/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to package/linux-headers/3.0.101/0001-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/package/linux-pam/linux-pam-01-configure.patch b/package/linux-pam/0001-configure.patch
similarity index 100%
rename from package/linux-pam/linux-pam-01-configure.patch
rename to package/linux-pam/0001-configure.patch
diff --git a/package/linux-pam/linux-pam-02-doc-makefile-am.patch b/package/linux-pam/0002-doc-makefile-am.patch
similarity index 100%
rename from package/linux-pam/linux-pam-02-doc-makefile-am.patch
rename to package/linux-pam/0002-doc-makefile-am.patch
diff --git a/package/linux-pam/linux-pam-03-group.patch b/package/linux-pam/0003-group.patch
similarity index 100%
rename from package/linux-pam/linux-pam-03-group.patch
rename to package/linux-pam/0003-group.patch
diff --git a/package/linux-pam/linux-pam-04-mkdir.patch b/package/linux-pam/0004-mkdir.patch
similarity index 100%
rename from package/linux-pam/linux-pam-04-mkdir.patch
rename to package/linux-pam/0004-mkdir.patch
diff --git a/package/linux-pam/linux-pam-05-succeed.patch b/package/linux-pam/0005-succeed.patch
similarity index 100%
rename from package/linux-pam/linux-pam-05-succeed.patch
rename to package/linux-pam/0005-succeed.patch
diff --git a/package/linux-pam/linux-pam-06-time.patch b/package/linux-pam/0006-time.patch
similarity index 100%
rename from package/linux-pam/linux-pam-06-time.patch
rename to package/linux-pam/0006-time.patch
diff --git a/package/linux-pam/linux-pam-07-rhosts.patch b/package/linux-pam/0007-rhosts.patch
similarity index 100%
rename from package/linux-pam/linux-pam-07-rhosts.patch
rename to package/linux-pam/0007-rhosts.patch
diff --git a/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch b/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
similarity index 100%
rename from package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
rename to package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
diff --git a/package/lite/lite-dfbspy-stat.patch b/package/lite/0001-dfbspy-stat.patch
similarity index 100%
rename from package/lite/lite-dfbspy-stat.patch
rename to package/lite/0001-dfbspy-stat.patch
diff --git a/package/lite/lite-no-tests.patch b/package/lite/0002-no-tests.patch
similarity index 100%
rename from package/lite/lite-no-tests.patch
rename to package/lite/0002-no-tests.patch
diff --git a/package/lite/lite-pkg-config.patch b/package/lite/0003-pkg-config.patch
similarity index 100%
rename from package/lite/lite-pkg-config.patch
rename to package/lite/0003-pkg-config.patch
diff --git a/package/lm-sensors/lm-sensors-0001-static-build.patch b/package/lm-sensors/0001-static-build.patch
similarity index 100%
rename from package/lm-sensors/lm-sensors-0001-static-build.patch
rename to package/lm-sensors/0001-static-build.patch
diff --git a/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch b/package/lm-sensors/0002-no-host-ldconfig.patch
similarity index 100%
rename from package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
rename to package/lm-sensors/0002-no-host-ldconfig.patch
diff --git a/package/lockfile-progs/lockfile-progs-01-sus3v-legacy.patch b/package/lockfile-progs/0001-sus3v-legacy.patch
similarity index 100%
rename from package/lockfile-progs/lockfile-progs-01-sus3v-legacy.patch
rename to package/lockfile-progs/0001-sus3v-legacy.patch
diff --git a/package/log4cxx/log4cxx-0001-charset-fixes.patch b/package/log4cxx/0001-charset-fixes.patch
similarity index 100%
rename from package/log4cxx/log4cxx-0001-charset-fixes.patch
rename to package/log4cxx/0001-charset-fixes.patch
diff --git a/package/log4cxx/log4cxx-0002-missing-includes.patch b/package/log4cxx/0002-missing-includes.patch
similarity index 100%
rename from package/log4cxx/log4cxx-0002-missing-includes.patch
rename to package/log4cxx/0002-missing-includes.patch
diff --git a/package/log4cxx/log4cxx-0003-missing-includes.patch b/package/log4cxx/0003-missing-includes.patch
similarity index 100%
rename from package/log4cxx/log4cxx-0003-missing-includes.patch
rename to package/log4cxx/0003-missing-includes.patch
diff --git a/package/lshw/lshw-add-LIBS.patch b/package/lshw/0001-add-LIBS.patch
similarity index 100%
rename from package/lshw/lshw-add-LIBS.patch
rename to package/lshw/0001-add-LIBS.patch
diff --git a/package/lsof/lsof-0001-makefile.patch b/package/lsof/0001-makefile.patch
similarity index 100%
rename from package/lsof/lsof-0001-makefile.patch
rename to package/lsof/0001-makefile.patch
diff --git a/package/lsof/lsof-0002-noportmap.patch b/package/lsof/0002-noportmap.patch
similarity index 100%
rename from package/lsof/lsof-0002-noportmap.patch
rename to package/lsof/0002-noportmap.patch
diff --git a/package/lsof/lsof-0003-override-cflags.patch b/package/lsof/0003-override-cflags.patch
similarity index 100%
rename from package/lsof/lsof-0003-override-cflags.patch
rename to package/lsof/0003-override-cflags.patch
diff --git a/package/lsof/lsof-0004-remove-susvlegacy-funcs.patch b/package/lsof/0004-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/lsof-0004-remove-susvlegacy-funcs.patch
rename to package/lsof/0004-remove-susvlegacy-funcs.patch
diff --git a/package/ltp-testsuite/ltp-testsuite-fix-build-on-uClibc-exp10.patch b/package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch
similarity index 100%
rename from package/ltp-testsuite/ltp-testsuite-fix-build-on-uClibc-exp10.patch
rename to package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch
diff --git a/package/ltrace/ltrace-01-events.patch b/package/ltrace/0001-events.patch
similarity index 100%
rename from package/ltrace/ltrace-01-events.patch
rename to package/ltrace/0001-events.patch
diff --git a/package/ltrace/ltrace-02-arm-plt.patch b/package/ltrace/0002-arm-plt.patch
similarity index 100%
rename from package/ltrace/ltrace-02-arm-plt.patch
rename to package/ltrace/0002-arm-plt.patch
diff --git a/package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch b/package/ltrace/0003-PPC-fix-PPC32-build.patch
similarity index 100%
rename from package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch
rename to package/ltrace/0003-PPC-fix-PPC32-build.patch
diff --git a/package/lttng-babeltrace/lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
similarity index 100%
rename from package/lttng-babeltrace/lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch
rename to package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
diff --git a/package/lua/5.1.5/lua-01-root-path.patch b/package/lua/5.1.5/0001-root-path.patch
similarity index 100%
rename from package/lua/5.1.5/lua-01-root-path.patch
rename to package/lua/5.1.5/0001-root-path.patch
diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
rename to package/lua/5.1.5/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.1.5/lua-11-linenoise.patch b/package/lua/5.1.5/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.1.5/lua-11-linenoise.patch
rename to package/lua/5.1.5/0011-linenoise.patch
diff --git a/package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
similarity index 100%
rename from package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch
rename to package/lua/5.1.5/0012-fix-reader-at-eoz.patch
diff --git a/package/lua/5.2.3/lua-01-root-path.patch b/package/lua/5.2.3/0001-root-path.patch
similarity index 100%
rename from package/lua/5.2.3/lua-01-root-path.patch
rename to package/lua/5.2.3/0001-root-path.patch
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
rename to package/lua/5.2.3/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.2.3/lua-04-lua-pc.patch b/package/lua/5.2.3/0004-lua-pc.patch
similarity index 100%
rename from package/lua/5.2.3/lua-04-lua-pc.patch
rename to package/lua/5.2.3/0004-lua-pc.patch
diff --git a/package/lua/5.2.3/lua-11-linenoise.patch b/package/lua/5.2.3/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.2.3/lua-11-linenoise.patch
rename to package/lua/5.2.3/0011-linenoise.patch
diff --git a/package/luafilesystem/luafilesystem-without_large_file.patch b/package/luafilesystem/0001-without_large_file.patch
similarity index 100%
rename from package/luafilesystem/luafilesystem-without_large_file.patch
rename to package/luafilesystem/0001-without_large_file.patch
diff --git a/package/luajit/luajit-04-no-bin-symlink.patch b/package/luajit/0004-no-bin-symlink.patch
similarity index 100%
rename from package/luajit/luajit-04-no-bin-symlink.patch
rename to package/luajit/0004-no-bin-symlink.patch
diff --git a/package/luajit/luajit-05-install-inc.patch b/package/luajit/0005-install-inc.patch
similarity index 100%
rename from package/luajit/luajit-05-install-inc.patch
rename to package/luajit/0005-install-inc.patch
diff --git a/package/luajit/luajit-06-install-so.patch b/package/luajit/0006-install-so.patch
similarity index 100%
rename from package/luajit/luajit-06-install-so.patch
rename to package/luajit/0006-install-so.patch
diff --git a/package/luasocket/luasocket-01-uClibc-IPv6.patch b/package/luasocket/0001-uClibc-IPv6.patch
similarity index 100%
rename from package/luasocket/luasocket-01-uClibc-IPv6.patch
rename to package/luasocket/0001-uClibc-IPv6.patch
diff --git a/package/lxc/lxc-01-drop-werror.patch b/package/lxc/0001-drop-werror.patch
similarity index 100%
rename from package/lxc/lxc-01-drop-werror.patch
rename to package/lxc/0001-drop-werror.patch
diff --git a/package/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch b/package/madplay/0001-switch-to-new-alsa-api.patch
similarity index 100%
rename from package/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
rename to package/madplay/0001-switch-to-new-alsa-api.patch
diff --git a/package/matchbox/matchbox-lib/matchbox-lib-0001-index-is-legacy.patch b/package/matchbox/matchbox-lib/0001-index-is-legacy.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib-0001-index-is-legacy.patch
rename to package/matchbox/matchbox-lib/0001-index-is-legacy.patch
diff --git a/package/matchbox/matchbox-lib/matchbox-lib-0002-libpng15.patch b/package/matchbox/matchbox-lib/0002-libpng15.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib-0002-libpng15.patch
rename to package/matchbox/matchbox-lib/0002-libpng15.patch
diff --git a/package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch b/package/matchbox/matchbox-lib/0003-include-setjmp-h.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch
rename to package/matchbox/matchbox-lib/0003-include-setjmp-h.patch
diff --git a/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch b/package/matchbox/matchbox-panel/0001-index-is-legacy.patch
similarity index 100%
rename from package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch
rename to package/matchbox/matchbox-panel/0001-index-is-legacy.patch
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch b/package/matchbox/matchbox-startup-monitor/0001-true-false.patch
similarity index 100%
rename from package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch
rename to package/matchbox/matchbox-startup-monitor/0001-true-false.patch
diff --git a/package/matchbox/matchbox-wm/matchbox-wm-defaulttheme.patch b/package/matchbox/matchbox-wm/0001-defaulttheme.patch
similarity index 100%
rename from package/matchbox/matchbox-wm/matchbox-wm-defaulttheme.patch
rename to package/matchbox/matchbox-wm/0001-defaulttheme.patch
diff --git a/package/mcrypt/mcrypt-CVE-2012-4409.patch b/package/mcrypt/0001-CVE-2012-4409.patch
similarity index 100%
rename from package/mcrypt/mcrypt-CVE-2012-4409.patch
rename to package/mcrypt/0001-CVE-2012-4409.patch
diff --git a/package/mcrypt/mcrypt-CVE-2012-4426.patch b/package/mcrypt/0002-CVE-2012-4426.patch
similarity index 100%
rename from package/mcrypt/mcrypt-CVE-2012-4426.patch
rename to package/mcrypt/0002-CVE-2012-4426.patch
diff --git a/package/mcrypt/mcrypt-CVE-2012-4527.patch b/package/mcrypt/0003-CVE-2012-4527.patch
similarity index 100%
rename from package/mcrypt/mcrypt-CVE-2012-4527.patch
rename to package/mcrypt/0003-CVE-2012-4527.patch
diff --git a/package/mcrypt/mcrypt-no-rpath.patch b/package/mcrypt/0004-no-rpath.patch
similarity index 100%
rename from package/mcrypt/mcrypt-no-rpath.patch
rename to package/mcrypt/0004-no-rpath.patch
diff --git a/package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch b/package/mdadm/0010-add-install-targets-for-mdadm-and-mdmon.patch
similarity index 100%
rename from package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch
rename to package/mdadm/0010-add-install-targets-for-mdadm-and-mdmon.patch
diff --git a/package/mdadm/mdadm-020-uclibc-dont-force-largefile.patch b/package/mdadm/0020-uclibc-dont-force-largefile.patch
similarity index 100%
rename from package/mdadm/mdadm-020-uclibc-dont-force-largefile.patch
rename to package/mdadm/0020-uclibc-dont-force-largefile.patch
diff --git a/package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch b/package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
similarity index 100%
rename from package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
rename to package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
diff --git a/package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch b/package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
similarity index 100%
rename from package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
rename to package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
diff --git a/package/mediastreamer/mediastreamer-0001.patch b/package/mediastreamer/0001-misc-fixes.patch
similarity index 100%
rename from package/mediastreamer/mediastreamer-0001.patch
rename to package/mediastreamer/0001-misc-fixes.patch
diff --git a/package/memstat/memstat-0001-PATH_MAX.patch b/package/memstat/0001-PATH_MAX.patch
similarity index 100%
rename from package/memstat/memstat-0001-PATH_MAX.patch
rename to package/memstat/0001-PATH_MAX.patch
diff --git a/package/memtester/memtester-makefile-fix.patch b/package/memtester/0001-makefile-fix.patch
similarity index 100%
rename from package/memtester/memtester-makefile-fix.patch
rename to package/memtester/0001-makefile-fix.patch
diff --git a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
similarity index 100%
rename from package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
rename to package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
diff --git a/package/mesa3d/mesa3d-0002-execinfo_h.patch b/package/mesa3d/0002-execinfo_h.patch
similarity index 100%
rename from package/mesa3d/mesa3d-0002-execinfo_h.patch
rename to package/mesa3d/0002-execinfo_h.patch
diff --git a/package/metacity/metacity-add-libm-reference.patch b/package/metacity/0001-add-libm-reference.patch
similarity index 100%
rename from package/metacity/metacity-add-libm-reference.patch
rename to package/metacity/0001-add-libm-reference.patch
diff --git a/package/metacity/metacity-gconf.patch b/package/metacity/0002-gconf.patch
similarity index 100%
rename from package/metacity/metacity-gconf.patch
rename to package/metacity/0002-gconf.patch
diff --git a/package/metacity/metacity-mag-add-libm-reference.patch b/package/metacity/0003-mag-add-libm-reference.patch
similarity index 100%
rename from package/metacity/metacity-mag-add-libm-reference.patch
rename to package/metacity/0003-mag-add-libm-reference.patch
diff --git a/package/mii-diag/mii-diag-strchr.patch b/package/mii-diag/0001-strchr.patch
similarity index 100%
rename from package/mii-diag/mii-diag-strchr.patch
rename to package/mii-diag/0001-strchr.patch
diff --git a/package/mmc-utils/mmc-utils-001-fix-mmc-h-includes.patch b/package/mmc-utils/0001-fix-mmc-h-includes.patch
similarity index 100%
rename from package/mmc-utils/mmc-utils-001-fix-mmc-h-includes.patch
rename to package/mmc-utils/0001-fix-mmc-h-includes.patch
diff --git a/package/mongoose/mongoose-0001-largefile-conditional-define.patch b/package/mongoose/0001-largefile-conditional-define.patch
similarity index 100%
rename from package/mongoose/mongoose-0001-largefile-conditional-define.patch
rename to package/mongoose/0001-largefile-conditional-define.patch
diff --git a/package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch b/package/mongrel2/0001-use-CC-variable-to-compile-procer.patch
similarity index 100%
rename from package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch
rename to package/mongrel2/0001-use-CC-variable-to-compile-procer.patch
diff --git a/package/mongrel2/mongrel2-0002-Do-not-run-tests.patch b/package/mongrel2/0002-Do-not-run-tests.patch
similarity index 100%
rename from package/mongrel2/mongrel2-0002-Do-not-run-tests.patch
rename to package/mongrel2/0002-Do-not-run-tests.patch
diff --git a/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch
similarity index 100%
rename from package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
rename to package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch
diff --git a/package/monit/monit-0001-no-force-static.patch b/package/monit/0001-no-force-static.patch
similarity index 100%
rename from package/monit/monit-0001-no-force-static.patch
rename to package/monit/0001-no-force-static.patch
diff --git a/package/mono/mono-001-gc-fix-uclibc.patch b/package/mono/0001-gc-fix-uclibc.patch
similarity index 100%
rename from package/mono/mono-001-gc-fix-uclibc.patch
rename to package/mono/0001-gc-fix-uclibc.patch
diff --git a/package/mono/mono-002-support-uclibc-musl.patch b/package/mono/0002-support-uclibc-musl.patch
similarity index 100%
rename from package/mono/mono-002-support-uclibc-musl.patch
rename to package/mono/0002-support-uclibc-musl.patch
diff --git a/package/mplayer/mplayer-0001-disable-install-strip.patch b/package/mplayer/0001-disable-install-strip.patch
similarity index 100%
rename from package/mplayer/mplayer-0001-disable-install-strip.patch
rename to package/mplayer/0001-disable-install-strip.patch
diff --git a/package/mplayer/mplayer-0002-fix-cc-parsing.patch b/package/mplayer/0002-fix-cc-parsing.patch
similarity index 100%
rename from package/mplayer/mplayer-0002-fix-cc-parsing.patch
rename to package/mplayer/0002-fix-cc-parsing.patch
diff --git a/package/mplayer/mplayer-0003-mpdemux-live555-async-interface.patch b/package/mplayer/0003-mpdemux-live555-async-interface.patch
similarity index 100%
rename from package/mplayer/mplayer-0003-mpdemux-live555-async-interface.patch
rename to package/mplayer/0003-mpdemux-live555-async-interface.patch
diff --git a/package/mplayer/mplayer-0004-add-arc-support.patch b/package/mplayer/0004-add-arc-support.patch
similarity index 100%
rename from package/mplayer/mplayer-0004-add-arc-support.patch
rename to package/mplayer/0004-add-arc-support.patch
diff --git a/package/mrouted/mrouted-bcopy.patch b/package/mrouted/0001-bcopy.patch
similarity index 100%
rename from package/mrouted/mrouted-bcopy.patch
rename to package/mrouted/0001-bcopy.patch
diff --git a/package/mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch b/package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
similarity index 100%
rename from package/mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch
rename to package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
diff --git a/package/musepack/musepack-0001-shared.patch b/package/musepack/0001-shared.patch
similarity index 100%
rename from package/musepack/musepack-0001-shared.patch
rename to package/musepack/0001-shared.patch
diff --git a/package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
similarity index 100%
rename from package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
rename to package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
diff --git a/package/mutt/mutt-01-nodoc.patch b/package/mutt/0001-nodoc.patch
similarity index 100%
rename from package/mutt/mutt-01-nodoc.patch
rename to package/mutt/0001-nodoc.patch
diff --git a/package/mxml/mxml-fix-cross-target-installation.patch b/package/mxml/0001-fix-cross-target-installation.patch
similarity index 100%
rename from package/mxml/mxml-fix-cross-target-installation.patch
rename to package/mxml/0001-fix-cross-target-installation.patch
diff --git a/package/mysql/mysql-0000-ac_cache_check.patch b/package/mysql/0001-ac_cache_check.patch
similarity index 100%
rename from package/mysql/mysql-0000-ac_cache_check.patch
rename to package/mysql/0001-ac_cache_check.patch
diff --git a/package/mysql/mysql-0001-configure-ps-cache-check.patch b/package/mysql/0002-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/mysql-0001-configure-ps-cache-check.patch
rename to package/mysql/0002-configure-ps-cache-check.patch
diff --git a/package/mysql/mysql-0002-use-new-readline-iface.patch b/package/mysql/0003-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/mysql-0002-use-new-readline-iface.patch
rename to package/mysql/0003-use-new-readline-iface.patch
diff --git a/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch b/package/mysql/0004-ac_stack_direction-is-unset.patch
similarity index 100%
rename from package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
rename to package/mysql/0004-ac_stack_direction-is-unset.patch
diff --git a/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch b/package/mysql/0005-Fix-gen_lex_hash-execution.patch
similarity index 100%
rename from package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
rename to package/mysql/0005-Fix-gen_lex_hash-execution.patch
diff --git a/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch b/package/mysql/0006-bison_3_breaks_mysql_server_build.patch
similarity index 100%
rename from package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
rename to package/mysql/0006-bison_3_breaks_mysql_server_build.patch
diff --git a/package/ncurses/ncurses-01-fixup-pkg-config-handling.patch b/package/ncurses/0001-fixup-pkg-config-handling.patch
similarity index 100%
rename from package/ncurses/ncurses-01-fixup-pkg-config-handling.patch
rename to package/ncurses/0001-fixup-pkg-config-handling.patch
diff --git a/package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch b/package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
similarity index 100%
rename from package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch
rename to package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
diff --git a/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
similarity index 100%
rename from package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch
rename to package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
diff --git a/package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch b/package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
similarity index 100%
rename from package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
rename to package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
diff --git a/package/netcat/netcat-0.7.1-signed-bit-counting.patch b/package/netcat/0001-signed-bit-counting.patch
similarity index 100%
rename from package/netcat/netcat-0.7.1-signed-bit-counting.patch
rename to package/netcat/0001-signed-bit-counting.patch
diff --git a/package/netplug/netplug-1.2.9.2-makefile-flags.patch b/package/netplug/0001-makefile-flags.patch
similarity index 100%
rename from package/netplug/netplug-1.2.9.2-makefile-flags.patch
rename to package/netplug/0001-makefile-flags.patch
diff --git a/package/netsnmp/netsnmp-001-CVE-2014-2285.patch b/package/netsnmp/0001-CVE-2014-2285.patch
similarity index 100%
rename from package/netsnmp/netsnmp-001-CVE-2014-2285.patch
rename to package/netsnmp/0001-CVE-2014-2285.patch
diff --git a/package/network-manager/network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch b/package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
similarity index 100%
rename from package/network-manager/network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
rename to package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
diff --git a/package/newt/newt-fix-makefile.patch b/package/newt/0001-fix-makefile.patch
similarity index 100%
rename from package/newt/newt-fix-makefile.patch
rename to package/newt/0001-fix-makefile.patch
diff --git a/package/nfacct/nfacct-01-uclinux.patch b/package/nfacct/0001-uclinux.patch
similarity index 100%
rename from package/nfacct/nfacct-01-uclinux.patch
rename to package/nfacct/0001-uclinux.patch
diff --git a/package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch b/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
rename to package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
diff --git a/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
rename to package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
diff --git a/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
rename to package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
diff --git a/package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch b/package/nfs-utils/0004-fix-build-with-uClibc.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
rename to package/nfs-utils/0004-fix-build-with-uClibc.patch
diff --git a/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch b/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
rename to package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
diff --git a/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
rename to package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
diff --git a/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch b/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch
rename to package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
diff --git a/package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
similarity index 100%
rename from package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
rename to package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
diff --git a/package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
similarity index 100%
rename from package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
rename to package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
diff --git a/package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
similarity index 100%
rename from package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
rename to package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
diff --git a/package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch b/package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
similarity index 100%
rename from package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
rename to package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
diff --git a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
similarity index 100%
rename from package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
rename to package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
diff --git a/package/ngrep/ngrep-0001-make-objs.patch b/package/ngrep/0001-make-objs.patch
similarity index 100%
rename from package/ngrep/ngrep-0001-make-objs.patch
rename to package/ngrep/0001-make-objs.patch
diff --git a/package/ngrep/ngrep-0002-pcre-header.patch b/package/ngrep/0002-pcre-header.patch
similarity index 100%
rename from package/ngrep/ngrep-0002-pcre-header.patch
rename to package/ngrep/0002-pcre-header.patch
diff --git a/package/ngrep/ngrep-0003-fix-static-link.patch b/package/ngrep/0003-fix-static-link.patch
similarity index 100%
rename from package/ngrep/ngrep-0003-fix-static-link.patch
rename to package/ngrep/0003-fix-static-link.patch
diff --git a/package/nodejs/nodejs-0001-remove-python-bz2-dependency.patch b/package/nodejs/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/nodejs-0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/nodejs-0003-use-python-variable.patch b/package/nodejs/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/nodejs-0003-use-python-variable.patch
rename to package/nodejs/0003-use-python-variable.patch
diff --git a/package/ntp/ntp-001-adjtimex.patch b/package/ntp/0001-adjtimex.patch
similarity index 100%
rename from package/ntp/ntp-001-adjtimex.patch
rename to package/ntp/0001-adjtimex.patch
diff --git a/package/ntp/ntp-002-nano.patch b/package/ntp/0002-nano.patch
similarity index 100%
rename from package/ntp/ntp-002-nano.patch
rename to package/ntp/0002-nano.patch
diff --git a/package/nut/nut-0001-foo-config.patch b/package/nut/0001-foo-config.patch
similarity index 100%
rename from package/nut/nut-0001-foo-config.patch
rename to package/nut/0001-foo-config.patch
diff --git a/package/nut/nut-0002-parallel-build.patch b/package/nut/0002-parallel-build.patch
similarity index 100%
rename from package/nut/nut-0002-parallel-build.patch
rename to package/nut/0002-parallel-build.patch
diff --git a/package/nuttcp/nuttcp-6.1.2-susv3-legacy.patch b/package/nuttcp/0001-susv3-legacy.patch
similarity index 100%
rename from package/nuttcp/nuttcp-6.1.2-susv3-legacy.patch
rename to package/nuttcp/0001-susv3-legacy.patch
diff --git a/package/ocf-linux/ocf-linux-01-modules-cross.patch b/package/ocf-linux/0001-modules-cross.patch
similarity index 100%
rename from package/ocf-linux/ocf-linux-01-modules-cross.patch
rename to package/ocf-linux/0001-modules-cross.patch
diff --git a/package/ofono/ofono-uclibc-backtrace.patch b/package/ofono/0001-uclibc-backtrace.patch
similarity index 100%
rename from package/ofono/ofono-uclibc-backtrace.patch
rename to package/ofono/0001-uclibc-backtrace.patch
diff --git a/package/ola/ola-0001-fix-build-warning.patch b/package/ola/0001-fix-build-warning.patch
similarity index 100%
rename from package/ola/ola-0001-fix-build-warning.patch
rename to package/ola/0001-fix-build-warning.patch
diff --git a/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch b/package/ola/0002-move-python-sub-check-to-configure.ac.patch
similarity index 100%
rename from package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
rename to package/ola/0002-move-python-sub-check-to-configure.ac.patch
diff --git a/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch b/package/ola/0003-fix-check-for-python-module-for-cross-compilation.patch
similarity index 100%
rename from package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch
rename to package/ola/0003-fix-check-for-python-module-for-cross-compilation.patch
diff --git a/package/olsr/olsr-configurable-ldconfig.patch b/package/olsr/0001-configurable-ldconfig.patch
similarity index 100%
rename from package/olsr/olsr-configurable-ldconfig.patch
rename to package/olsr/0001-configurable-ldconfig.patch
diff --git a/package/open2300/open2300-0001-fix-makefile.patch b/package/open2300/0001-fix-makefile.patch
similarity index 100%
rename from package/open2300/open2300-0001-fix-makefile.patch
rename to package/open2300/0001-fix-makefile.patch
diff --git a/package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch b/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
similarity index 100%
rename from package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch
rename to package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
diff --git a/package/openobex/openobex-libusb_check_when_cross-compiling.patch b/package/openobex/0001-libusb_check_when_cross-compiling.patch
similarity index 100%
rename from package/openobex/openobex-libusb_check_when_cross-compiling.patch
rename to package/openobex/0001-libusb_check_when_cross-compiling.patch
diff --git a/package/openobex/openobex-replace_deprecated_functions.patch b/package/openobex/0002-replace_deprecated_functions.patch
similarity index 100%
rename from package/openobex/openobex-replace_deprecated_functions.patch
rename to package/openobex/0002-replace_deprecated_functions.patch
diff --git a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch b/package/openocd/0001-fix-cross-compilation-host-libsub-was-used-before.patch
similarity index 100%
rename from package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
rename to package/openocd/0001-fix-cross-compilation-host-libsub-was-used-before.patch
diff --git a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch b/package/openocd/0002-fix-xscale-uninitialise-breakpoint_pc.patch
similarity index 100%
rename from package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
rename to package/openocd/0002-fix-xscale-uninitialise-breakpoint_pc.patch
diff --git a/package/openocd/openocd-0003-force-gnu99.patch b/package/openocd/0003-force-gnu99.patch
similarity index 100%
rename from package/openocd/openocd-0003-force-gnu99.patch
rename to package/openocd/0003-force-gnu99.patch
diff --git a/package/openocd/openocd-0004-force_jimtcl_static.patch b/package/openocd/0004-force_jimtcl_static.patch
similarity index 100%
rename from package/openocd/openocd-0004-force_jimtcl_static.patch
rename to package/openocd/0004-force_jimtcl_static.patch
diff --git a/package/openocd/openocd-0005-dont-force-ldflags.patch b/package/openocd/0005-dont-force-ldflags.patch
similarity index 100%
rename from package/openocd/openocd-0005-dont-force-ldflags.patch
rename to package/openocd/0005-dont-force-ldflags.patch
diff --git a/package/openocd/openocd-0006-automake-compat.patch b/package/openocd/0006-automake-compat.patch
similarity index 100%
rename from package/openocd/openocd-0006-automake-compat.patch
rename to package/openocd/0006-automake-compat.patch
diff --git a/package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch b/package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
similarity index 100%
rename from package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch
rename to package/openpgm/0001-version_generator.py-make-it-python3-compliant.patch
diff --git a/package/openpgm/openpgm-cross-compile.patch b/package/openpgm/0002-cross-compile.patch
similarity index 100%
rename from package/openpgm/openpgm-cross-compile.patch
rename to package/openpgm/0002-cross-compile.patch
diff --git a/package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch b/package/openpowerlink/0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
similarity index 100%
rename from package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
rename to package/openpowerlink/0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
diff --git a/package/openssh/openssh-01-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
similarity index 100%
rename from package/openssh/openssh-01-fix-pam-uclibc-pthreads-clash.patch
rename to package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
diff --git a/package/openssh/openssh-02-fix-howmany-include.patch b/package/openssh/0002-fix-howmany-include.patch
similarity index 100%
rename from package/openssh/openssh-02-fix-howmany-include.patch
rename to package/openssh/0002-fix-howmany-include.patch
diff --git a/package/openssl/openssl-001-do-not-build-docs.patch b/package/openssl/0001-do-not-build-docs.patch
similarity index 100%
rename from package/openssl/openssl-001-do-not-build-docs.patch
rename to package/openssl/0001-do-not-build-docs.patch
diff --git a/package/openssl/openssl-002-dont-force-large-file.patch b/package/openssl/0002-dont-force-large-file.patch
similarity index 100%
rename from package/openssl/openssl-002-dont-force-large-file.patch
rename to package/openssl/0002-dont-force-large-file.patch
diff --git a/package/openssl/openssl-003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0003-cryptodev-Fix-issue-with-signature-generation.patch
similarity index 100%
rename from package/openssl/openssl-003-cryptodev-Fix-issue-with-signature-generation.patch
rename to package/openssl/0003-cryptodev-Fix-issue-with-signature-generation.patch
diff --git a/package/openssl/openssl-004-musl-termios.patch b/package/openssl/0004-musl-termios.patch
similarity index 100%
rename from package/openssl/openssl-004-musl-termios.patch
rename to package/openssl/0004-musl-termios.patch
diff --git a/package/openvmtools/openvmtools-01-has_bsd_printf.patch b/package/openvmtools/0001-has_bsd_printf.patch
similarity index 100%
rename from package/openvmtools/openvmtools-01-has_bsd_printf.patch
rename to package/openvmtools/0001-has_bsd_printf.patch
diff --git a/package/openvmtools/openvmtools-02-network_script.patch b/package/openvmtools/0002-network_script.patch
similarity index 100%
rename from package/openvmtools/openvmtools-02-network_script.patch
rename to package/openvmtools/0002-network_script.patch
diff --git a/package/openvmtools/openvmtools-03-conditionally-define-g_info.patch b/package/openvmtools/0003-conditionally-define-g_info.patch
similarity index 100%
rename from package/openvmtools/openvmtools-03-conditionally-define-g_info.patch
rename to package/openvmtools/0003-conditionally-define-g_info.patch
diff --git a/package/openvmtools/openvmtools-04-no_cflags_werror.patch b/package/openvmtools/0004-no_cflags_werror.patch
similarity index 100%
rename from package/openvmtools/openvmtools-04-no_cflags_werror.patch
rename to package/openvmtools/0004-no_cflags_werror.patch
diff --git a/package/openvmtools/openvmtools-05-dont-force-cppflags.patch b/package/openvmtools/0005-dont-force-cppflags.patch
similarity index 100%
rename from package/openvmtools/openvmtools-05-dont-force-cppflags.patch
rename to package/openvmtools/0005-dont-force-cppflags.patch
diff --git a/package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch b/package/oprofile/0001-avr32-enable-lookup_dcookie.patch
similarity index 100%
rename from package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
rename to package/oprofile/0001-avr32-enable-lookup_dcookie.patch
diff --git a/package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch b/package/oprofile/0002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
similarity index 100%
rename from package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
rename to package/oprofile/0002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
diff --git a/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch b/package/oprofile/0003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
similarity index 100%
rename from package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
rename to package/oprofile/0003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
diff --git a/package/opus-tools/opus-tools-largefile.patch b/package/opus-tools/0001-largefile.patch
similarity index 100%
rename from package/opus-tools/opus-tools-largefile.patch
rename to package/opus-tools/0001-largefile.patch
diff --git a/package/opus/opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch b/package/opus/0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
similarity index 100%
rename from package/opus/opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
rename to package/opus/0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
diff --git a/package/owl-linux/owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch b/package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
similarity index 100%
rename from package/owl-linux/owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch
rename to package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
diff --git a/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch b/package/owl-linux/0002-fix-for-linux-3.3.x.patch
similarity index 100%
rename from package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch
rename to package/owl-linux/0002-fix-for-linux-3.3.x.patch
diff --git a/package/p11-kit/p11-kit-01-Fix-build-against-older-pthreads-implementations.patch b/package/p11-kit/0001-Fix-build-against-older-pthreads-implementations.patch
similarity index 100%
rename from package/p11-kit/p11-kit-01-Fix-build-against-older-pthreads-implementations.patch
rename to package/p11-kit/0001-Fix-build-against-older-pthreads-implementations.patch
diff --git a/package/pango/pango-0001-no-tests.patch b/package/pango/0001-no-tests.patch
similarity index 100%
rename from package/pango/pango-0001-no-tests.patch
rename to package/pango/0001-no-tests.patch
diff --git a/package/libglib2/libglib2-0002-no-gtk-doc.patch b/package/pango/0002-no-gtk-doc.patch
similarity index 100%
rename from package/libglib2/libglib2-0002-no-gtk-doc.patch
rename to package/pango/0002-no-gtk-doc.patch
diff --git a/package/parted/parted-001-readline-deprecated.patch b/package/parted/0001-readline-deprecated.patch
similarity index 100%
rename from package/parted/parted-001-readline-deprecated.patch
rename to package/parted/0001-readline-deprecated.patch
diff --git a/package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
similarity index 100%
rename from package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch
rename to package/parted/0002-configure.ac-uclinux-is-also-linux.patch
diff --git a/package/pcmanfm/pcmanfm-link-against-libx11.patch b/package/pcmanfm/0001-link-against-libx11.patch
similarity index 100%
rename from package/pcmanfm/pcmanfm-link-against-libx11.patch
rename to package/pcmanfm/0001-link-against-libx11.patch
diff --git a/package/pcre/pcre-01-no-compat.patch b/package/pcre/0001-no-compat.patch
similarity index 100%
rename from package/pcre/pcre-01-no-compat.patch
rename to package/pcre/0001-no-compat.patch
diff --git a/package/pcre/pcre-02-no-cpp-tests.patch b/package/pcre/0002-no-cpp-tests.patch
similarity index 100%
rename from package/pcre/pcre-02-no-cpp-tests.patch
rename to package/pcre/0002-no-cpp-tests.patch
diff --git a/package/pcsc-lite/pcsc-lite-0001-pthread-needed-for-libusb.patch b/package/pcsc-lite/0001-pthread-needed-for-libusb.patch
similarity index 100%
rename from package/pcsc-lite/pcsc-lite-0001-pthread-needed-for-libusb.patch
rename to package/pcsc-lite/0001-pthread-needed-for-libusb.patch
diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/0001-getoptions.patch
similarity index 100%
rename from package/perl-gd/perl-gd-01-getoptions.patch
rename to package/perl-gd/0001-getoptions.patch
diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/0002-lgd.patch
similarity index 100%
rename from package/perl-gd/perl-gd-02-lgd.patch
rename to package/perl-gd/0002-lgd.patch
diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/0003-force.patch
similarity index 100%
rename from package/perl-gd/perl-gd-03-force.patch
rename to package/perl-gd/0003-force.patch
diff --git a/package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch b/package/perl-net-ssleay/0001-fix-build-system.patch
similarity index 100%
rename from package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch
rename to package/perl-net-ssleay/0001-fix-build-system.patch
diff --git a/package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch b/package/perl-xml-libxml/0001-Makefile-PL.patch
similarity index 100%
rename from package/perl-xml-libxml/perl-xml-libxml-01-Makefile-PL.patch
rename to package/perl-xml-libxml/0001-Makefile-PL.patch
diff --git a/package/perl/perl-uClibc-IPv6.patch b/package/perl/0001-uClibc-IPv6.patch
similarity index 100%
rename from package/perl/perl-uClibc-IPv6.patch
rename to package/perl/0001-uClibc-IPv6.patch
diff --git a/package/php/php-01-no-iconv-search.patch b/package/php/0001-no-iconv-search.patch
similarity index 100%
rename from package/php/php-01-no-iconv-search.patch
rename to package/php/0001-no-iconv-search.patch
diff --git a/package/php/php-02-dlopen.patch b/package/php/0002-dlopen.patch
similarity index 100%
rename from package/php/php-02-dlopen.patch
rename to package/php/0002-dlopen.patch
diff --git a/package/php/php-03-disable-pharcmd.patch b/package/php/0003-disable-pharcmd.patch
similarity index 100%
rename from package/php/php-03-disable-pharcmd.patch
rename to package/php/0003-disable-pharcmd.patch
diff --git a/package/pifmrds/pifmrds-0001-Makefile-cross-compile-friendly.patch b/package/pifmrds/0001-Makefile-cross-compile-friendly.patch
similarity index 100%
rename from package/pifmrds/pifmrds-0001-Makefile-cross-compile-friendly.patch
rename to package/pifmrds/0001-Makefile-cross-compile-friendly.patch
diff --git a/package/pifmrds/pifmrds-0002-Makefile-use-LDFLAGS.patch b/package/pifmrds/0002-Makefile-use-LDFLAGS.patch
similarity index 100%
rename from package/pifmrds/pifmrds-0002-Makefile-use-LDFLAGS.patch
rename to package/pifmrds/0002-Makefile-use-LDFLAGS.patch
diff --git a/package/pkgconf/pkgconf-01-fix-variable.patch b/package/pkgconf/0001-fix-variable.patch
similarity index 100%
rename from package/pkgconf/pkgconf-01-fix-variable.patch
rename to package/pkgconf/0001-fix-variable.patch
diff --git a/package/pkgconf/pkgconf-02-fix-double-sysroot.patch b/package/pkgconf/0002-fix-double-sysroot.patch
similarity index 100%
rename from package/pkgconf/pkgconf-02-fix-double-sysroot.patch
rename to package/pkgconf/0002-fix-double-sysroot.patch
diff --git a/package/poco/poco-aarch64.patch b/package/poco/0001-aarch64.patch
similarity index 100%
rename from package/poco/poco-aarch64.patch
rename to package/poco/0001-aarch64.patch
diff --git a/package/poco/poco-add-cross-build-config.patch b/package/poco/0002-add-cross-build-config.patch
similarity index 100%
rename from package/poco/poco-add-cross-build-config.patch
rename to package/poco/0002-add-cross-build-config.patch
diff --git a/package/poco/poco-add-staging-search-path.patch b/package/poco/0003-add-staging-search-path.patch
similarity index 100%
rename from package/poco/poco-add-staging-search-path.patch
rename to package/poco/0003-add-staging-search-path.patch
diff --git a/package/poco/poco-dont-build-debug-libs.patch b/package/poco/0004-dont-build-debug-libs.patch
similarity index 100%
rename from package/poco/poco-dont-build-debug-libs.patch
rename to package/poco/0004-dont-build-debug-libs.patch
diff --git a/package/polarssl/polarssl-01-no-test-suite.patch b/package/polarssl/0001-no-test-suite.patch
similarity index 100%
rename from package/polarssl/polarssl-01-no-test-suite.patch
rename to package/polarssl/0001-no-test-suite.patch
diff --git a/package/polarssl/polarssl-02-disable-microblaze-asm.patch b/package/polarssl/0002-disable-microblaze-asm.patch
similarity index 100%
rename from package/polarssl/polarssl-02-disable-microblaze-asm.patch
rename to package/polarssl/0002-disable-microblaze-asm.patch
diff --git a/package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
similarity index 100%
rename from package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
rename to package/polarssl/0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
diff --git a/package/popt/popt-01-no-wchar.patch b/package/popt/0001-no-wchar.patch
similarity index 100%
rename from package/popt/popt-01-no-wchar.patch
rename to package/popt/0001-no-wchar.patch
diff --git a/package/popt/popt-02-fix-autoreconf.patch b/package/popt/0002-fix-autoreconf.patch
similarity index 100%
rename from package/popt/popt-02-fix-autoreconf.patch
rename to package/popt/0002-fix-autoreconf.patch
diff --git a/package/popt/popt-03-glob-detection.patch b/package/popt/0003-glob-detection.patch
similarity index 100%
rename from package/popt/popt-03-glob-detection.patch
rename to package/popt/0003-glob-detection.patch
diff --git a/package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch b/package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
similarity index 100%
rename from package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
rename to package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
diff --git a/package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch b/package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
similarity index 100%
rename from package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
rename to package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
diff --git a/package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch b/package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
similarity index 100%
rename from package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
rename to package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
diff --git a/package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch b/package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
similarity index 100%
rename from package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
rename to package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
diff --git a/package/portmap/portmap-6.0-tcpd.patch b/package/portmap/0005-tcpd.patch
similarity index 100%
rename from package/portmap/portmap-6.0-tcpd.patch
rename to package/portmap/0005-tcpd.patch
diff --git a/package/pptp-linux/pptp-linux-001-susv3-legacy.patch b/package/pptp-linux/0001-susv3-legacy.patch
similarity index 100%
rename from package/pptp-linux/pptp-linux-001-susv3-legacy.patch
rename to package/pptp-linux/0001-susv3-legacy.patch
diff --git a/package/pptp-linux/pptp-linux-002-fix-parallel-build.patch b/package/pptp-linux/0002-fix-parallel-build.patch
similarity index 100%
rename from package/pptp-linux/pptp-linux-002-fix-parallel-build.patch
rename to package/pptp-linux/0002-fix-parallel-build.patch
diff --git a/package/prboom/prboom-2.5.0-libpng-1.4.patch b/package/prboom/0001-libpng-1.4.patch
similarity index 100%
rename from package/prboom/prboom-2.5.0-libpng-1.4.patch
rename to package/prboom/0001-libpng-1.4.patch
diff --git a/package/procps-ng/procps-ng-0000-remove-index.patch b/package/procps-ng/0001-remove-index.patch
similarity index 100%
rename from package/procps-ng/procps-ng-0000-remove-index.patch
rename to package/procps-ng/0001-remove-index.patch
diff --git a/package/proftpd/proftpd-0001-fix-kernel-header-capability-version.patch b/package/proftpd/0001-fix-kernel-header-capability-version.patch
similarity index 100%
rename from package/proftpd/proftpd-0001-fix-kernel-header-capability-version.patch
rename to package/proftpd/0001-fix-kernel-header-capability-version.patch
diff --git a/package/proftpd/proftpd-0002-__mempcpy.patch b/package/proftpd/0002-__mempcpy.patch
similarity index 100%
rename from package/proftpd/proftpd-0002-__mempcpy.patch
rename to package/proftpd/0002-__mempcpy.patch
diff --git a/package/psmisc/psmisc-link-against-libintl.patch b/package/psmisc/0001-link-against-libintl.patch
similarity index 100%
rename from package/psmisc/psmisc-link-against-libintl.patch
rename to package/psmisc/0001-link-against-libintl.patch
diff --git a/package/psmisc/psmisc-no-__progname.patch b/package/psmisc/0002-no-__progname.patch
similarity index 100%
rename from package/psmisc/psmisc-no-__progname.patch
rename to package/psmisc/0002-no-__progname.patch
diff --git a/package/pure-ftpd/pure-ftpd-0001-cross.patch b/package/pure-ftpd/0001-cross.patch
similarity index 100%
rename from package/pure-ftpd/pure-ftpd-0001-cross.patch
rename to package/pure-ftpd/0001-cross.patch
diff --git a/package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch b/package/python-ipython/0001-set-correct-python-executable-path.patch
similarity index 100%
rename from package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
rename to package/python-ipython/0001-set-correct-python-executable-path.patch
diff --git a/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch b/package/python-netifaces/0001-ifaddrs-uclibc.patch
similarity index 100%
rename from package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch
rename to package/python-netifaces/0001-ifaddrs-uclibc.patch
diff --git a/package/python-nfc/python-nfc-add-setup-py.patch b/package/python-nfc/0001-add-setup-py.patch
similarity index 100%
rename from package/python-nfc/python-nfc-add-setup-py.patch
rename to package/python-nfc/0001-add-setup-py.patch
diff --git a/package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch b/package/python-numpy/0001-no-fenv-on-uclibc.patch
similarity index 100%
rename from package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch
rename to package/python-numpy/0001-no-fenv-on-uclibc.patch
diff --git a/package/python-pycrypto/python-pycrypto-0001-remove-incorrect-header-path.patch b/package/python-pycrypto/0001-remove-incorrect-header-path.patch
similarity index 100%
rename from package/python-pycrypto/python-pycrypto-0001-remove-incorrect-header-path.patch
rename to package/python-pycrypto/0001-remove-incorrect-header-path.patch
diff --git a/package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
similarity index 100%
rename from package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch
rename to package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
diff --git a/package/python-setuptools/python-setuptools-0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/python-setuptools-0001-add-executable.patch
rename to package/python-setuptools/0001-add-executable.patch
diff --git a/package/python/python-001-remove-host-header-path.patch b/package/python/0001-remove-host-header-path.patch
similarity index 100%
rename from package/python/python-001-remove-host-header-path.patch
rename to package/python/0001-remove-host-header-path.patch
diff --git a/package/python/python-002-fix-get-python-inc.patch b/package/python/0002-fix-get-python-inc.patch
similarity index 100%
rename from package/python/python-002-fix-get-python-inc.patch
rename to package/python/0002-fix-get-python-inc.patch
diff --git a/package/python/python-003-properly-detect-if-python-build.patch b/package/python/0003-properly-detect-if-python-build.patch
similarity index 100%
rename from package/python/python-003-properly-detect-if-python-build.patch
rename to package/python/0003-properly-detect-if-python-build.patch
diff --git a/package/python/python-004-sysconfigdata-install-location.patch b/package/python/0004-sysconfigdata-install-location.patch
similarity index 100%
rename from package/python/python-004-sysconfigdata-install-location.patch
rename to package/python/0004-sysconfigdata-install-location.patch
diff --git a/package/python/python-005-pyc-pyo-conditional.patch b/package/python/0005-pyc-pyo-conditional.patch
similarity index 100%
rename from package/python/python-005-pyc-pyo-conditional.patch
rename to package/python/0005-pyc-pyo-conditional.patch
diff --git a/package/python/python-006-cross-compile-getaddrinfo.patch b/package/python/0006-cross-compile-getaddrinfo.patch
similarity index 100%
rename from package/python/python-006-cross-compile-getaddrinfo.patch
rename to package/python/0006-cross-compile-getaddrinfo.patch
diff --git a/package/python/python-007-disable-extensions.patch b/package/python/0007-disable-extensions.patch
similarity index 100%
rename from package/python/python-007-disable-extensions.patch
rename to package/python/0007-disable-extensions.patch
diff --git a/package/python/python-008-distutils-use-python-sysroot.patch b/package/python/0008-distutils-use-python-sysroot.patch
similarity index 100%
rename from package/python/python-008-distutils-use-python-sysroot.patch
rename to package/python/0008-distutils-use-python-sysroot.patch
diff --git a/package/python/python-009-no-termcap-host-path.patch b/package/python/0009-no-termcap-host-path.patch
similarity index 100%
rename from package/python/python-009-no-termcap-host-path.patch
rename to package/python/0009-no-termcap-host-path.patch
diff --git a/package/python/python-010-fix-python-config.patch b/package/python/0010-fix-python-config.patch
similarity index 100%
rename from package/python/python-010-fix-python-config.patch
rename to package/python/0010-fix-python-config.patch
diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/0011-remove-python-symlink.patch
similarity index 100%
rename from package/python/python-011-remove-python-symlink.patch
rename to package/python/0011-remove-python-symlink.patch
diff --git a/package/python/python-012-support-library-path-old-compilers.patch b/package/python/0012-support-library-path-old-compilers.patch
similarity index 100%
rename from package/python/python-012-support-library-path-old-compilers.patch
rename to package/python/0012-support-library-path-old-compilers.patch
diff --git a/package/python/python-013-dont-add-multiarch-path.patch b/package/python/0013-dont-add-multiarch-path.patch
similarity index 100%
rename from package/python/python-013-dont-add-multiarch-path.patch
rename to package/python/0013-dont-add-multiarch-path.patch
diff --git a/package/python/python-014-abort-on-failed-modules.patch b/package/python/0014-abort-on-failed-modules.patch
similarity index 100%
rename from package/python/python-014-abort-on-failed-modules.patch
rename to package/python/0014-abort-on-failed-modules.patch
diff --git a/package/python/python-015-fix-sqlite-without-threads.patch b/package/python/0015-fix-sqlite-without-threads.patch
similarity index 100%
rename from package/python/python-015-fix-sqlite-without-threads.patch
rename to package/python/0015-fix-sqlite-without-threads.patch
diff --git a/package/python/python-016-serial-ioctl-workaround.patch b/package/python/0016-serial-ioctl-workaround.patch
similarity index 100%
rename from package/python/python-016-serial-ioctl-workaround.patch
rename to package/python/0016-serial-ioctl-workaround.patch
diff --git a/package/python/python-017-distutils-scripts-dont-adjust-shebang.patch b/package/python/0017-distutils-scripts-dont-adjust-shebang.patch
similarity index 100%
rename from package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
rename to package/python/0017-distutils-scripts-dont-adjust-shebang.patch
diff --git a/package/python/python-100-optional-test-modules.patch b/package/python/0100-optional-test-modules.patch
similarity index 100%
rename from package/python/python-100-optional-test-modules.patch
rename to package/python/0100-optional-test-modules.patch
diff --git a/package/python/python-101-optional-pydoc.patch b/package/python/0101-optional-pydoc.patch
similarity index 100%
rename from package/python/python-101-optional-pydoc.patch
rename to package/python/0101-optional-pydoc.patch
diff --git a/package/python/python-102-optional-2to3.patch b/package/python/0102-optional-2to3.patch
similarity index 100%
rename from package/python/python-102-optional-2to3.patch
rename to package/python/0102-optional-2to3.patch
diff --git a/package/python/python-103-optional-sqlite.patch b/package/python/0103-optional-sqlite.patch
similarity index 100%
rename from package/python/python-103-optional-sqlite.patch
rename to package/python/0103-optional-sqlite.patch
diff --git a/package/python/python-104-optional-tk.patch b/package/python/0104-optional-tk.patch
similarity index 100%
rename from package/python/python-104-optional-tk.patch
rename to package/python/0104-optional-tk.patch
diff --git a/package/python/python-105-optional-curses.patch b/package/python/0105-optional-curses.patch
similarity index 100%
rename from package/python/python-105-optional-curses.patch
rename to package/python/0105-optional-curses.patch
diff --git a/package/python/python-106-optional-expat.patch b/package/python/0106-optional-expat.patch
similarity index 100%
rename from package/python/python-106-optional-expat.patch
rename to package/python/0106-optional-expat.patch
diff --git a/package/python/python-107-optional-codecs-cjk.patch b/package/python/0107-optional-codecs-cjk.patch
similarity index 100%
rename from package/python/python-107-optional-codecs-cjk.patch
rename to package/python/0107-optional-codecs-cjk.patch
diff --git a/package/python/python-108-optional-nis.patch b/package/python/0108-optional-nis.patch
similarity index 100%
rename from package/python/python-108-optional-nis.patch
rename to package/python/0108-optional-nis.patch
diff --git a/package/python/python-109-optional-unicodedata.patch b/package/python/0109-optional-unicodedata.patch
similarity index 100%
rename from package/python/python-109-optional-unicodedata.patch
rename to package/python/0109-optional-unicodedata.patch
diff --git a/package/python/python-110-optional-db.patch b/package/python/0110-optional-db.patch
similarity index 100%
rename from package/python/python-110-optional-db.patch
rename to package/python/0110-optional-db.patch
diff --git a/package/python/python-111-optional-ssl.patch b/package/python/0111-optional-ssl.patch
similarity index 100%
rename from package/python/python-111-optional-ssl.patch
rename to package/python/0111-optional-ssl.patch
diff --git a/package/python/python-112-optional-bzip2.patch b/package/python/0112-optional-bzip2.patch
similarity index 100%
rename from package/python/python-112-optional-bzip2.patch
rename to package/python/0112-optional-bzip2.patch
diff --git a/package/python/python-113-optional-zlib.patch b/package/python/0113-optional-zlib.patch
similarity index 100%
rename from package/python/python-113-optional-zlib.patch
rename to package/python/0113-optional-zlib.patch
diff --git a/package/python/python-114-remove-idle-editor.patch b/package/python/0114-remove-idle-editor.patch
similarity index 100%
rename from package/python/python-114-remove-idle-editor.patch
rename to package/python/0114-remove-idle-editor.patch
diff --git a/package/python3/python3-001-remove-host-header-path.patch b/package/python3/0001-remove-host-header-path.patch
similarity index 100%
rename from package/python3/python3-001-remove-host-header-path.patch
rename to package/python3/0001-remove-host-header-path.patch
diff --git a/package/python3/python3-002-properly-detect-if-python-build.patch b/package/python3/0002-properly-detect-if-python-build.patch
similarity index 100%
rename from package/python3/python3-002-properly-detect-if-python-build.patch
rename to package/python3/0002-properly-detect-if-python-build.patch
diff --git a/package/python3/python3-003-sysconfigdata-install-location.patch b/package/python3/0003-sysconfigdata-install-location.patch
similarity index 100%
rename from package/python3/python3-003-sysconfigdata-install-location.patch
rename to package/python3/0003-sysconfigdata-install-location.patch
diff --git a/package/python3/python3-004-old-stdlib-cache.patch b/package/python3/0004-old-stdlib-cache.patch
similarity index 100%
rename from package/python3/python3-004-old-stdlib-cache.patch
rename to package/python3/0004-old-stdlib-cache.patch
diff --git a/package/python3/python3-005-pyc-pyo-conditional.patch b/package/python3/0005-pyc-pyo-conditional.patch
similarity index 100%
rename from package/python3/python3-005-pyc-pyo-conditional.patch
rename to package/python3/0005-pyc-pyo-conditional.patch
diff --git a/package/python3/python3-006-cross-compile-getaddrinfo.patch b/package/python3/0006-cross-compile-getaddrinfo.patch
similarity index 100%
rename from package/python3/python3-006-cross-compile-getaddrinfo.patch
rename to package/python3/0006-cross-compile-getaddrinfo.patch
diff --git a/package/python3/python3-007-disable-extensions.patch b/package/python3/0007-disable-extensions.patch
similarity index 100%
rename from package/python3/python3-007-disable-extensions.patch
rename to package/python3/0007-disable-extensions.patch
diff --git a/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0008-distutils-sysconfig-use-sysconfigdata.patch
similarity index 100%
rename from package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
rename to package/python3/0008-distutils-sysconfig-use-sysconfigdata.patch
diff --git a/package/python3/python3-009-distutils-use-python-sysroot.patch b/package/python3/0009-distutils-use-python-sysroot.patch
similarity index 100%
rename from package/python3/python3-009-distutils-use-python-sysroot.patch
rename to package/python3/0009-distutils-use-python-sysroot.patch
diff --git a/package/python3/python3-010-no-termcap-host-path.patch b/package/python3/0010-no-termcap-host-path.patch
similarity index 100%
rename from package/python3/python3-010-no-termcap-host-path.patch
rename to package/python3/0010-no-termcap-host-path.patch
diff --git a/package/python3/python3-011-support-library-path-old-compilers.patch b/package/python3/0011-support-library-path-old-compilers.patch
similarity index 100%
rename from package/python3/python3-011-support-library-path-old-compilers.patch
rename to package/python3/0011-support-library-path-old-compilers.patch
diff --git a/package/python3/python3-012-dont-add-multiarch-path.patch b/package/python3/0012-dont-add-multiarch-path.patch
similarity index 100%
rename from package/python3/python3-012-dont-add-multiarch-path.patch
rename to package/python3/0012-dont-add-multiarch-path.patch
diff --git a/package/python3/python3-013-abort-on-failed-modules.patch b/package/python3/0013-abort-on-failed-modules.patch
similarity index 100%
rename from package/python3/python3-013-abort-on-failed-modules.patch
rename to package/python3/0013-abort-on-failed-modules.patch
diff --git a/package/python3/python3-014-serial-ioctl-workaround.patch b/package/python3/0014-serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/python3-014-serial-ioctl-workaround.patch
rename to package/python3/0014-serial-ioctl-workaround.patch
diff --git a/package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch b/package/python3/0015-distutils-scripts-dont-adjust-shebang.patch
similarity index 100%
rename from package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
rename to package/python3/0015-distutils-scripts-dont-adjust-shebang.patch
diff --git a/package/python3/python3-016-distutils-no-pep3147.patch b/package/python3/0016-distutils-no-pep3147.patch
similarity index 100%
rename from package/python3/python3-016-distutils-no-pep3147.patch
rename to package/python3/0016-distutils-no-pep3147.patch
diff --git a/package/python3/python3-100-optional-test-modules.patch b/package/python3/0100-optional-test-modules.patch
similarity index 100%
rename from package/python3/python3-100-optional-test-modules.patch
rename to package/python3/0100-optional-test-modules.patch
diff --git a/package/python3/python3-101-optional-pydoc.patch b/package/python3/0101-optional-pydoc.patch
similarity index 100%
rename from package/python3/python3-101-optional-pydoc.patch
rename to package/python3/0101-optional-pydoc.patch
diff --git a/package/python3/python3-102-optional-2to3.patch b/package/python3/0102-optional-2to3.patch
similarity index 100%
rename from package/python3/python3-102-optional-2to3.patch
rename to package/python3/0102-optional-2to3.patch
diff --git a/package/python3/python3-103-optional-sqlite.patch b/package/python3/0103-optional-sqlite.patch
similarity index 100%
rename from package/python3/python3-103-optional-sqlite.patch
rename to package/python3/0103-optional-sqlite.patch
diff --git a/package/python3/python3-104-optional-tk.patch b/package/python3/0104-optional-tk.patch
similarity index 100%
rename from package/python3/python3-104-optional-tk.patch
rename to package/python3/0104-optional-tk.patch
diff --git a/package/python3/python3-105-optional-curses.patch b/package/python3/0105-optional-curses.patch
similarity index 100%
rename from package/python3/python3-105-optional-curses.patch
rename to package/python3/0105-optional-curses.patch
diff --git a/package/python3/python3-106-optional-expat.patch b/package/python3/0106-optional-expat.patch
similarity index 100%
rename from package/python3/python3-106-optional-expat.patch
rename to package/python3/0106-optional-expat.patch
diff --git a/package/python3/python3-107-optional-codecs-cjk.patch b/package/python3/0107-optional-codecs-cjk.patch
similarity index 100%
rename from package/python3/python3-107-optional-codecs-cjk.patch
rename to package/python3/0107-optional-codecs-cjk.patch
diff --git a/package/python3/python3-108-optional-nis.patch b/package/python3/0108-optional-nis.patch
similarity index 100%
rename from package/python3/python3-108-optional-nis.patch
rename to package/python3/0108-optional-nis.patch
diff --git a/package/python3/python3-109-optional-unicodedata.patch b/package/python3/0109-optional-unicodedata.patch
similarity index 100%
rename from package/python3/python3-109-optional-unicodedata.patch
rename to package/python3/0109-optional-unicodedata.patch
diff --git a/package/python3/python3-110-optional-idle.patch b/package/python3/0110-optional-idle.patch
similarity index 100%
rename from package/python3/python3-110-optional-idle.patch
rename to package/python3/0110-optional-idle.patch
diff --git a/package/python3/python3-111-optional-decimal.patch b/package/python3/0111-optional-decimal.patch
similarity index 100%
rename from package/python3/python3-111-optional-decimal.patch
rename to package/python3/0111-optional-decimal.patch
diff --git a/package/qdecoder/qdecoder-0001-fix-make-install.patch b/package/qdecoder/0001-fix-make-install.patch
similarity index 100%
rename from package/qdecoder/qdecoder-0001-fix-make-install.patch
rename to package/qdecoder/0001-fix-make-install.patch
diff --git a/package/qdecoder/qdecoder-0002-configure.ac-drop-hardcoded-paths.patch b/package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch
similarity index 100%
rename from package/qdecoder/qdecoder-0002-configure.ac-drop-hardcoded-paths.patch
rename to package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch
diff --git a/package/qdecoder/qdecoder-0003-errno.patch b/package/qdecoder/0003-errno.patch
similarity index 100%
rename from package/qdecoder/qdecoder-0003-errno.patch
rename to package/qdecoder/0003-errno.patch
diff --git a/package/qextserialport/qextserialport-gui.patch b/package/qextserialport/0001-gui.patch
similarity index 100%
rename from package/qextserialport/qextserialport-gui.patch
rename to package/qextserialport/0001-gui.patch
diff --git a/package/qextserialport/qextserialport-main-include.patch b/package/qextserialport/0002-main-include.patch
similarity index 100%
rename from package/qextserialport/qextserialport-main-include.patch
rename to package/qextserialport/0002-main-include.patch
diff --git a/package/qextserialport/qextserialport-pkgconfig.patch b/package/qextserialport/0003-pkgconfig.patch
similarity index 100%
rename from package/qextserialport/qextserialport-pkgconfig.patch
rename to package/qextserialport/0003-pkgconfig.patch
diff --git a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch b/package/qjson/0001-fix-qt4-package-error-in-cmakelists.patch
similarity index 100%
rename from package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
rename to package/qjson/0001-fix-qt4-package-error-in-cmakelists.patch
diff --git a/package/qlibc/qlibc-0001-remove-absolute-paths.patch b/package/qlibc/0001-remove-absolute-paths.patch
similarity index 100%
rename from package/qlibc/qlibc-0001-remove-absolute-paths.patch
rename to package/qlibc/0001-remove-absolute-paths.patch
diff --git a/package/qlibc/qlibc-0002-obey-destdir.patch b/package/qlibc/0002-obey-destdir.patch
similarity index 100%
rename from package/qlibc/qlibc-0002-obey-destdir.patch
rename to package/qlibc/0002-obey-destdir.patch
diff --git a/package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch b/package/qlibc/0003-fix-openssl-mysql-checks.patch
similarity index 100%
rename from package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch
rename to package/qlibc/0003-fix-openssl-mysql-checks.patch
diff --git a/package/qt/qt-configure.patch b/package/qt/0001-configure.patch
similarity index 100%
rename from package/qt/qt-configure.patch
rename to package/qt/0001-configure.patch
diff --git a/package/qt/qt-eglwsegl-use-system.patch b/package/qt/0002-eglwsegl-use-system.patch
similarity index 100%
rename from package/qt/qt-eglwsegl-use-system.patch
rename to package/qt/0002-eglwsegl-use-system.patch
diff --git a/package/qt/qt-fix-const-atomics.patch b/package/qt/0003-fix-const-atomics.patch
similarity index 100%
rename from package/qt/qt-fix-const-atomics.patch
rename to package/qt/0003-fix-const-atomics.patch
diff --git a/package/qt/qt-pthread_getattr_np.patch b/package/qt/0004-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-pthread_getattr_np.patch
rename to package/qt/0004-pthread_getattr_np.patch
diff --git a/package/qt/qt-script-qtdbus-no-gui.patch b/package/qt/0005-script-qtdbus-no-gui.patch
similarity index 100%
rename from package/qt/qt-script-qtdbus-no-gui.patch
rename to package/qt/0005-script-qtdbus-no-gui.patch
diff --git a/package/qt/qt-uClibc-lfs-fix.patch b/package/qt/0006-uClibc-lfs-fix.patch
similarity index 100%
rename from package/qt/qt-uClibc-lfs-fix.patch
rename to package/qt/0006-uClibc-lfs-fix.patch
diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
rename to package/qt5/qt5base/0002-mkspecs-files.patch
diff --git a/package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch b/package/qt5/qt5base/0003-uclibc-no-lfs.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
rename to package/qt5/qt5base/0003-uclibc-no-lfs.patch
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch b/package/qt5/qt5webkit-examples/0001-build.patch
similarity index 100%
rename from package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
rename to package/qt5/qt5webkit-examples/0001-build.patch
diff --git a/package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch b/package/qt5/qt5webkit/0001-egl-includepath.patch
similarity index 100%
rename from package/qt5/qt5webkit/qt5webkit-0001-egl-includepath.patch
rename to package/qt5/qt5webkit/0001-egl-includepath.patch
diff --git a/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch b/package/qt5/qt5websockets/0001-Remove-dependency-on-unused-sql-module.patch
similarity index 100%
rename from package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
rename to package/qt5/qt5websockets/0001-Remove-dependency-on-unused-sql-module.patch
diff --git a/package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch b/package/qtuio/0001-TuioServer.cpp-add-missing-include.patch
similarity index 100%
rename from package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch
rename to package/qtuio/0001-TuioServer.cpp-add-missing-include.patch
diff --git a/package/qtuio/qtuio-dont-append-_d-for-debug.patch b/package/qtuio/0002-dont-append-_d-for-debug.patch
similarity index 100%
rename from package/qtuio/qtuio-dont-append-_d-for-debug.patch
rename to package/qtuio/0002-dont-append-_d-for-debug.patch
diff --git a/package/quagga/quagga-fix-ipctl-forwarding.patch b/package/quagga/0001-fix-ipctl-forwarding.patch
similarity index 100%
rename from package/quagga/quagga-fix-ipctl-forwarding.patch
rename to package/quagga/0001-fix-ipctl-forwarding.patch
diff --git a/package/quota/quota-01-tools-getrpcbynumber.patch b/package/quota/0001-tools-getrpcbynumber.patch
similarity index 100%
rename from package/quota/quota-01-tools-getrpcbynumber.patch
rename to package/quota/0001-tools-getrpcbynumber.patch
diff --git a/package/qwt/qwt-remove-installed-check.patch b/package/qwt/0001-remove-installed-check.patch
similarity index 100%
rename from package/qwt/qwt-remove-installed-check.patch
rename to package/qwt/0001-remove-installed-check.patch
diff --git a/package/radvd/radvd-01-drop-check.patch b/package/radvd/0001-drop-check.patch
similarity index 100%
rename from package/radvd/radvd-01-drop-check.patch
rename to package/radvd/0001-drop-check.patch
diff --git a/package/radvd/radvd-02-drop-stack-protector.patch b/package/radvd/0002-drop-stack-protector.patch
similarity index 100%
rename from package/radvd/radvd-02-drop-stack-protector.patch
rename to package/radvd/0002-drop-stack-protector.patch
diff --git a/package/rdesktop/rdesktop-01-8bit-colors.patch b/package/rdesktop/0001-8bit-colors.patch
similarity index 100%
rename from package/rdesktop/rdesktop-01-8bit-colors.patch
rename to package/rdesktop/0001-8bit-colors.patch
diff --git a/package/readline/readline-001-curses-link.patch b/package/readline/0001-curses-link.patch
similarity index 100%
rename from package/readline/readline-001-curses-link.patch
rename to package/readline/0001-curses-link.patch
diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/0001-uclibc.patch
similarity index 100%
rename from package/redis/redis-001-uclibc.patch
rename to package/redis/0001-uclibc.patch
diff --git a/package/redis/redis-002-lua-AR.patch b/package/redis/0002-lua-AR.patch
similarity index 100%
rename from package/redis/redis-002-lua-AR.patch
rename to package/redis/0002-lua-AR.patch
diff --git a/package/redis/redis-003-largefile-conditional-define.patch b/package/redis/0003-largefile-conditional-define.patch
similarity index 100%
rename from package/redis/redis-003-largefile-conditional-define.patch
rename to package/redis/0003-largefile-conditional-define.patch
diff --git a/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch b/package/rp-pppoe/0002-krn-plugin.patch
similarity index 100%
rename from package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
rename to package/rp-pppoe/0002-krn-plugin.patch
diff --git a/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch b/package/rpcbind/0001-Remove-yellow-pages-support.patch
similarity index 100%
rename from package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
rename to package/rpcbind/0001-Remove-yellow-pages-support.patch
diff --git a/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch b/package/rpcbind/0003-Make-IPv6-configurable.patch
similarity index 100%
rename from package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
rename to package/rpcbind/0003-Make-IPv6-configurable.patch
diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/0001-add-pkgconfig-files.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
rename to package/rpi-userland/0001-add-pkgconfig-files.patch
diff --git a/package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch b/package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
rename to package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
diff --git a/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch b/package/rpi-userland/0003-remove-faulty-assert.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
rename to package/rpi-userland/0003-remove-faulty-assert.patch
diff --git a/package/rpi-userland/rpi-userland-003-fix-musl-compile.patch b/package/rpi-userland/0004-fix-musl-compile.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-003-fix-musl-compile.patch
rename to package/rpi-userland/0004-fix-musl-compile.patch
diff --git a/package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch b/package/rpm/0001-uclibc-no-lfs-fix.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0-uclibc-no-lfs-fix.patch
rename to package/rpm/0001-uclibc-no-lfs-fix.patch
diff --git a/package/rpm/rpm-5.2.0_depends-fix.patch b/package/rpm/0002-depends-fix.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_depends-fix.patch
rename to package/rpm/0002-depends-fix.patch
diff --git a/package/rpm/rpm-5.2.0_exclude-some-tools.patch b/package/rpm/0003-exclude-some-tools.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_exclude-some-tools.patch
rename to package/rpm/0003-exclude-some-tools.patch
diff --git a/package/rpm/rpm-5.2.0_ignore-shared-mutexes.patch b/package/rpm/0004-ignore-shared-mutexes.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_ignore-shared-mutexes.patch
rename to package/rpm/0004-ignore-shared-mutexes.patch
diff --git a/package/rpm/rpm-5.2.0_no-parentdirs.patch b/package/rpm/0005-no-parentdirs.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_no-parentdirs.patch
rename to package/rpm/0005-no-parentdirs.patch
diff --git a/package/rpm/rpm-5.2.0_ordering-fix.patch b/package/rpm/0006-ordering-fix.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_ordering-fix.patch
rename to package/rpm/0006-ordering-fix.patch
diff --git a/package/rpm/rpm-5.2.0_parentdir-vs-requires.patch b/package/rpm/0007-parentdir-vs-requires.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
rename to package/rpm/0007-parentdir-vs-requires.patch
diff --git a/package/rpm/rpm-5.2.0_short-circuit-c99.patch b/package/rpm/0008-short-circuit-c99.patch
similarity index 100%
rename from package/rpm/rpm-5.2.0_short-circuit-c99.patch
rename to package/rpm/0008-short-circuit-c99.patch
diff --git a/package/rrdtool/rrdtool-automake-compat.patch b/package/rrdtool/0001-automake-compat.patch
similarity index 100%
rename from package/rrdtool/rrdtool-automake-compat.patch
rename to package/rrdtool/0001-automake-compat.patch
diff --git a/package/rrdtool/rrdtool-configure-dont-hardcode-include-dirs.patch b/package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch
similarity index 100%
rename from package/rrdtool/rrdtool-configure-dont-hardcode-include-dirs.patch
rename to package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch
diff --git a/package/rt-tests/rt-tests-fix-build-system.patch b/package/rt-tests/0001-fix-build-system.patch
similarity index 100%
rename from package/rt-tests/rt-tests-fix-build-system.patch
rename to package/rt-tests/0001-fix-build-system.patch
diff --git a/package/rt-tests/rt-tests-uclibc.patch b/package/rt-tests/0002-uclibc.patch
similarity index 100%
rename from package/rt-tests/rt-tests-uclibc.patch
rename to package/rt-tests/0002-uclibc.patch
diff --git a/package/rtorrent/rtorrent-cross_compile.patch b/package/rtorrent/0001-cross_compile.patch
similarity index 100%
rename from package/rtorrent/rtorrent-cross_compile.patch
rename to package/rtorrent/0001-cross_compile.patch
diff --git a/package/rtptools/rtptools-01-host2ip-no-nis-on-uClibc.patch b/package/rtptools/0001-host2ip-no-nis-on-uClibc.patch
similarity index 100%
rename from package/rtptools/rtptools-01-host2ip-no-nis-on-uClibc.patch
rename to package/rtptools/0001-host2ip-no-nis-on-uClibc.patch
diff --git a/package/rubix/rubix-1.0.5-dont-use-legacy-functions.patch b/package/rubix/0001-dont-use-legacy-functions.patch
similarity index 100%
rename from package/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
rename to package/rubix/0001-dont-use-legacy-functions.patch
diff --git a/package/rubix/rubix-1.0.5.patch b/package/rubix/0002-misc-fixes.patch
similarity index 100%
rename from package/rubix/rubix-1.0.5.patch
rename to package/rubix/0002-misc-fixes.patch
diff --git a/package/samba/samba-0001-fix-smbd-libs-avahi.patch b/package/samba/0001-fix-smbd-libs-avahi.patch
similarity index 100%
rename from package/samba/samba-0001-fix-smbd-libs-avahi.patch
rename to package/samba/0001-fix-smbd-libs-avahi.patch
diff --git a/package/samba/samba-0002-getaddrinfo.patch b/package/samba/0002-getaddrinfo.patch
similarity index 100%
rename from package/samba/samba-0002-getaddrinfo.patch
rename to package/samba/0002-getaddrinfo.patch
diff --git a/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch b/package/samba4/0003-build-find-FILE_OFFSET_BITS-via-array.patch
similarity index 100%
rename from package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
rename to package/samba4/0003-build-find-FILE_OFFSET_BITS-via-array.patch
diff --git a/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch b/package/samba4/0004-build-allow-some-python-variable-overrides.patch
similarity index 100%
rename from package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
rename to package/samba4/0004-build-allow-some-python-variable-overrides.patch
diff --git a/package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch b/package/samba4/0005-build-find-blkcnt_t-size-via-array.patch
similarity index 100%
rename from package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch
rename to package/samba4/0005-build-find-blkcnt_t-size-via-array.patch
diff --git a/package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch b/package/samba4/0006-build-unify-and-fix-endian-tests.patch
similarity index 100%
rename from package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch
rename to package/samba4/0006-build-unify-and-fix-endian-tests.patch
diff --git a/package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch b/package/samba4/0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
similarity index 100%
rename from package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
rename to package/samba4/0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
diff --git a/package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch b/package/samba4/0008-build-tweak-SIZEOF-utmp-ut_line.patch
similarity index 100%
rename from package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch
rename to package/samba4/0008-build-tweak-SIZEOF-utmp-ut_line.patch
diff --git a/package/samba4/samba4-0009-disable-libbsd.patch b/package/samba4/0009-disable-libbsd.patch
similarity index 100%
rename from package/samba4/samba4-0009-disable-libbsd.patch
rename to package/samba4/0009-disable-libbsd.patch
diff --git a/package/sane-backends/sane-backends-1.0.22-qcam-x86.patch b/package/sane-backends/0001-qcam-x86.patch
similarity index 100%
rename from package/sane-backends/sane-backends-1.0.22-qcam-x86.patch
rename to package/sane-backends/0001-qcam-x86.patch
diff --git a/package/sane-backends/sane-backends-1.0.22-v4l.patch b/package/sane-backends/0002-v4l.patch
similarity index 100%
rename from package/sane-backends/sane-backends-1.0.22-v4l.patch
rename to package/sane-backends/0002-v4l.patch
diff --git a/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch b/package/sawman/0001-link-using-gcc-instead-of-ld.patch
similarity index 100%
rename from package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
rename to package/sawman/0001-link-using-gcc-instead-of-ld.patch
diff --git a/package/screen/screen-0001-compiler-sanity-checks.patch b/package/screen/0001-compiler-sanity-checks.patch
similarity index 100%
rename from package/screen/screen-0001-compiler-sanity-checks.patch
rename to package/screen/0001-compiler-sanity-checks.patch
diff --git a/package/screen/screen-0002-no-memcpy-fallback.patch b/package/screen/0002-no-memcpy-fallback.patch
similarity index 100%
rename from package/screen/screen-0002-no-memcpy-fallback.patch
rename to package/screen/0002-no-memcpy-fallback.patch
diff --git a/package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch b/package/screen/0003-cross-compilation-AC_TRY_RUN.patch
similarity index 100%
rename from package/screen/screen-0003-cross-compilation-AC_TRY_RUN.patch
rename to package/screen/0003-cross-compilation-AC_TRY_RUN.patch
diff --git a/package/screen/screen-0004-cross-compilation-ignore-host-fs.patch b/package/screen/0004-cross-compilation-ignore-host-fs.patch
similarity index 100%
rename from package/screen/screen-0004-cross-compilation-ignore-host-fs.patch
rename to package/screen/0004-cross-compilation-ignore-host-fs.patch
diff --git a/package/screen/screen-0005-avoid-identifying-as-SVR4.patch b/package/screen/0005-avoid-identifying-as-SVR4.patch
similarity index 100%
rename from package/screen/screen-0005-avoid-identifying-as-SVR4.patch
rename to package/screen/0005-avoid-identifying-as-SVR4.patch
diff --git a/package/screen/screen-0006-install-no-backup-binary.patch b/package/screen/0006-install-no-backup-binary.patch
similarity index 100%
rename from package/screen/screen-0006-install-no-backup-binary.patch
rename to package/screen/0006-install-no-backup-binary.patch
diff --git a/package/screen/screen-0007-install-always-chmod.patch b/package/screen/0007-install-always-chmod.patch
similarity index 100%
rename from package/screen/screen-0007-install-always-chmod.patch
rename to package/screen/0007-install-always-chmod.patch
diff --git a/package/screen/screen-0008-install-nonversioned-binary.patch b/package/screen/0008-install-nonversioned-binary.patch
similarity index 100%
rename from package/screen/screen-0008-install-nonversioned-binary.patch
rename to package/screen/0008-install-nonversioned-binary.patch
diff --git a/package/screen/screen-0009-install-dir-dependency.patch b/package/screen/0009-install-dir-dependency.patch
similarity index 100%
rename from package/screen/screen-0009-install-dir-dependency.patch
rename to package/screen/0009-install-dir-dependency.patch
diff --git a/package/screen/screen-0010-rename-sched_h.patch b/package/screen/0010-rename-sched_h.patch
similarity index 100%
rename from package/screen/screen-0010-rename-sched_h.patch
rename to package/screen/0010-rename-sched_h.patch
diff --git a/package/sdl/sdl-0001-use-correct-directfb-config.patch b/package/sdl/0001-use-correct-directfb-config.patch
similarity index 100%
rename from package/sdl/sdl-0001-use-correct-directfb-config.patch
rename to package/sdl/0001-use-correct-directfb-config.patch
diff --git a/package/sdl/sdl-0002-fix-compilation-with-libx11.patch b/package/sdl/0002-fix-compilation-with-libx11.patch
similarity index 100%
rename from package/sdl/sdl-0002-fix-compilation-with-libx11.patch
rename to package/sdl/0002-fix-compilation-with-libx11.patch
diff --git a/package/ser2net/ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch b/package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch
similarity index 100%
rename from package/ser2net/ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch
rename to package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch
diff --git a/package/setserial/setserial-0001-build-system-fix.patch b/package/setserial/0001-build-system-fix.patch
similarity index 100%
rename from package/setserial/setserial-0001-build-system-fix.patch
rename to package/setserial/0001-build-system-fix.patch
diff --git a/package/setserial/setserial-0002-tiocghayesesp-build-fix.patch b/package/setserial/0002-tiocghayesesp-build-fix.patch
similarity index 100%
rename from package/setserial/setserial-0002-tiocghayesesp-build-fix.patch
rename to package/setserial/0002-tiocghayesesp-build-fix.patch
diff --git a/package/sispmctl/sispmctl-01-configure-add-pkg-config-support.patch b/package/sispmctl/0001-configure-add-pkg-config-support.patch
similarity index 100%
rename from package/sispmctl/sispmctl-01-configure-add-pkg-config-support.patch
rename to package/sispmctl/0001-configure-add-pkg-config-support.patch
diff --git a/package/slang/slang-01-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
similarity index 100%
rename from package/slang/slang-01-slsh-libs.patch
rename to package/slang/0001-slsh-libs.patch
diff --git a/package/smstools3/smstools3-0000-fix-Makefile.patch b/package/smstools3/0001-fix-Makefile.patch
similarity index 100%
rename from package/smstools3/smstools3-0000-fix-Makefile.patch
rename to package/smstools3/0001-fix-Makefile.patch
diff --git a/package/snmppp/snmppp-01-Add-missing-includes.patch b/package/snmppp/0001-Add-missing-includes.patch
similarity index 100%
rename from package/snmppp/snmppp-01-Add-missing-includes.patch
rename to package/snmppp/0001-Add-missing-includes.patch
diff --git a/package/socat/socat-001-no-documentation.patch b/package/socat/0001-no-documentation.patch
similarity index 100%
rename from package/socat/socat-001-no-documentation.patch
rename to package/socat/0001-no-documentation.patch
diff --git a/package/sox/sox-0001-uclibc.patch b/package/sox/0001-uclibc.patch
similarity index 100%
rename from package/sox/sox-0001-uclibc.patch
rename to package/sox/0001-uclibc.patch
diff --git a/package/speex/speex-thumb2-support.patch b/package/speex/0001-thumb2-support.patch
similarity index 100%
rename from package/speex/speex-thumb2-support.patch
rename to package/speex/0001-thumb2-support.patch
diff --git a/package/spice/spice-0001-fix-missing-monitor_latency-argument.patch b/package/spice/0001-fix-missing-monitor_latency-argument.patch
similarity index 100%
rename from package/spice/spice-0001-fix-missing-monitor_latency-argument.patch
rename to package/spice/0001-fix-missing-monitor_latency-argument.patch
diff --git a/package/squid/squid-01-assume-get-certificate-ok.patch b/package/squid/0001-assume-get-certificate-ok.patch
similarity index 100%
rename from package/squid/squid-01-assume-get-certificate-ok.patch
rename to package/squid/0001-assume-get-certificate-ok.patch
diff --git a/package/squid/squid-02-missing-include-time_h.patch b/package/squid/0002-missing-include-time_h.patch
similarity index 100%
rename from package/squid/squid-02-missing-include-time_h.patch
rename to package/squid/0002-missing-include-time_h.patch
diff --git a/package/statserial/statserial-01-ncurses-link.patch b/package/statserial/0001-ncurses-link.patch
similarity index 100%
rename from package/statserial/statserial-01-ncurses-link.patch
rename to package/statserial/0001-ncurses-link.patch
diff --git a/package/strace/strace-0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch b/package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch
similarity index 100%
rename from package/strace/strace-0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch
rename to package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch
diff --git a/package/stress/stress-0001-Remove-largefile.patch b/package/stress/0001-Remove-largefile.patch
similarity index 100%
rename from package/stress/stress-0001-Remove-largefile.patch
rename to package/stress/0001-Remove-largefile.patch
diff --git a/package/sudo/sudo-0001-no-netgroup.patch b/package/sudo/0001-no-netgroup.patch
similarity index 100%
rename from package/sudo/sudo-0001-no-netgroup.patch
rename to package/sudo/0001-no-netgroup.patch
diff --git a/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch b/package/sudo/0002-drop-sspcflags-piecflags-for-host.patch
similarity index 100%
rename from package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
rename to package/sudo/0002-drop-sspcflags-piecflags-for-host.patch
diff --git a/package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch b/package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch
similarity index 100%
rename from package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch
rename to package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch
diff --git a/package/synergy/synergy-1.3.1-includes.patch b/package/synergy/0001-includes.patch
similarity index 100%
rename from package/synergy/synergy-1.3.1-includes.patch
rename to package/synergy/0001-includes.patch
diff --git a/package/synergy/synergy-1.3.1-remove-werror.patch b/package/synergy/0002-remove-werror.patch
similarity index 100%
rename from package/synergy/synergy-1.3.1-remove-werror.patch
rename to package/synergy/0002-remove-werror.patch
diff --git a/package/sysprof/sysprof-01-define-NT_GNU_BUILD_ID.patch b/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
similarity index 100%
rename from package/sysprof/sysprof-01-define-NT_GNU_BUILD_ID.patch
rename to package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
diff --git a/package/systemd/systemd-01-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
similarity index 100%
rename from package/systemd/systemd-01-fix-getty-unit.patch
rename to package/systemd/0001-fix-getty-unit.patch
diff --git a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
similarity index 100%
rename from package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
rename to package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
diff --git a/package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch b/package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
similarity index 100%
rename from package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch
rename to package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
diff --git a/package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
similarity index 100%
rename from package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
rename to package/taglib/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
diff --git a/package/tar/tar-0001-fix-build-failure.patch b/package/tar/0001-fix-build-failure.patch
similarity index 100%
rename from package/tar/tar-0001-fix-build-failure.patch
rename to package/tar/0001-fix-build-failure.patch
diff --git a/package/tcl/tcl-0001-dont-build-compat.patch b/package/tcl/0001-dont-build-compat.patch
similarity index 100%
rename from package/tcl/tcl-0001-dont-build-compat.patch
rename to package/tcl/0001-dont-build-compat.patch
diff --git a/package/thrift/thrift-01-libevent-cross.patch b/package/thrift/0001-libevent-cross.patch
similarity index 100%
rename from package/thrift/thrift-01-libevent-cross.patch
rename to package/thrift/0001-libevent-cross.patch
diff --git a/package/thrift/thrift-02-autoreconf.patch b/package/thrift/0002-autoreconf.patch
similarity index 100%
rename from package/thrift/thrift-02-autoreconf.patch
rename to package/thrift/0002-autoreconf.patch
diff --git a/package/thrift/thrift-03-zlib-cross.patch b/package/thrift/0003-zlib-cross.patch
similarity index 100%
rename from package/thrift/thrift-03-zlib-cross.patch
rename to package/thrift/0003-zlib-cross.patch
diff --git a/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch b/package/thrift/0004-failed-to-build-on-OSX-10.9-GM.patch
similarity index 100%
rename from package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
rename to package/thrift/0004-failed-to-build-on-OSX-10.9-GM.patch
diff --git a/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch b/package/thrift/0005-stdlib-and-boost-both-define-uint64_t.patch
similarity index 100%
rename from package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch
rename to package/thrift/0005-stdlib-and-boost-both-define-uint64_t.patch
diff --git a/package/thttpd/thttpd-2.25b-getline.patch b/package/thttpd/0001-getline.patch
similarity index 100%
rename from package/thttpd/thttpd-2.25b-getline.patch
rename to package/thttpd/0001-getline.patch
diff --git a/package/ti-gfx/ti-gfx-0000-newclkapi.patch b/package/ti-gfx/0001-newclkapi.patch
similarity index 100%
rename from package/ti-gfx/ti-gfx-0000-newclkapi.patch
rename to package/ti-gfx/0001-newclkapi.patch
diff --git a/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch b/package/ti-gfx/0002-fix-build-omaplfb-linux.patch
similarity index 100%
rename from package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
rename to package/ti-gfx/0002-fix-build-omaplfb-linux.patch
diff --git a/package/ti-gfx/ti-gfx-km_install_modules.patch b/package/ti-gfx/0003-km_install_modules.patch
similarity index 100%
rename from package/ti-gfx/ti-gfx-km_install_modules.patch
rename to package/ti-gfx/0003-km_install_modules.patch
diff --git a/package/tinyhttpd/tinyhttpd.patch b/package/tinyhttpd/0001-misc-fixes.patch
similarity index 100%
rename from package/tinyhttpd/tinyhttpd.patch
rename to package/tinyhttpd/0001-misc-fixes.patch
diff --git a/package/tn5250/tn5250-01-ssldir.patch b/package/tn5250/0001-ssldir.patch
similarity index 100%
rename from package/tn5250/tn5250-01-ssldir.patch
rename to package/tn5250/0001-ssldir.patch
diff --git a/package/trace-cmd/trace-cmd-0001-Fix-ptrace-detection.patch b/package/trace-cmd/0001-Fix-ptrace-detection.patch
similarity index 100%
rename from package/trace-cmd/trace-cmd-0001-Fix-ptrace-detection.patch
rename to package/trace-cmd/0001-Fix-ptrace-detection.patch
diff --git a/package/transmission/transmission-01-fix-utypes.patch b/package/transmission/0001-fix-utypes.patch
similarity index 100%
rename from package/transmission/transmission-01-fix-utypes.patch
rename to package/transmission/0001-fix-utypes.patch
diff --git a/package/tslib/tslib-enable_raw_module.patch b/package/tslib/0001-enable_raw_module.patch
similarity index 100%
rename from package/tslib/tslib-enable_raw_module.patch
rename to package/tslib/0001-enable_raw_module.patch
diff --git a/package/tslib/tslib_add_finddef_and_inputattach_utils.patch b/package/tslib/0002-add_finddef_and_inputattach_utils.patch
similarity index 100%
rename from package/tslib/tslib_add_finddef_and_inputattach_utils.patch
rename to package/tslib/0002-add_finddef_and_inputattach_utils.patch
diff --git a/package/tstools/tstools-001-build-get-along-with-buildroot.patch b/package/tstools/0001-build-get-along-with-buildroot.patch
similarity index 100%
rename from package/tstools/tstools-001-build-get-along-with-buildroot.patch
rename to package/tstools/0001-build-get-along-with-buildroot.patch
diff --git a/package/tstools/tstools-002-build-fix-parallel-build-failure.patch b/package/tstools/0002-build-fix-parallel-build-failure.patch
similarity index 100%
rename from package/tstools/tstools-002-build-fix-parallel-build-failure.patch
rename to package/tstools/0002-build-fix-parallel-build-failure.patch
diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/0002-no-check_config.patch
similarity index 100%
rename from package/tvheadend/tvheadend-002-no-check_config.patch
rename to package/tvheadend/0002-no-check_config.patch
diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/0003-remove-werror.patch
similarity index 100%
rename from package/tvheadend/tvheadend-003-remove-werror.patch
rename to package/tvheadend/0003-remove-werror.patch
diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
rename to package/uboot-tools/0001-drop-configh-from-tools.patch
diff --git a/package/uboot-tools/uboot-tools-02-nostrip.patch b/package/uboot-tools/0002-nostrip.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-02-nostrip.patch
rename to package/uboot-tools/0002-nostrip.patch
diff --git a/package/udpcast/udpcast-select-h.patch b/package/udpcast/0001-select-h.patch
similarity index 100%
rename from package/udpcast/udpcast-select-h.patch
rename to package/udpcast/0001-select-h.patch
diff --git a/package/uemacs/uemacs-4.0.15-lt.01.patch b/package/uemacs/0001-lt.01.patch
similarity index 100%
rename from package/uemacs/uemacs-4.0.15-lt.01.patch
rename to package/uemacs/0001-lt.01.patch
diff --git a/package/uemacs/uemacs-4.0.15-lt.02.patch b/package/uemacs/0002-lt.02.patch
similarity index 100%
rename from package/uemacs/uemacs-4.0.15-lt.02.patch
rename to package/uemacs/0002-lt.02.patch
diff --git a/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch b/package/uemacs/0003-lt.03.ixon.patch
similarity index 100%
rename from package/uemacs/uemacs-4.0.15-lt.03.ixon.patch
rename to package/uemacs/0003-lt.03.ixon.patch
diff --git a/package/unionfs/unionfs-fuse-no-cxx-needed.patch b/package/unionfs/0001-fuse-no-cxx-needed.patch
similarity index 100%
rename from package/unionfs/unionfs-fuse-no-cxx-needed.patch
rename to package/unionfs/0001-fuse-no-cxx-needed.patch
diff --git a/package/urg/urg-select-h.patch b/package/urg/0001-select-h.patch
similarity index 100%
rename from package/urg/urg-select-h.patch
rename to package/urg/0001-select-h.patch
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/0001-makefile.patch
similarity index 100%
rename from package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
rename to package/usb_modeswitch_data/0001-makefile.patch
diff --git a/package/usbmount/usbmount-rules-fix.patch b/package/usbmount/0001-rules-fix.patch
similarity index 100%
rename from package/usbmount/usbmount-rules-fix.patch
rename to package/usbmount/0001-rules-fix.patch
diff --git a/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch b/package/usbmount/0002-use-udev-environment-instead-of-blkid.patch
similarity index 100%
rename from package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch
rename to package/usbmount/0002-use-udev-environment-instead-of-blkid.patch
diff --git a/package/ushare/ushare-compile-fixes.patch b/package/ushare/0001-compile-fixes.patch
similarity index 100%
rename from package/ushare/ushare-compile-fixes.patch
rename to package/ushare/0001-compile-fixes.patch
diff --git a/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch b/package/ussp-push/0001-fix-build-against-bluez-4.patch
similarity index 100%
rename from package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
rename to package/ussp-push/0001-fix-build-against-bluez-4.patch
diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/0001-sscanf-no-ms-as.patch
similarity index 100%
rename from package/util-linux/util-linux-001-sscanf-no-ms-as.patch
rename to package/util-linux/0001-sscanf-no-ms-as.patch
diff --git a/package/util-linux/util-linux-002-program-invocation-short-name.patch b/package/util-linux/0002-program-invocation-short-name.patch
similarity index 100%
rename from package/util-linux/util-linux-002-program-invocation-short-name.patch
rename to package/util-linux/0002-program-invocation-short-name.patch
diff --git a/package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch b/package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
similarity index 100%
rename from package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
rename to package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
diff --git a/package/vala/vala-dont-add-dirty-to-valac-version.patch b/package/vala/0001-dont-add-dirty-to-valac-version.patch
similarity index 100%
rename from package/vala/vala-dont-add-dirty-to-valac-version.patch
rename to package/vala/0001-dont-add-dirty-to-valac-version.patch
diff --git a/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
similarity index 100%
rename from package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
rename to package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
diff --git a/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch b/package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
similarity index 100%
rename from package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
rename to package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
diff --git a/package/valgrind/valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch b/package/valgrind/0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
similarity index 100%
rename from package/valgrind/valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
rename to package/valgrind/0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
diff --git a/package/vde2/vde2-no-cxx.patch b/package/vde2/0001-no-cxx.patch
similarity index 100%
rename from package/vde2/vde2-no-cxx.patch
rename to package/vde2/0001-no-cxx.patch
diff --git a/package/vlc/vlc-0001-vlc-static.patch b/package/vlc/0001-vlc-static.patch
similarity index 100%
rename from package/vlc/vlc-0001-vlc-static.patch
rename to package/vlc/0001-vlc-static.patch
diff --git a/package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
similarity index 100%
rename from package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch
rename to package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
diff --git a/package/vlc/vlc-0003-automake-add-subdir-objects-option.patch b/package/vlc/0003-automake-add-subdir-objects-option.patch
similarity index 100%
rename from package/vlc/vlc-0003-automake-add-subdir-objects-option.patch
rename to package/vlc/0003-automake-add-subdir-objects-option.patch
diff --git a/package/vlc/vlc-0004-libav.patch b/package/vlc/0004-libav.patch
similarity index 100%
rename from package/vlc/vlc-0004-libav.patch
rename to package/vlc/0004-libav.patch
diff --git a/package/vpnc/vpnc-0.5.3-fix-build.patch b/package/vpnc/0001-fix-build.patch
similarity index 100%
rename from package/vpnc/vpnc-0.5.3-fix-build.patch
rename to package/vpnc/0001-fix-build.patch
diff --git a/package/vpnc/vpnc-0.5.3-nomanual.patch b/package/vpnc/0002-nomanual.patch
similarity index 100%
rename from package/vpnc/vpnc-0.5.3-nomanual.patch
rename to package/vpnc/0002-nomanual.patch
diff --git a/package/vpnc/vpnc-0.5.3-susv3-legacy.patch b/package/vpnc/0003-susv3-legacy.patch
similarity index 100%
rename from package/vpnc/vpnc-0.5.3-susv3-legacy.patch
rename to package/vpnc/0003-susv3-legacy.patch
diff --git a/package/vsftpd/vsftpd-0001-utmpx-builddef.patch b/package/vsftpd/0001-utmpx-builddef.patch
similarity index 100%
rename from package/vsftpd/vsftpd-0001-utmpx-builddef.patch
rename to package/vsftpd/0001-utmpx-builddef.patch
diff --git a/package/vsftpd/vsftpd-dont-force-largefile.patch b/package/vsftpd/0002-dont-force-largefile.patch
similarity index 100%
rename from package/vsftpd/vsftpd-dont-force-largefile.patch
rename to package/vsftpd/0002-dont-force-largefile.patch
diff --git a/package/vtun/vtun-001-fix-installation.patch b/package/vtun/0001-fix-installation.patch
similarity index 100%
rename from package/vtun/vtun-001-fix-installation.patch
rename to package/vtun/0001-fix-installation.patch
diff --git a/package/vtun/vtun-002-fix-ssl-headers-checks.patch b/package/vtun/0002-fix-ssl-headers-checks.patch
similarity index 100%
rename from package/vtun/vtun-002-fix-ssl-headers-checks.patch
rename to package/vtun/0002-fix-ssl-headers-checks.patch
diff --git a/package/vtun/vtun-003-fixup-configure.in.patch b/package/vtun/0003-fixup-configure.in.patch
similarity index 100%
rename from package/vtun/vtun-003-fixup-configure.in.patch
rename to package/vtun/0003-fixup-configure.in.patch
diff --git a/package/webkit/webkit-0001-build-fix-for-32-bit-autotools.patch b/package/webkit/0001-build-fix-for-32-bit-autotools.patch
similarity index 100%
rename from package/webkit/webkit-0001-build-fix-for-32-bit-autotools.patch
rename to package/webkit/0001-build-fix-for-32-bit-autotools.patch
diff --git a/package/webkit/webkit-0002-build-fix-for-gtklauncher.patch b/package/webkit/0002-build-fix-for-gtklauncher.patch
similarity index 100%
rename from package/webkit/webkit-0002-build-fix-for-gtklauncher.patch
rename to package/webkit/0002-build-fix-for-gtklauncher.patch
diff --git a/package/webkit/webkit-0003-detect-harfbuzz-icu.patch b/package/webkit/0003-detect-harfbuzz-icu.patch
similarity index 100%
rename from package/webkit/webkit-0003-detect-harfbuzz-icu.patch
rename to package/webkit/0003-detect-harfbuzz-icu.patch
diff --git a/package/webkit/webkit-0004-disable-docrebase.patch b/package/webkit/0004-disable-docrebase.patch
similarity index 100%
rename from package/webkit/webkit-0004-disable-docrebase.patch
rename to package/webkit/0004-disable-docrebase.patch
diff --git a/package/webkit/webkit-0005-disable-tests.patch b/package/webkit/0005-disable-tests.patch
similarity index 100%
rename from package/webkit/webkit-0005-disable-tests.patch
rename to package/webkit/0005-disable-tests.patch
diff --git a/package/webkit/webkit-0006-execinfo_h.patch b/package/webkit/0006-execinfo_h.patch
similarity index 100%
rename from package/webkit/webkit-0006-execinfo_h.patch
rename to package/webkit/0006-execinfo_h.patch
diff --git a/package/webkit/webkit-0007-mips-dfg.patch b/package/webkit/0007-mips-dfg.patch
similarity index 100%
rename from package/webkit/webkit-0007-mips-dfg.patch
rename to package/webkit/0007-mips-dfg.patch
diff --git a/package/webkit/webkit-0008-support-bison-3.0.patch b/package/webkit/0008-support-bison-3.0.patch
similarity index 100%
rename from package/webkit/webkit-0008-support-bison-3.0.patch
rename to package/webkit/0008-support-bison-3.0.patch
diff --git a/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch b/package/wget/0001-spawn-fix-link-error-on-uclibc.patch
similarity index 100%
rename from package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
rename to package/wget/0001-spawn-fix-link-error-on-uclibc.patch
diff --git a/package/wipe/wipe-dont-force-lfs.patch b/package/wipe/0001-dont-force-lfs.patch
similarity index 100%
rename from package/wipe/wipe-dont-force-lfs.patch
rename to package/wipe/0001-dont-force-lfs.patch
diff --git a/package/wireless_tools/wireless_tools-01-remove-bzero.patch b/package/wireless_tools/0001-remove-bzero.patch
similarity index 100%
rename from package/wireless_tools/wireless_tools-01-remove-bzero.patch
rename to package/wireless_tools/0001-remove-bzero.patch
diff --git a/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch b/package/wireshark/0001-fix-wrong-cflags-for-build-assumption.patch
similarity index 100%
rename from package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
rename to package/wireshark/0001-fix-wrong-cflags-for-build-assumption.patch
diff --git a/package/wvdial/wvdial-0001-uClibc-scandir.patch b/package/wvdial/0001-uClibc-scandir.patch
similarity index 100%
rename from package/wvdial/wvdial-0001-uClibc-scandir.patch
rename to package/wvdial/0001-uClibc-scandir.patch
diff --git a/package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch b/package/wvstreams/0001-fix-uClibc-compile-getcontext.patch
similarity index 100%
rename from package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch
rename to package/wvstreams/0001-fix-uClibc-compile-getcontext.patch
diff --git a/package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch b/package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch
similarity index 100%
rename from package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch
rename to package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch
diff --git a/package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch b/package/wvstreams/0003-fix-uClibc-compile-misc.patch
similarity index 100%
rename from package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch
rename to package/wvstreams/0003-fix-uClibc-compile-misc.patch
diff --git a/package/wvstreams/wvstreams-0004-build-fixes.patch b/package/wvstreams/0004-build-fixes.patch
similarity index 100%
rename from package/wvstreams/wvstreams-0004-build-fixes.patch
rename to package/wvstreams/0004-build-fixes.patch
diff --git a/package/wvstreams/wvstreams-0005-getuid.patch b/package/wvstreams/0005-getuid.patch
similarity index 100%
rename from package/wvstreams/wvstreams-0005-getuid.patch
rename to package/wvstreams/0005-getuid.patch
diff --git a/package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch b/package/x11r7/xapp_luit/0001-posix-openpt.patch
similarity index 100%
rename from package/x11r7/xapp_luit/xapp_luit-posix-openpt.patch
rename to package/x11r7/xapp_luit/0001-posix-openpt.patch
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme-0001-fix-symlink.patch b/package/x11r7/xcursor-transparent-theme/0001-fix-symlink.patch
similarity index 100%
rename from package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme-0001-fix-symlink.patch
rename to package/x11r7/xcursor-transparent-theme/0001-fix-symlink.patch
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0001-fix-segfault.patch b/package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0001-fix-segfault.patch
rename to package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0002-port-abi-12.patch b/package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0002-port-abi-12.patch
rename to package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch b/package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch
rename to package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch b/package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch
rename to package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch b/package/x11r7/xdriver_xf86-video-geode/0001-include.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch
rename to package/x11r7/xdriver_xf86-video-geode/0001-include.patch
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch
rename to package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch
rename to package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch b/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
rename to package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch b/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
rename to package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch b/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
rename to package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
rename to package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch b/package/x11r7/xdriver_xf86-video-siliconmotion/0001-smi_driver.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch
rename to package/x11r7/xdriver_xf86-video-siliconmotion/0001-smi_driver.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0001-cross.patch b/package/x11r7/xdriver_xf86-video-sis/0001-cross.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0001-cross.patch
rename to package/x11r7/xdriver_xf86-video-sis/0001-cross.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-sis/0002-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-sis/0002-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch b/package/x11r7/xdriver_xf86-video-sis/0003-xf86UnMapVidMem.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch
rename to package/x11r7/xdriver_xf86-video-sis/0003-xf86UnMapVidMem.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch b/package/x11r7/xdriver_xf86-video-sis/0004-xf86Priv.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch
rename to package/x11r7/xdriver_xf86-video-sis/0004-xf86Priv.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch b/package/x11r7/xdriver_xf86-video-sis/0005-hvdisplay.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch
rename to package/x11r7/xdriver_xf86-video-sis/0005-hvdisplay.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch b/package/x11r7/xdriver_xf86-video-sis/0006-fixwarnings.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch
rename to package/x11r7/xdriver_xf86-video-sis/0006-fixwarnings.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch b/package/x11r7/xdriver_xf86-video-sis/0007-xi.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch
rename to package/x11r7/xdriver_xf86-video-sis/0007-xi.patch
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0001-cross.patch b/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0001-cross.patch
rename to package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-trident/0001-mibstore.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0001-mibstore.patch
rename to package/x11r7/xdriver_xf86-video-trident/0001-mibstore.patch
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0002-xaa.patch b/package/x11r7/xdriver_xf86-video-trident/0002-xaa.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0002-xaa.patch
rename to package/x11r7/xdriver_xf86-video-trident/0002-xaa.patch
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch b/package/x11r7/xlib_libXpm/0001-fork-check.patch
similarity index 100%
rename from package/x11r7/xlib_libXpm/xlib_libXpm-01-fork-check.patch
rename to package/x11r7/xlib_libXpm/0001-fork-check.patch
diff --git a/package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch b/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
similarity index 100%
rename from package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch
rename to package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch b/package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
rename to package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch b/package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch
rename to package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch b/package/x11r7/xserver_xorg-server/0003-microblaze.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch
rename to package/x11r7/xserver_xorg-server/0003-microblaze.patch
diff --git a/package/x11vnc/x11vnc-ipv6.patch b/package/x11vnc/0001-ipv6.patch
similarity index 100%
rename from package/x11vnc/x11vnc-ipv6.patch
rename to package/x11vnc/0001-ipv6.patch
diff --git a/package/xbmc/xbmc-0001-Fixup-include-path.patch b/package/xbmc/0001-Fixup-include-path.patch
similarity index 100%
rename from package/xbmc/xbmc-0001-Fixup-include-path.patch
rename to package/xbmc/0001-Fixup-include-path.patch
diff --git a/package/xbmc/xbmc-0002-mathutil.patch b/package/xbmc/0002-mathutil.patch
similarity index 100%
rename from package/xbmc/xbmc-0002-mathutil.patch
rename to package/xbmc/0002-mathutil.patch
diff --git a/package/xbmc/xbmc-0003-dbus.patch b/package/xbmc/0003-dbus.patch
similarity index 100%
rename from package/xbmc/xbmc-0003-dbus.patch
rename to package/xbmc/0003-dbus.patch
diff --git a/package/xinetd/xinetd-001-ar.patch b/package/xinetd/0001-ar.patch
similarity index 100%
rename from package/xinetd/xinetd-001-ar.patch
rename to package/xinetd/0001-ar.patch
diff --git a/package/xinetd/xinetd-002-destdir.patch b/package/xinetd/0002-destdir.patch
similarity index 100%
rename from package/xinetd/xinetd-002-destdir.patch
rename to package/xinetd/0002-destdir.patch
diff --git a/package/xinetd/xinetd-003-rpc-fix.patch b/package/xinetd/0003-rpc-fix.patch
similarity index 100%
rename from package/xinetd/xinetd-003-rpc-fix.patch
rename to package/xinetd/0003-rpc-fix.patch
diff --git a/package/xinetd/xinetd-004-configure-rlim_t.patch b/package/xinetd/0004-configure-rlim_t.patch
similarity index 100%
rename from package/xinetd/xinetd-004-configure-rlim_t.patch
rename to package/xinetd/0004-configure-rlim_t.patch
diff --git a/package/xl2tp/xl2tp-legacy.patch b/package/xl2tp/0001-legacy.patch
similarity index 100%
rename from package/xl2tp/xl2tp-legacy.patch
rename to package/xl2tp/0001-legacy.patch
diff --git a/package/xscreensaver/xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch b/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
similarity index 100%
rename from package/xscreensaver/xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch
rename to package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
diff --git a/package/xscreensaver/xscreensaver-0002-fix-minixpm-build-problem.patch b/package/xscreensaver/0002-fix-minixpm-build-problem.patch
similarity index 100%
rename from package/xscreensaver/xscreensaver-0002-fix-minixpm-build-problem.patch
rename to package/xscreensaver/0002-fix-minixpm-build-problem.patch
diff --git a/package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch b/package/xscreensaver/0003-driver-fix-linking-with-lintl.patch
similarity index 100%
rename from package/xscreensaver/xscreensaver-0003-driver-fix-linking-with-lintl.patch
rename to package/xscreensaver/0003-driver-fix-linking-with-lintl.patch
diff --git a/package/xvkbd/xvkbd-makefile.patch b/package/xvkbd/0001-makefile.patch
similarity index 100%
rename from package/xvkbd/xvkbd-makefile.patch
rename to package/xvkbd/0001-makefile.patch
diff --git a/package/yajl/yajl-0001-math-link.patch b/package/yajl/0001-math-link.patch
similarity index 100%
rename from package/yajl/yajl-0001-math-link.patch
rename to package/yajl/0001-math-link.patch
diff --git a/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
similarity index 100%
rename from package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
rename to package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/0001-CMake-cross-compile-mkdata.patch
similarity index 100%
rename from package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
rename to package/ympd/0001-CMake-cross-compile-mkdata.patch
diff --git a/package/ympd/ympd-0002-only-c-language.patch b/package/ympd/0002-only-c-language.patch
similarity index 100%
rename from package/ympd/ympd-0002-only-c-language.patch
rename to package/ympd/0002-only-c-language.patch
diff --git a/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch b/package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
similarity index 100%
rename from package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
rename to package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
diff --git a/package/zic/zic-fix-dependencies.patch b/package/zic/0001-fix-dependencies.patch
similarity index 100%
rename from package/zic/zic-fix-dependencies.patch
rename to package/zic/0001-fix-dependencies.patch
diff --git a/package/zlog/zlog-01-fix-compiling-on-Buildroot.patch b/package/zlog/0001-fix-compiling-on-Buildroot.patch
similarity index 100%
rename from package/zlog/zlog-01-fix-compiling-on-Buildroot.patch
rename to package/zlog/0001-fix-compiling-on-Buildroot.patch
diff --git a/package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch b/package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch
similarity index 100%
rename from package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch
rename to package/zlog/0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch
diff --git a/package/znc/znc-01-time.patch b/package/znc/0001-time.patch
similarity index 100%
rename from package/znc/znc-01-time.patch
rename to package/znc/0001-time.patch
diff --git a/package/zxing/zxing-makefile.patch b/package/zxing/0001-makefile.patch
similarity index 100%
rename from package/zxing/zxing-makefile.patch
rename to package/zxing/0001-makefile.patch
-- 
2.1.2
