From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 23:24:38 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: disable
 feature-relocatable
In-Reply-To: <20200517102823.15132-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 17 May 2020 12:28:23 +0200")
References: <20200517102823.15132-1-ps.report@gmx.net>
Message-ID: <87ftbimo2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Disable feature-relocatable to avoid a path mismatch while searching qml
 > files and buildroot BR2_ROOTFS_MERGED_USR feature enabled.

 > As described in [1] with feature-relocatable Qt determines the search
 > pathes relative to the location of libQt5Core.so, with BR2_ROOTFS_MERGED_USR
 > enabled found first under the symlink path '/lib' instead of the install
 > path '/usr/lib' and searches sequentially for qml files under '/qml' instead
 > of the correct '/usr/qml'.

 > Fixes:
 >   - https://bugs.busybox.net/show_bug.cgi?id=12906

 > [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4ac872639ed0dd3ae6627e05bdda821f7d128500

 > Reported-by: Joonas Harjum?ki <jharjuma@gmail.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

This is only for Qt 5.14 (E.G. master and not 2020.02.x), right? From a
quick look I don't see this option in the 5.12.8 version we have on the
LTS branch.

-- 
Bye, Peter Korsgaard
