From: Adam Baxter <voltagex@voltagex.org>
Date: Tue, 11 Apr 2017 20:50:48 +1000
Subject: [Buildroot] Problem with new external tree syntax?
Message-ID: <CAChFQ9R0w3gpqXeTjfVfYvHdnhE4aFcE1nPYTcZgw0deRWRsoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm having a problem with 2017.02 and the new BR2_EXTERNAL syntax.

external.desc is set, but the variable doesn't seem to be getting passed
through correctly.

voltagex at devbox:~/src/buildroot-skeleton$ make busybox
umask 0022 && make -C /home/voltagex/src/buildroot
O=/home/voltagex/src/buildroot-skeleton/build
BR2_EXTERNAL=/home/voltagex/src/buildroot-skeleton/external BR2_JLEVEL=12
busybox
for f in /configs/busybox.config ; do if [ ! -f "${f}" ]; then printf
"Kconfig fragment '%s' for '%s' does not exist\n" "${f}" "busybox"; exit 1;
fi; done
Kconfig fragment '/configs/busybox.config' for 'busybox' does not exist
package/busybox/busybox.mk:264: recipe for target '/configs/busybox.config'
failed
make[1]: *** [/configs/busybox.config] Error 1
Makefile:18: recipe for target '_all' failed
make: *** [_all] Error 2

The line that appears not to work in my defconfig is
BR2_PACKAGE_BUSYBOX_CONFIG="$(SKELETON_X86_64)/configs/busybox.config", as
you can see in the error message above.

The files I'm using are at
https://github.com/baxterworks-build/buildroot-skeleton/

Regards,
Adam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170411/a6556008/attachment.html>
