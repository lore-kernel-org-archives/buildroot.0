From: Mark Constable <markc@renta.net>
Date: Tue, 20 Oct 2009 23:55:01 +1000
Subject: [Buildroot] Git build fails for x86_64 target
Message-ID: <4ADDC135.6060109@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just built an i686 variant of i386 using the default settings then
changed the target to x86_64 and got this. If I knew how to fix it I
would supply a patch.

...
touch -c /home/br2/staging/usr/lib/libc.a
/usr/bin/make -j1 -C /home/br2/toolchain/uClibc-0.9.30.1 \
                ARCH="x86_64" \
                PREFIX=/home/br2/target \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/ \
                install_runtime
make[1]: Entering directory `/home/br2/toolchain/uClibc-0.9.30.1'
install -d /home/br2/target/lib
install -m 644 lib/lib*-0.9.30.1.so \
                /home/br2/target/lib
cd lib && tar -cf - *.so.* | tar -xf - -C /home/br2/target/lib
make[1]: Leaving directory `/home/br2/toolchain/uClibc-0.9.30.1'
touch -c /home/br2/target/lib/libc.so.0
mkdir -p /home/br2/toolchain/gcc-4.4.1-final
# Important! Required for limits.h to be fixed.
ln -snf ../include/ /home/br2/staging/usr/x86_64-linux-uclibc/sys-include
ln: creating symbolic link `/home/br2/staging/usr/x86_64-linux-uclibc/sys-include': No such file or directory
make: *** [/home/br2/toolchain/gcc-4.4.1-final/.configured] Error 1

real    0m12.145s
user    0m7.200s
sys     0m3.843s

% ll /home/br2/staging/usr/
total 32
drwxr-xr-x  2 admin users 4096 2009-10-20 23:47 bin/
drwxr-xr-x  4 admin users 4096 2009-10-20 23:00 i686-linux-uclibc/
drwxr-xr-x 17 admin users 4096 2009-10-20 23:47 include/
drwxr-xr-x  2 admin users 4096 2009-10-20 23:47 info/
drwxr-xr-x  4 admin users 4096 2009-10-20 23:47 lib/
drwxr-xr-x  3 admin users 4096 2009-10-20 22:59 libexec/
drwxr-xr-x  4 admin users 4096 2009-10-20 22:59 man/
drwxr-xr-x  4 admin users 4096 2009-10-20 22:49 share/
lrwxrwxrwx  1 admin users   17 2009-10-20 23:11 i686-linux -> i686-linux-uclibc/

--markc
