From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 12:02:55 +0200
Subject: [Buildroot] buildroot | Pipeline #7531221 has failed for master
	| f78b2c13
In-Reply-To: <58e9fbce8c9e8_17973fbd9c776b74668e1@worker-kiq07.fe.gitlab.com.mail>
References: <58e9fbce8c9e8_17973fbd9c776b74668e1@worker-kiq07.fe.gitlab.com.mail>
Message-ID: <20170409120255.0155c3fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Arnout,

In the below results, most of the failures are caused by an issue in
uboot.mk. However, I have committed and pushed a fix for this yesterday
(https://git.buildroot.org/buildroot/commit/?id=61038e36b65696c2f29107d5dbc031c66526ea0c).
But apparently, gitlab has used an older commit
(https://gitlab.com/buildroot.org/buildroot/commit/f78b2c13d1a5b4a7903186cf6cc53299791d0da5)
for the builds.

Why a gitlab build triggered this morning at 8 AM does not use the
latest Buildroot tree? It should definitely have used a Buildroot tree
recent enough to have the U-Boot issue fixed.

Thanks!

Thomas

On Sun, 09 Apr 2017 09:15:58 +0000, GitLab wrote:
> Your pipeline has failed.
> 
> Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
> Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )
> 
> Commit: f78b2c13 ( https://gitlab.com/buildroot.org/buildroot/commit/f78b2c13d1a5b4a7903186cf6cc53299791d0da5 )
> Commit Message: mosquitto: enable WITH_ADNS for glibc builds
> 
> W...
> Commit Author: Fabrice Fontaine
> 
> Pipeline #7531221 ( https://gitlab.com/buildroot.org/buildroot/pipelines/7531221 ) had 59 failed builds.
> 
> Job #13973020 ( https://gitlab.com/buildroot.org/buildroot/builds/13973020 )
> 
> Stage: test
> Name: beaglebone_qt5_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/qt5declarative-5.8.0/.stamp_built] Error 2
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973020 responseStatus[0;m=201 Created token[0;m=thiRWs1c
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973011 ( https://gitlab.com/buildroot.org/buildroot/builds/13973011 )
> 
> Stage: test
> Name: atmel_sama5d3_xplained_mmc_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973011 responseStatus[0;m=201 Created token[0;m=jiQFMu_p
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973039 ( https://gitlab.com/buildroot.org/buildroot/builds/13973039 )
> 
> Stage: test
> Name: galileo_defconfig
> Trace: [0KRunning with gitlab-ci-multi-runner 9.0.1 (a3da309)
>   on docker-auto-scale (4e4528ca)
> [0;m[0KUsing Docker executor with image debian:stable ...
> [0;m[0KUsing docker image sha256:3a9793d0a71a8c6dca567d52535a620d73273f0b3cdf64af0c8aca9889912fb5 ID=sha256:3a9793d0a71a8c6dca567d52535a620d73273f0b3cdf64af0c8aca9889912fb5 for predefined container...
> [0;m[0KPulling docker image debian:stable ...
> [0;m[0KUsing docker image debian:stable ID=sha256:4f0a4f3c13a4e2235dfe8d18854910c8603aa1da8f99f198954baef9cdbfe517 for build container...
> [0;mRunning on runner-4e4528ca-project-2648174-concurrent-0 via runner-4e4528ca-machine-1491715403-7b69917c-digital-ocean-2gb...
> [32;1mCloning repository...[0;m
> Cloning into '/builds/buildroot.org/buildroot'...
> 
> 
> Job #13973023 ( https://gitlab.com/buildroot.org/buildroot/builds/13973023 )
> 
> Stage: test
> Name: csky_gx6605s_defconfig
> Trace: [0;m[0KUsing docker image sha256:00566ac1a5086c85eac83b220656a921cd7dda5a3d95a1f85d41b9032ebf20b8 ID=sha256:00566ac1a5086c85eac83b220656a921cd7dda5a3d95a1f85d41b9032ebf20b8 for predefined container...
> [0;m[0KPulling docker image debian:stable ...
> [0;m[0KUsing docker image debian:stable ID=sha256:4f0a4f3c13a4e2235dfe8d18854910c8603aa1da8f99f198954baef9cdbfe517 for build container...
> [0;mRunning on runner-e11ae361-project-2648174-concurrent-0 via runner-e11ae361-machine-1491713728-371f6a9e-digital-ocean-2gb...
> [32;1mCloning repository...[0;m
> Cloning into '/builds/buildroot.org/buildroot'...
> [32;1mChecking out f78b2c13 as master...[0;m
> [32;1mSkipping Git submodules setup[0;m
> [32;1m$ dpkg --add-architecture i386[0;m
> [32;1m$ apt-get update -qq[0;m
> 
> 
> Job #13972997 ( https://gitlab.com/buildroot.org/buildroot/builds/13972997 )
> 
> Stage: test
> Name: armadeus_apf9328_defconfig
> Trace: [0KRunning with gitlab-ci-multi-runner 9.0.1 (a3da309)
>   on docker-auto-scale (e11ae361)
> [0;m[0KUsing Docker executor with image debian:stable ...
> [0;m[0KUsing docker image sha256:f32df8f462ce2dad587d88938c87b024f258ab9144288e8c8af8a8dfd6793c53 ID=sha256:f32df8f462ce2dad587d88938c87b024f258ab9144288e8c8af8a8dfd6793c53 for predefined container...
> [0;m[0KPulling docker image debian:stable ...
> [0;m[0KUsing docker image debian:stable ID=sha256:4f0a4f3c13a4e2235dfe8d18854910c8603aa1da8f99f198954baef9cdbfe517 for build container...
> [0;mRunning on runner-e11ae361-project-2648174-concurrent-0 via runner-e11ae361-machine-1491713656-f1d35262-digital-ocean-2gb...
> [32;1mCloning repository...[0;m
> Cloning into '/builds/buildroot.org/buildroot'...
> 
> 
> Job #13972986 ( https://gitlab.com/buildroot.org/buildroot/builds/13972986 )
> 
> Stage: test
> Name: check-gitlab-ci.yml
> Trace: [0KRunning with gitlab-ci-multi-runner 9.0.1 (a3da309)
>   on docker-auto-scale (4e4528ca)
> [0;m[0KUsing Docker executor with image debian:stable ...
> [0;m[0KUsing docker image sha256:77bf3e58833817470f7b3706f9c7df6e21760db3bf01f633c66391490f7650bb ID=sha256:77bf3e58833817470f7b3706f9c7df6e21760db3bf01f633c66391490f7650bb for predefined container...
> [0;m[0KPulling docker image debian:stable ...
> [0;m[0KUsing docker image debian:stable ID=sha256:4f0a4f3c13a4e2235dfe8d18854910c8603aa1da8f99f198954baef9cdbfe517 for build container...
> [0;mRunning on runner-4e4528ca-project-2648174-concurrent-0 via runner-4e4528ca-machine-1491713687-8cc00a25-digital-ocean-2gb...
> [32;1mCloning repository...[0;m
> Cloning into '/builds/buildroot.org/buildroot'...
> 
> 
> Job #13973048 ( https://gitlab.com/buildroot.org/buildroot/builds/13973048 )
> 
> Stage: test
> Name: minnowboard_max-graphical_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/images/rootfs.ext2] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 9 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973048 responseStatus[0;m=201 Created token[0;m=6gxynsjH
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973005 ( https://gitlab.com/buildroot.org/buildroot/builds/13973005 )
> 
> Stage: test
> Name: at91sam9x5ek_mmc_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973005 responseStatus[0;m=201 Created token[0;m=FKXB3w-Q
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973003 ( https://gitlab.com/buildroot.org/buildroot/builds/13973003 )
> 
> Stage: test
> Name: at91sam9x5ek_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973003 responseStatus[0;m=201 Created token[0;m=AXGTGpwd
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973009 ( https://gitlab.com/buildroot.org/buildroot/builds/13973009 )
> 
> Stage: test
> Name: atmel_sama5d3_xplained_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973009 responseStatus[0;m=201 Created token[0;m=Yj9TnR8Y
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973007 ( https://gitlab.com/buildroot.org/buildroot/builds/13973007 )
> 
> Stage: test
> Name: atmel_sama5d2_xplained_mmc_dev_defconfig
> Trace: >>> uboot linux4sam_5.5 Configuring
> >>> uboot linux4sam_5.5 Building  
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973007 responseStatus[0;m=201 Created token[0;m=xT47g6nx
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973014 ( https://gitlab.com/buildroot.org/buildroot/builds/13973014 )
> 
> Stage: test
> Name: atmel_sama5d4_xplained_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973014 responseStatus[0;m=201 Created token[0;m=q61syU42
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973019 ( https://gitlab.com/buildroot.org/buildroot/builds/13973019 )
> 
> Stage: test
> Name: beaglebone_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973019 responseStatus[0;m=201 Created token[0;m=j7LjrxZw
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973026 ( https://gitlab.com/buildroot.org/buildroot/builds/13973026 )
> 
> Stage: test
> Name: firefly_rk3288_demo_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973026 responseStatus[0;m=201 Created token[0;m=uCX-2RtM
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973016 ( https://gitlab.com/buildroot.org/buildroot/builds/13973016 )
> 
> Stage: test
> Name: atmel_sama5d4_xplained_mmc_dev_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973016 responseStatus[0;m=201 Created token[0;m=DAjiuawJ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973119 ( https://gitlab.com/buildroot.org/buildroot/builds/13973119 )
> 
> Stage: test
> Name: toradex_apalis_imx6_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-1ef4a29e8cea0239411dde64f9617ad76248fd02/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973119 responseStatus[0;m=201 Created token[0;m=Bn4HufXn
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973072 ( https://gitlab.com/buildroot.org/buildroot/builds/13973072 )
> 
> Stage: test
> Name: pc_x86_64_efi_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/images/rootfs.ext2] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 9 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973072 responseStatus[0;m=201 Created token[0;m=hxRNN_mQ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973071 ( https://gitlab.com/buildroot.org/buildroot/builds/13973071 )
> 
> Stage: test
> Name: pc_x86_64_bios_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/images/rootfs.ext2] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 5 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973071 responseStatus[0;m=201 Created token[0;m=uW9BzRVQ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973000 ( https://gitlab.com/buildroot.org/buildroot/builds/13973000 )
> 
> Stage: test
> Name: at91sam9g45m10ek_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973000 responseStatus[0;m=201 Created token[0;m=Z_oZR1AH
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973017 ( https://gitlab.com/buildroot.org/buildroot/builds/13973017 )
> 
> Stage: test
> Name: bananapro_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.03/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973017 responseStatus[0;m=201 Created token[0;m=iSKcypNc
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973108 ( https://gitlab.com/buildroot.org/buildroot/builds/13973108 )
> 
> Stage: test
> Name: roseapplepi_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-a035d2673a90143a1a74557503b2e137b1447ae6/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 2 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973108 responseStatus[0;m=201 Created token[0;m=b2FZVPnb
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973024 ( https://gitlab.com/buildroot.org/buildroot/builds/13973024 )
> 
> Stage: test
> Name: cubieboard2_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.05/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973024 responseStatus[0;m=201 Created token[0;m=urymKfHB
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973118 ( https://gitlab.com/buildroot.org/buildroot/builds/13973118 )
> 
> Stage: test
> Name: telit_evk_pro3_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.9.1/.stamp_built] Error 2
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 2 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973118 responseStatus[0;m=201 Created token[0;m=EGgq4kMQ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973126 ( https://gitlab.com/buildroot.org/buildroot/builds/13973126 )
> 
> Stage: test
> Name: zynq_microzed_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-xilinx-v2016.2/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973126 responseStatus[0;m=201 Created token[0;m=ZiotzG9o
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973056 ( https://gitlab.com/buildroot.org/buildroot/builds/13973056 )
> 
> Stage: test
> Name: nanopi_neo_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973056 responseStatus[0;m=201 Created token[0;m=-LArA3cz
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973010 ( https://gitlab.com/buildroot.org/buildroot/builds/13973010 )
> 
> Stage: test
> Name: atmel_sama5d3_xplained_mmc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973010 responseStatus[0;m=201 Created token[0;m=bW8biDv5
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973015 ( https://gitlab.com/buildroot.org/buildroot/builds/13973015 )
> 
> Stage: test
> Name: atmel_sama5d4_xplained_mmc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973015 responseStatus[0;m=201 Created token[0;m=CyBiRE-W
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973116 ( https://gitlab.com/buildroot.org/buildroot/builds/13973116 )
> 
> Stage: test
> Name: stm32f429_disco_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/busybox-1.26.2/.stamp_built] Error 2
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973116 responseStatus[0;m=201 Created token[0;m=yFcoYHH2
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973117 ( https://gitlab.com/buildroot.org/buildroot/builds/13973117 )
> 
> Stage: test
> Name: stm32f469_disco_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/busybox-1.26.2/.stamp_built] Error 2
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973117 responseStatus[0;m=201 Created token[0;m=AaHuUMCN
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973129 ( https://gitlab.com/buildroot.org/buildroot/builds/13973129 )
> 
> Stage: test
> Name: zynq_zybo_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.05/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973129 responseStatus[0;m=201 Created token[0;m=TxzgJdkK
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973070 ( https://gitlab.com/buildroot.org/buildroot/builds/13973070 )
> 
> Stage: test
> Name: pandaboard_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973070 responseStatus[0;m=201 Created token[0;m=2kukxKNU
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973008 ( https://gitlab.com/buildroot.org/buildroot/builds/13973008 )
> 
> Stage: test
> Name: atmel_sama5d3_xplained_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973008 responseStatus[0;m=201 Created token[0;m=pNvqDhx-
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973064 ( https://gitlab.com/buildroot.org/buildroot/builds/13973064 )
> 
> Stage: test
> Name: olimex_a20_olinuxino_lime_mali_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.03/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 2 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973064 responseStatus[0;m=201 Created token[0;m=e6x69BgF
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13972998 ( https://gitlab.com/buildroot.org/buildroot/builds/13972998 )
> 
> Stage: test
> Name: at91sam9260eknf_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13972998 responseStatus[0;m=201 Created token[0;m=dzATs4eZ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973069 ( https://gitlab.com/buildroot.org/buildroot/builds/13973069 )
> 
> Stage: test
> Name: orangepi_pc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973069 responseStatus[0;m=201 Created token[0;m=QC7wwVdp
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973110 ( https://gitlab.com/buildroot.org/buildroot/builds/13973110 )
> 
> Stage: test
> Name: sheevaplug_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.05/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973110 responseStatus[0;m=201 Created token[0;m=gsJpR3xk
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973018 ( https://gitlab.com/buildroot.org/buildroot/builds/13973018 )
> 
> Stage: test
> Name: beagleboardx15_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973018 responseStatus[0;m=201 Created token[0;m=9pxgacD_
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973047 ( https://gitlab.com/buildroot.org/buildroot/builds/13973047 )
> 
> Stage: test
> Name: linksprite_pcduino_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973047 responseStatus[0;m=201 Created token[0;m=qUbjiW3Q
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973013 ( https://gitlab.com/buildroot.org/buildroot/builds/13973013 )
> 
> Stage: test
> Name: atmel_sama5d4_xplained_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973013 responseStatus[0;m=201 Created token[0;m=65Mf-CPX
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973025 ( https://gitlab.com/buildroot.org/buildroot/builds/13973025 )
> 
> Stage: test
> Name: firefly_rk3288_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973025 responseStatus[0;m=201 Created token[0;m=PFcifSFt
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973066 ( https://gitlab.com/buildroot.org/buildroot/builds/13973066 )
> 
> Stage: test
> Name: olimex_imx233_olinuxino_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.03/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973066 responseStatus[0;m=201 Created token[0;m=2ATzL5xz
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973001 ( https://gitlab.com/buildroot.org/buildroot/builds/13973001 )
> 
> Stage: test
> Name: at91sam9rlek_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973001 responseStatus[0;m=201 Created token[0;m=qYVLpY-f
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973046 ( https://gitlab.com/buildroot.org/buildroot/builds/13973046 )
> 
> Stage: test
> Name: lego_ev3_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973046 responseStatus[0;m=201 Created token[0;m=c8xvn3rx
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973115 ( https://gitlab.com/buildroot.org/buildroot/builds/13973115 )
> 
> Stage: test
> Name: snps_axs103_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973115 responseStatus[0;m=201 Created token[0;m=7Dj35gJA
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973068 ( https://gitlab.com/buildroot.org/buildroot/builds/13973068 )
> 
> Stage: test
> Name: orangepi_one_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973068 responseStatus[0;m=201 Created token[0;m=s5y_Mxo9
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973042 ( https://gitlab.com/buildroot.org/buildroot/builds/13973042 )
> 
> Stage: test
> Name: grinn_liteboard_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973042 responseStatus[0;m=201 Created token[0;m=3eSq3cpR
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973063 ( https://gitlab.com/buildroot.org/buildroot/builds/13973063 )
> 
> Stage: test
> Name: olimex_a20_olinuxino_lime_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.03/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973063 responseStatus[0;m=201 Created token[0;m=d1jew2zK
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973127 ( https://gitlab.com/buildroot.org/buildroot/builds/13973127 )
> 
> Stage: test
> Name: zynq_zc706_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-xilinx-v2016.2/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973127 responseStatus[0;m=201 Created token[0;m=yxB7Bv3L
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973002 ( https://gitlab.com/buildroot.org/buildroot/builds/13973002 )
> 
> Stage: test
> Name: at91sam9x5ek_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973002 responseStatus[0;m=201 Created token[0;m=Rj6sr8Fz
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973128 ( https://gitlab.com/buildroot.org/buildroot/builds/13973128 )
> 
> Stage: test
> Name: zynq_zed_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-xilinx-v2016.2/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973128 responseStatus[0;m=201 Created token[0;m=tHaNfbKj
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973012 ( https://gitlab.com/buildroot.org/buildroot/builds/13973012 )
> 
> Stage: test
> Name: atmel_sama5d3xek_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973012 responseStatus[0;m=201 Created token[0;m=z9fCZdeM
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973062 ( https://gitlab.com/buildroot.org/buildroot/builds/13973062 )
> 
> Stage: test
> Name: olimex_a20_olinuxino_lime2_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.05/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 2 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973062 responseStatus[0;m=201 Created token[0;m=uy7UW9hy
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13972999 ( https://gitlab.com/buildroot.org/buildroot/builds/13972999 )
> 
> Stage: test
> Name: at91sam9g20dfc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.09.01/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13972999 responseStatus[0;m=201 Created token[0;m=z6ygrLm3
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973004 ( https://gitlab.com/buildroot.org/buildroot/builds/13973004 )
> 
> Stage: test
> Name: at91sam9x5ek_mmc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973004 responseStatus[0;m=201 Created token[0;m=54JYaViJ
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973075 ( https://gitlab.com/buildroot.org/buildroot/builds/13973075 )
> 
> Stage: test
> Name: qemu_arm_versatile_nommu_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/busybox-1.26.2/.stamp_built] Error 2
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973075 responseStatus[0;m=201 Created token[0;m=ysV2AmHV
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973041 ( https://gitlab.com/buildroot.org/buildroot/builds/13973041 )
> 
> Stage: test
> Name: grinn_chiliboard_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-aac477eca88dd81b18b48573ababee5112d571f3/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973041 responseStatus[0;m=201 Created token[0;m=UzMJpDmz
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973006 ( https://gitlab.com/buildroot.org/buildroot/builds/13973006 )
> 
> Stage: test
> Name: atmel_sama5d2_xplained_mmc_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-linux4sam_5.5/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 4 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973006 responseStatus[0;m=201 Created token[0;m=NxfsJkz1
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973112 ( https://gitlab.com/buildroot.org/buildroot/builds/13973112 )
> 
> Stage: test
> Name: snps_archs38_vdk_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-headers-4.10.8/.stamp_patched] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973112 responseStatus[0;m=201 Created token[0;m=MFnxsziC
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> Job #13973114 ( https://gitlab.com/buildroot.org/buildroot/builds/13973114 )
> 
> Stage: test
> Name: snps_axs101_defconfig
> Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.11/.stamp_built] Error 1
> [32;1m$ exit 1[0;m
> [32;1mUploading artifacts...[0;m
> build.log: found 1 matching files                 [0;m 
> output/images/: found 1 matching files            [0;m 
> output/build/build-time.log: found 1 matching files[0;m 
> output/build/packages-file-list.txt: found 1 matching files[0;m 
> Uploading artifacts to coordinator... ok          [0;m  id[0;m=13973114 responseStatus[0;m=201 Created token[0;m=gn-4eCoP
> [31;1mERROR: Job failed: exit code 1
> [0;m
> 
> 
> You're receiving this email because of your account on gitlab.com.
> Manage all notifications: https://gitlab.com/profile/notifications
> Help: https://gitlab.com/help



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
