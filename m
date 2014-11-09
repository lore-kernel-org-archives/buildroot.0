From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 09 Nov 2014 02:53:04 +0100
Subject: [Buildroot] Config.in for both Qt4 and Qt5 in grantlee
Message-ID: <545EC900.9030103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i'm trying to update the package grantlee (http://grantlee.org) in 
Buildroot to the current upstream version. Historically grantlee 
supported only Qt4 (this version is present now in Buildroot), and for a 
while both Qt4 and Qt5, and with the last release it dropped the Qt4 
support.
  As for one of my legacy projects i still might need the Qt4 version, i 
would like to keep the Qt4 support by using the last upstream version 
which built on Qt4 when Buildroot configured to build Qt4,  and use the 
newest version when build on Qt5. It's easy to implement in the .mk file 
with "ifeq ($(BR2_PACKAGE_QT),y)", although i'm not sure this is the 
most elegant solution. (qjson using this for example to distinguish the 
dependencies between the two Qt version, but it doesn't use 2 different 
upstream versions for the 2 Qt versions)

  I got into trouble in the Config.in though. Currently the grantlee.mk 
selects a few Qt options with the kconfig 'select' statement (namely  
BR2_PACKAGE_QT_STL, BR2_PACKAGE_QT_SCRIPT, BR2_PACKAGE_QT_GUI_MODULE), 
and it also supposed to select the corresponding Qt5 options, but i 
can't find any explicit trace that using conditional 'select' is 
possible in kconfig, nor the correct syntax to express this.

What is the preferred solution to handle this scenario? Would it be 
better to have a new grantlee package (let's say grantleeqt5) for this 
latest version, and enable it in the menu only for Qt5? Or is there any 
kconfig trick i could use here? An other option would be just to drop 
Qt4 support (if the upstream already did it) at least in the official 
Buildroot version (and i can use any nasty trick in my own Buildroot 
tree to support my legacy project till i'm able to port it to Qt5). Is 
there anybody out there who is using this lib with Qt4?

Thanks in advance, regards
zgyarmati
