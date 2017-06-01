From: Christian Stewart <christian@paral.in>
Date: Thu, 1 Jun 2017 16:35:43 -0700
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87fufjgycd.fsf@dell.be.48ers.dk>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Jun 1, 2017 at 3:03 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Can you paste a few more lines above this error?

Here:

>>> systemd 233 Building
PATH="/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/bin:/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/sbin:/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/usr/bin:/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/5.4.0:/home/hristian/go/bin:/home/hristian/.powerline/scripts"
 /usr/bin/make -j17  -C
/home/hristian/jpl_skiff/skiff/buildroot-work/output/build/systemd-233/
make[1]: Entering directory
'/home/hristian/jpl_skiff/skiff/buildroot-work/output/build/systemd-233'
/usr/bin/make --no-print-directory all-recursive
Making all in .
  CCLD     libnetworkd-core.la
  CCLD     libnss_systemd.la
  CCLD     libnss_myhostname.la
  CCLD     libnss_resolve.la
  CCLD     systemd-cgtop
  CCLD     systemd-cgls
  CCLD     systemd-nspawn
  CCLD     systemd-detect-virt
  CCLD     systemd-delta
  CCLD     systemd-analyze
  CCLD     systemd-run
  CCLD     systemd-mount
  CCLD     systemd-stdio-bridge
  CCLD     systemd-path
  CCLD     hostnamectl
  CCLD     systemd-socket-activate
  CCLD     timedatectl
  CCLD     systemd-resolve
  CCLD     systemd-notify
  CCLD     systemd-ask-password
  CCLD     systemd-tty-ask-password-agent
  CCLD     systemctl
  CCLD     systemd-machine-id-setup
  CCLD     systemd-escape
  CCLD     systemd-tmpfiles
  CCLD     systemd-hwdb
  CCLD     systemd
  CCLD     systemd-cgroups-agent
  CCLD     systemd-initctl
  CCLD     systemd-remount-fs
  CCLD     systemd-volatile-root
  CCLD     systemd-reply-password
/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam.so: incompatible target
/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam_misc.so: incompatible target
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:12503: systemd-analyze] Error 1
make[3]: *** Waiting for unfinished jobs....
/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam.so: incompatible target
/home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam_misc.so: incompatible target
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:12475: systemd] Error 1
make[2]: *** [Makefile:22633: all-recursive] Error 1
make[1]: *** [Makefile:10160: all] Error 2
make[1]: Leaving directory
'/home/hristian/jpl_skiff/skiff/buildroot-work/output/build/systemd-233'
make: *** [package/pkg-generic.mk:230:
/home/hristian/jpl_skiff/skiff/buildroot-work/output/build/systemd-233/.stamp_built]
Error 2

Thanks,
Christian Stewart
