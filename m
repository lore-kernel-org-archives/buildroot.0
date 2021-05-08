From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:23:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/monkey: bump to latest git
 commit
In-Reply-To: <20210426215358.519314-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Apr 2021 23:53:58 +0200")
References: <20210426215358.519314-1-fontaine.fabrice@gmail.com>
Message-ID: <87pmy1xq10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix a build failure with gcc 10
 > - Update indentation in hash file (two spaces)
 > - Drop INSTALL_SYSCONFDIR, INSTALL_WEBROOTDIR and WITH_SYSTEM_MALLOC
 >   (not available since
 >   https://github.com/monkey/monkey/commit/df145932e33fca0d4a1dcd9d7675f996c8e6a73b)
 > - Set WITHOUT_HEADERS to ON because headers are not needed and to avoid
 >   the following build failure:

 > CMake Error at include/cmake_install.cmake:46 (file):
 >   file INSTALL cannot find
 >   "/home/fabrice/buildroot/output/build/monkey-f54856ce250c4e25735434dc75717a4b7fbfc45b/include/mk_core.h":
 >   No such file or directory.
 > Call Stack (most recent call first):
 >   cmake_install.cmake:69 (include)

 > Upstream is aware than the lack of release is an issue but no comments
 > since 2018: https://github.com/monkey/monkey/issues/276

:/

I was hessitating what to do for 2021.02.x, but given how old 1.6.9 is
(and there are apparently pretty serious sounding post-1.6.9 fixes in
the 1.6 branch from 2017), I decided to commit this to 2021.02.x as
well.

But I wouldn't recommend anyone using monkey.

-- 
Bye, Peter Korsgaard
