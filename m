From: Andreas Naumann <dev@andin.de>
Date: Mon, 01 Jul 2013 14:03:49 +0200
Subject: [Buildroot] qt5declarative/webkit target install steps omit plugins/
Message-ID: <51D17025.9080401@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the qt5declarative and qt5webkit builds do install some stuff to staging 
plugins/, but their target install step doesnt pick those up. Only 
qt5base has a QT5BASE_INSTALL_TARGET_PLUGINS step, but this one runs of 
course before the other modules.
I came across this when trying to reinstall qt5 through deletion of its 
.stamp_target_installed. A subsequent make produces a target/ with more 
plugins/ than the clean build produced.
Right now i fixed this with an additional plugins-install step in 
webkit/declarative, but maybe this step should be more qt5 global. Any 
suggestions on that?


cheers,
Andreas
