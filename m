From: djames.suhanko <djames.suhanko@gmail.com>
Date: Sun, 17 Jun 2012 22:51:59 -0300
Subject: [Buildroot] New package
Message-ID: <CAFYZmWjqLdemKVbdGQ=s2WGNGjtpVF1hvfpmqFeaQShyUokRzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!
 I did a package compilation named 'bar'. This program is used to generate
a progress bar to shell scripts and is used in PhantomClone project too.
This project is hosted in Sourceforge.

The program package/bar:
Config.in:

config BR2_PACKAGE_BAR
bool "Bar"
select BR2_PACKAGE_NEWT

help
          Progress bar to command line scripts


http://sourceforge.net/projects/clpbar/files/clpbar/bar-1.10.9/bar_1.10.9.tar.gz/download


bar.mk:
#############################################################
#
# Bar
#
#############################################################
BAR_VERSION = 1.10.9
BAR_SOURCE = bar_1.10.9.tar.gz
BAR_SITE =
http://sourceforge.net/projects/clpbar/files/clpbar/bar-1.10.9/bar_1.10.9.tar.gz/download

#BAR_DEPENDENCIES = host-pkg-config e2fsprogs libgcrypt attr gzip zlib
bzip2 lzo intltool libgpg-error gettext

BAR_INSTALL_STAGING = NO
BAR_INSTALL_TARGET = YES

BAR_CONF_ENV = ac_cv_func_sysconf=no

BAR_CONF_OPT = --disable-dependency-tracking --disable-use-memalign

$(eval $(call AUTOTARGETS,package,bar))

The compilation is OK, but the automatic download from sourceforge isn't
working. How can I do the automatic download from sourceforge?
-- 
Djames Suhanko
LinuxUser 158.760
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120617/373ccbb5/attachment.html>
