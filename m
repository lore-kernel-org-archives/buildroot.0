From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:20 +0200
Subject: [Buildroot] [PATCH 1/7] support/docker/Dockerfile: new package
 expect
In-Reply-To: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556555546-9246-2-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

expect package is required for various automation tests.
One use case is to integrate the script from toolchain builder :
https://github.com/bootlin/toolchains-builder/blob/master/build.sh
to check Qemu build states.
expect can be used to launch a qemu machine for a given
architecture (x86, x86_64, mips, arm, sparc, nios2, ..., etc),
send root password,  wait for login and then perform shutdown.

Special note concerning python-pexpect package which can be
used for the same task: After testing the package, We
have noticed that it does not show the automation process
correcly (you may not even see the message welcome to buildroot)
and it is not verbose when errors are encountered.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
v2: reorder alphabetically
    Remove m68k kernel issue, since we use kernel 4.19 with qemu
    m68k defconfig. The patch fixing the issue was merged in
    kernel 4.17.
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 36cd3b2..8dcd3ef 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -29,6 +29,7 @@ RUN apt-get install -y --no-install-recommends \
         cmake \
         cpio \
         cvs \
+        expect \
         file \
         g++-multilib \
         git \
-- 
2.7.4
