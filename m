From: Ottavio Campana <ottavio@campana.vi.it>
Date: Tue, 28 May 2019 10:24:23 +0200
Subject: [Buildroot] Changing the way the kernel is build from an external
 layer
Message-ID: <CAD_3qOCONVb4P1EU1ARRpOEJx5AwB-8JUV1F8+vax6EudODWvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am porting a BSP to buildroot, to make the full build of the system automatic.

Everything is fine, but I have a problem with the kernel. The kernel
is provided in form of a tarball, but inside the tarball also drivers
are present. The contents of the tarball, once expanded, can be
summarized as:

source folder
* kernel folder
* first folder with a bunch of drivers
* other folder with other drivers

The contents of the content is not compatible with the tarball
mechanism provided by buildroot, which expands the the tarball and
expects to find the kernel sources at the first level. Moreover,
drivers seem to have some hard coded paths to the kernel source.

I would like to avoid patching the build script in buildroot. Is there
a way to change the way the kernel is compiled by using scripts in an
external layer? In chapter 9 of the buildroot I find many tools to
change/add the packages, but I am not able to find a way to change the
way the kernel is compiled.

Thank you for your suggestions,

Ottavio

-- 
Non c'? pi? forza nella normalit?, c'? solo monotonia
