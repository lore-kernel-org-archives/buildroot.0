From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Dec 2017 16:31:55 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87lghy2taa.fsf@paral.in>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87lghy2taa.fsf@paral.in>
Message-ID: <878tdy2q9w.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

Christian Stewart <christian@paral.in> writes:
> I'm still seeing this error under Gentoo against 2017.11:
>   CCLD     busctl
>   CCLD     systemd-socket-activate
> /lib/libpam.so: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
>
> defconfig:

I have found that the defconfig I sent in my previous email does not
reproduce the issue. The issue can successfully be reproduced against
2017.11 with the following defconfig:

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_CCACHE=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
BR2_BINUTILS_VERSION_2_27_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US en_US.UTF-8"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_PACKAGE_BUSYBOX_SELINUX=y

I'm not sure what it is in this set of config options that causes the problem.

Best,
Christian Stewart
