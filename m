From: Kishore K <hellokishore@gmail.com>
Date: Tue, 26 Dec 2006 17:41:49 +0530
Subject: [Buildroot] problem using mklibs
Message-ID: <d7e88e1f0612260411hf7b8c48jf7b8170ea4122a71@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am getting some problems with mklibs for MIPS. Since I am using mklibs
along with buildroot, I thought this is the appropriate forum to post this
message.

I used buildroot to generate tool chain (gcc-3.4.6, binutils-2.16.91.0.7,
uClibc - snapshot) and root file system for MIPS platform. After successful
building of the root file system and tool chain, I executed the following
commands to optimize libraries.

These commands (with some modifications) are taken from mklibs.mk file in
buildroot source.

[kishorek at host05 buildroot]$  find build_mips/root/ -type f -perm +100 |
xargs file -r -N -F '' {} + | awk ' /executable.*dynamically/ { print $1 }'
> mklibs-progs

[kishorek at host05 buildroot]$  python toolchain/mklibs/mklibs.py --target
mips-linux-uclibc  --root $PWD/build_mips/staging_dir/  -D
-L$PWD/build_mips/staging_dir/lib -d $PWD/reduced/  `cat mklibs-progs`


I: Using ld-uClibc.so.0 as dynamic linker.
I: library reduction pass 1
352 symbols, 352 unresolved
I: library reduction pass 2
352 symbols, 352 unresolved
Traceback (most recent call last):
  File "toolchain/mklibs/mklibs.py", line 435, in ?
    raise "Unresolvable symbol " + symbol
Unresolvable symbol mmap


As can be seen, second command fails with "Unresolvable symbol mmap". Can
you please guide me, whether there is any issue with the way, I am using
mklibs. If so, can you suggest me a way to circumvent the problem.

TIA,
--kishore
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061226/2165a055/attachment.html 
