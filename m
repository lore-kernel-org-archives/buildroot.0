From: Adam Jiang <chaoj@infipwr.com>
Date: Thu, 25 Dec 2014 13:34:59 +0900
Subject: [Buildroot] AC_CHECK_LIB doesn't work for cross-compiling
Message-ID: <549B93F3.7020602@infipwr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to add a new package to buildroot. the package is built upon
autotools. thus, it is supposed to be very easy to make it
cross-compilable. ever, i got suck at AC_CHECK_LIB macro. it doesn't
work well at cross-compiling while it does work on normal compiling.

AC_CHECK_LIB([fcgi], [FCGX_InitRequest], [AC_MSG_WARN("unable to find
the FCGX_InitRequest() function")])

always failed even though I do have libfcgi in my configuration. The
error message looks like

checking for FCGX_InitRequest in -lfcgi... no
configure: WARNING: unable to find the FCGX_InitRequest() function

I don't think AC_CHECK_LIB will not work on cross-compiling because it
seems there are lots of other target packages in buildroot using the
macro. Most probably, I am doing something wrong.

Does AC_CHECK_LIB work in buildroot? If the macro needs some changes,
how could I do it?

Thanks,
/Adam
