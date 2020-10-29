From: Eric Dong <eric.dongxx@gmail.com>
Date: Thu, 29 Oct 2020 16:02:56 +0800
Subject: [Buildroot] Issues when building pycapnp-0.6.4
Message-ID: <CA+JNVMx3_Phq4k7dvDhvKJVhXzKWvgs3XRQ8SE_yFzd0f2tzWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot community,

I am now trying to cross compile the pycapnp
https://pypi.org/project/pycapnp/ with buildroot-2020.02.7. Make menuconfig
to select an external toolchain from
gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf, ARMv7 architecture.

Find out that pycapnp is dependent on capnproto which has support in
buildroot. So after successfully building the capnproto, I tried to add in
the pycapnp package in the buildroot.

Initially, having problems downloading when "fetching
https://capnproto.org/capnproto-c++-0.6.1.tar.gz into bundled", error:
<urlopen error unknown url type: https>. Then I downloaded it manually,
tweaked the configure script
in build/python-pycapnp-0.6.4/buildutils/build.py:
conf = subprocess.Popen(['./configure', '--disable-shared', '--prefix',
build_dir, "--build=x86_64-linux-gnu", "--host=arm-linux-gnueabihf",
"--target=arm-linux-gnueabihf"], cwd=capnp_dir, stdout=stdout)

But having problems building the package, seems the pycapnp building
process invokes the executable *capnp* binaries on the target instead of
host one. The error log and python-package metadata can be seen here:
https://gist.github.com/Eric97/e3269346a6ad7648ef734fbc5b5f18c7

Thanks,
Eric
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201029/3b7a14f5/attachment.html>
