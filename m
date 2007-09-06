From: Simon Pasch <fpasch@googlemail.com>
Date: Thu, 6 Sep 2007 17:50:28 +0200
Subject: [Buildroot] library-problems with external toolchain
Message-ID: <f90898420709060850r4f10b4acscc2ab4d961a4f3d7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Is anyone on the list familiar with the usage of an external toolchain?

I've run into problems with my external toolchain (I use crosstool,
perhaps you know it, to create a cross-toolchain with gcc 4.2.0 and
glibc 2.5) I need the glibc-library, because I have to be able to
start a precompiled program, which was linked against glibc (By the
way, is my assumption right, that I can't use uclibc in that case?!
Last time I tried it with uclibc, it said something like "file not
found", when I executed the program)

The problems isn't the integration of the external toolchain itself.
This worked seemingly perfect. I can compile busybox and some other
programs without any problems.

...Until buildroot gets around to build some library-dependent programs.
This fails because of missing libraries.
My hack was to manually copy the corresponding libraries from the
staging_dir/lib or staging_dir/usr/lib to the toolchain-lib-directory.
This is a very dirty hack, isn't it? Is there another possibility?
Setting a PATH-Variable, or something like that?

In that way I can compile nearly everything. Until buildroot reaches
the libglib2-package (actually I believe it's the gettext package,
which causes the problem). It fails with:

checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking for ngettext in libc... no
checking for bindtextdomain in -lintl... no
checking if -liconv is needed to use gettext...
checking for ngettext in -lintl... no
configure: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html

I'm compiling on x86_64 suse for a x86-target.

Has anyone an idea?

Simon
