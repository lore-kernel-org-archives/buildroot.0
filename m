From: IaMaPlAyEr <iamaplayer@gmail.com>
Date: Fri, 27 Feb 2009 11:45:55 +0800
Subject: [Buildroot] I want to know how the buildroot works inside when
	build and install a new package
Message-ID: <2ae8403e0902261945w682609fbwa4758e1bcf01f742@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all,

    I want to know how the buildroot works inside when build and install a
new package.
I view the doc, but can not find the answer.

    Just as the buildroot.html said, if I want to add new package, which I
have to do
is to writing a makefile(foo.mk) just like blow:

     1  #############################################################
     2  #
     3  # foo
     4  #
     5  #############################################################
     6  FOO_VERSION:=1.0
     7  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
     8  FOO_SITE:=http://www.foosoftware.org/downloads
     9  FOO_INSTALL_STAGING = YES
     10  FOO_INSTALL_TARGET = YES
     11  FOO_CONF_OPT =  --enable-shared
     12  FOO_DEPENDENCIES = libglib2 pkgconfig
     13  $(eval $(call AUTOTARGETS,package,foo))

It is the rule of the package needed.
I know it is the Makefile which autotools-based type, and also know the
default work-flow
 of autotools is:
autoscan(configure.scan)----------(edit configure.ac
)----------aclocal(aclocal.m4)-----autoconf(configure)

(edit configure.ac)----------autoheader(config.h.in)

Makefile.am----autoconf(configure)

autoconf(configure)+autoconf(configure)-----./configure(Makefile)

And how the buildroot works inside?

Thanks in advance for any assistance.

-- 
--
HaveF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090227/c7a37d32/attachment.htm>
