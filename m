From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Thu, 16 Nov 2006 06:57:58 -0800 (PST)
Subject: [Buildroot] C++ cross compiler]
In-Reply-To: <loom.20061116T100028-172@post.gmane.org>
References: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
	<loom.20061116T100028-172@post.gmane.org>
Message-ID: <13882.82.171.61.116.1163689078.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> No, there should literally be a directory called
> "buildroot/build_arm_nofpu/staging_dir/bin/"
> (the "build_arm_nofpu" bit depends on your build settings)
> which gets created as part of your buildroot make.

In the buildroot/build_arm directory, the directories that are there are:

bash-3.1
busybox
coreutils-5.96
gdb-6.3-target
gdbserver-6.3
genext2fs-1.3
hdparm-6.5
makedevs
ncurses-5.5
openssh-3.9p1
openssl-0.9.7e
portmap_5beta
root
sudo-1.6.8p9
zlib-1.2.3

I looked through the whole buildroot directory system and was not able to
find a staging_dir directory.

1.  Do you what causes the staging_dir to be generated?
    In .config BR2_STAGING_DIR="/usr/local/arm/release-3.4.2".

I have been able to generate a cross compiler and a root filesystem
from which I can boot linux from via NFS mount.


>
> So under "buildroot" (the buildroot installation dir)
> you should get "build_arm_nofpu" or something like it.
>
> Under "build_arm_nofpu" you will get a subdirectory for each
> package, plus one called "root" and one called "staging_dir".
>
> The "root" one is where your root filesystem is built, and
> the "staging_dir" one is where
> a) the built toolchain is placed
> b) files built from packages are created prior to installation in "root"
>
> Among the directories in my "staging_dir" containing toolchain files
> are "arm-elf-linux", "arm-linux" and "bin" which contain links to
> compilers (including c++) or the executables themselves.
>
> What is the directory path in your system to what you call
> "where the cross compiler executables go" ?

That is /usr/local/arm/release-3.4.2.  In this directory there are
the directories:

arm-linux-uclibc
bin
bin-ccache
include
info
lib
libexec
man
usr

arm-linux-uclibc has the directories:

bin
target_utils

which just have executables such as ar, as, gcc, ld, gdbserver, etc.

/usr/local/arm/release-3.4.2/bin has:

arm-linux-gcc-3.4.2->arm-linux-uclibc-gcc-3.4.2

etc.

but no arm-linux-g++



Nina
