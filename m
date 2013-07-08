From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jul 2013 22:29:15 +0200
Subject: [Buildroot]
 =?utf-8?q?Error_while_installing_dosfstools=3A_mkdosf?=
 =?utf-8?q?s=E2=80=99=3A_No_such_file_or_directory?=
In-Reply-To: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 (Daniel.'s message of "Mon, 8 Jul 2013 20:08:52 +0000")
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
Message-ID: <87obaciyn8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel  <danielhilst@gmail.com> writes:

 Daniel> I'm receiving this error while trying to compile dosfstools
 Daniel> [hilst at archhilst buildroot-2013.05]$ make
 >>>> dosfstools 3.0.16 Installing to target
 Daniel> test -z "mkdosfs" || install -m 755 /home/hilst/buildroot/buildroot-2013.05/
 Daniel> output/build/dosfstools-3.0.16/mkdosfs /home/hilst/buildroot/buildroot-2013.05/
 Daniel> output/target/sbin/
 Daniel> install: cannot stat ?/home/hilst/buildroot/buildroot-2013.05/output/build/
 Daniel> dosfstools-3.0.16/mkdosfs?: No such file or directory
 Daniel> make: *** [/home/hilst/buildroot/buildroot-2013.05/output/build/
 Daniel> dosfstools-3.0.16/.stamp_target_installed] Error 1
 Daniel> [hilst at archhilst buildroot-2013.05]$ ls -l /home/hilst/buildroot/
 Daniel> buildroot-2013.05/output/build/dosfstools-3.0.16/mkdosfs
 Daniel> ls: cannot access /home/hilst/buildroot/buildroot-2013.05/output/build/
 Daniel> dosfstools-3.0.16/mkdosfs: No such file or directory
 Daniel> [hilst at archhilst buildroot-2013.05]$

 Daniel> It seems that mkdosfs isn't generated, still I got no copile error..

Works here:

>>> dosfstools 3.0.16 Installing to target
test -z "mkdosfs" || install -m 755 /home/peko/source/buildroot/output/build/dosfstools-3.0.16/mkdosfs /home/peko/source/buildroot/output/target/sbin/
mkdir -p /home/peko/source/buildroot/output/target/etc

Could you please provide more details? What is your .config exactly?
Please run 'make savedefconfig' and paste the content of the 'defconfig'
file.

-- 
Bye, Peter Korsgaard
