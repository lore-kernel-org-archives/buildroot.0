From: Christian Stewart <christian@paral.in>
Date: Fri, 2 Jun 2017 19:48:29 -0700
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
Message-ID: <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, Jun 1, 2017 at 4:35 PM, Christian Stewart <christian@paral.in> wrote:
> /home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam.so: incompatible target
> /home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam_misc.so: incompatible target
> collect2: error: ld returned 1 exit status
> make[3]: *** [Makefile:12503: systemd-analyze] Error 1
> make[3]: *** Waiting for unfinished jobs....
> /home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam.so: incompatible target
> /home/hristian/jpl_skiff/skiff/buildroot-work/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam_misc.so: incompatible target
> collect2: error: ld returned 1 exit status

Reproduced on several Gentoo machines. The environment looks clean. It
compiles just fine on any commit before
400eaa3452e9380ec77ac62266530055506ea6e7.

Thanks,
Christian
