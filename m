From: lpdev at cordier.org <lpdev@cordier.org>
Date: Tue, 18 Feb 2020 10:45:15 +0100 (CET)
Subject: [Buildroot] Add BR2_EXTRA_CXX_FLAGS to be appended to
 TARGET_CXXFLAGS
Message-ID: <ea-mime-5e4bb22b-5970-2e2a6b21@www-2.mailo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,



For some reason, I need to disable cxx11 ABI on my entire buildroot build. AFAIK, it is currently not possible to set project-wide cxx flag, like _GLIBCXX_USE_CXX11_ABI=0. Currently this flag has to be set on all package manually.



After studying a bit the buildroot makefiles, TARGET_CXXFLAGS is populated by some buildroot options, such as BR2_BINFMT_FLAT, etc.



I see 2 possible solutions to solve that:



- at the buildroot build level, add an option like BR2_USE_CXX11_ABI, or more generally, BR2_EXTRA_CXX_FLAGS (that can be extended to cflags as well).

- at the buildroot toolchain build level, add an option in the buildroot toolchain that allows to control the CXX11 ABI



What do you think about that?



Thanks



Louis-Paul CORDIER


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200218/0a05770d/attachment.html>
