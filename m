From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 25 Dec 2017 16:13:37 +0100
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87po73d1xz.fsf@paral.in>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org>
 <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org>
 <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de>
 <87po73d1xz.fsf@paral.in>
Message-ID: <20171225151337.GC27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Christian Stewart wrote,

> Hi Waldemar,
> 
> There are no extra pam files in my Buildroot tree - before building I
> ensure this with a "git clean -xfd" and I've searched the tree as well.

But that is strange then.
find . -name libpam_misc.so\*
./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0
./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so
./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0.82.1
./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so.0
./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so
./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so.0.82.1
./output/target/usr/lib/libpam_misc.so.0
./output/target/usr/lib/libpam_misc.so
./output/target/usr/lib/libpam_misc.so.0.82.1


Systemd wants to find libpam, if it is not there it seems to
fallback to your native libpam.

You should always run "make clean && make" if you make any
changes to your .config.

best regards
 Waldemar
