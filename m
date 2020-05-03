From: Renato Moutinho <renato.moutinho@gmail.com>
Date: Sun, 3 May 2020 08:28:07 -0300
Subject: [Buildroot] Issue compiling on Ubuntu under WSL
In-Reply-To: <CA+1XQnkaNvzxb2gyse=UOR1AvE=uxCks7KuLmPmbmdgusDd+GQ@mail.gmail.com>
References: <CA+1XQnkaNvzxb2gyse=UOR1AvE=uxCks7KuLmPmbmdgusDd+GQ@mail.gmail.com>
Message-ID: <CA+1XQn=Np1jRm6A+drXhFaWrzUHR2yfHcXTvNFL6HHhJUTy5JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

    I've been trying to compile buildroot on Unbuntu running under WSL. I
assume this isn't a supported configuration but my intention is to provide
additional information for an issue opened on WSL's github.

Ultimately, the build fails with the error reported below. What I wanted to
do is prefix this last *mv *command with an *strace *so I can submit
additional information to the WSL dev team but I'm unable to find the *Makefile
*responsible for this command specifically. Can anyone help me with this?

xzcat
/home/moutinho/buildroot-labs/buildroot/dl/toolchain-external-arm-arm/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
| tar --strip-components=1 -C
/home/moutinho/buildroot-labs/buildroot/output/build/toolchain-external-arm-arm-2019.12
--exclude='usr/lib/locale/*'   -xf -
rm -rf /home/moutinho/buildroot-labs/buildroot/output/host/opt/ext-toolchain
mkdir -p
/home/moutinho/buildroot-labs/buildroot/output/host/opt/ext-toolchain
mv
/home/moutinho/buildroot-labs/buildroot/output/build/toolchain-external-arm-arm-2019.12/*
/home/moutinho/buildroot-labs/buildroot/output/host/opt/ext-toolchain/
mv: cannot move
'/home/moutinho/buildroot-labs/buildroot/output/build/toolchain-external-arm-arm-2019.12/arm-none-linux-gnueabihf'
to
'/home/moutinho/buildroot-labs/buildroot/output/host/opt/ext-toolchain/arm-none-linux-gnueabihf':
Permission denied
package/pkg-generic.mk:193: recipe for target
'/home/moutinho/buildroot-labs/buildroot/output/build/toolchain-external-arm-arm-2019.12/.stamp_extracted'
failed
make[1]: ***
[/home/moutinho/buildroot-labs/buildroot/output/build/toolchain-external-arm-arm-2019.12/.stamp_extracted]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Best regards,

Renato
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200503/f45e7011/attachment.html>
