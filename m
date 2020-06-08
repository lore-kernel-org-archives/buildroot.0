From: LP C <lpdev@cordier.org>
Date: Mon, 8 Jun 2020 11:47:26 +0200
Subject: [Buildroot] Status of parallel build with Qt5
Message-ID: <3FC2CC68-E196-4121-9FB1-5BE83B58DBAC@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

As far as I know, it is currently not possible to build qt5 with top-level parallel build. Following is the error I get:
/sandbox/awow/per-package/qt5declarative/host/bin/qmake -install qinstall /sandbox/awow/build/qt5declarative-5.14.2/tools/qmlcachegen/qtquickcompiler.prf /sandbox/awow/build/qt5declarative-5.14.2/tmp-target-install/sandbox/awow/per-package/qt5base/host/mkspecs/features/qtquickcompiler.prf
/sandbox/awow/per-package/qt5declarative/host/bin/qmake -install qinstall -exe ../../bin/qmltestrunner /sandbox/awow/build/qt5declarative-5.14.2/tmp-target-install/sandbox/awow/per-package/qt5base/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/qmltestrunner
/sandbox/awow/per-package/qt5declarative/host/bin/qmake -install qinstall -exe ../../bin/qml /sandbox/awow/build/qt5declarative-5.14.2/tmp-target-install/sandbox/awow/per-package/qt5base/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/qml
rsync -arv /sandbox/awow/build/qt5declarative-5.14.2/tmp-target-install/sandbox/awow/per-package/qt5declarative/host/x86_64-buildroot-linux-gnu/sysroot/ /sandbox/awow/per-package/qt5declarative/target/
sending incremental file list
rsync: change_dir "/sandbox/awow/build/qt5declarative-5.14.2/tmp-target-install/sandbox/awow/per-package/qt5declarative/host/x86_64-buildroot-linux-gnu/sysroot" failed: No such file or directory (2)

It looks very close to http://lists.busybox.net/pipermail/buildroot/2020-May/283407.html but I am not building examples for Qt5, is this patch still relevant for my case?
Is there any status regarding the build of Qt5 with parallel build? Wouldn't be possible to disable parallel build for this specific package in the meantime?
Have a nice day,
Louis-Paul CORDIER
PS: Newbie question here: what is the best practice to answer/participate to an old thread from the mailing list? As I don't have the email in my inbox, I cannot answer back, thus forcing me to start a new thread. Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200608/21973f30/attachment.html>
