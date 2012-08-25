From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 17:06:05 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
Message-ID: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I got sick of having build issues related to libffi needs of threads,
of the absence of support for sh2a in libffi, so I did the work needed
to ensure that libffi would not be used anymore in those two cases.

This is a boring work, because libffi is mandatory for Python and
glib2, and glib2 has a crazy number of reverse dependencies that do
"select BR2_PACKAGE_LIBGLIB2", and therefore overstepping the
dependencies of glib2.

This patch, I hope, illustrate how crazy this story of "depends on"
needed for toolchain options has become. We need to find a solution
for this. Yann has proposed something (see
http://lists.busybox.net/pipermail/buildroot/2012-August/057144.html).

Opinions? My patch, or Yann's solution? Other solutions?

Thanks,

Thomas
