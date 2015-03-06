From: Alex Potapenko <opotapenko@gmail.com>
Date: Fri, 6 Mar 2015 22:05:57 +0200
Subject: [Buildroot] postgresql: uClibc build
Message-ID: <CAF5aO=K4_ajUeCQO5XG5r8-yLgnA58qMztHAe_YGWTt1t-WvQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
Currently in buildroot postgresql build requires glibc. According to the
comments, due to this issue:
http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html. However,
it is pretty simple to have it built: simply comment out line "#define
HAVE_LOCALE_T" in src/include/pg_config.h after running configure build.
This will disable the use of locale_t, and therefore of undefined
__uclibc_locale_struct.
I have built optware package postgresql this way using
arm-buildroot-linux-uclibcgnueabi
uClibc 0.9.33.2 buildroot 2015.02 toolchain just fine:
https://github.com/alllexx88/optware/blob/master/make/postgresql.mk, so I
think you can use a similar fix and remove glibc requirement

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150306/6858a5ce/attachment.html>
