From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 6 Feb 2013 17:05:23 +0100
Subject: [Buildroot] Boost fails to compile without WCHAR support
Message-ID: <CAKvQZ_3=ok=DfAkPO9SgKvMpUzcEDRWqjxmTGOoQCgarbwnJfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have some work pending that rely on boost, so before sending
anything I tried my work in a fresh new buildroot tree from git. It
happens that boost is not building if WCHAR support is not enabled.
Boost checks for some dependencies like C++, large file, thread
support,  but seems to forget WCHAR :
comment "boost requires a toolchain with C++, large file and thread
support enabled"
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE ||
!BR2_TOOLCHAIN_HAS_THREADS

Does any one have this issue ? You I open a bug in the bugtracker ?
Just send a patch adding the WCHAR requierement ?
