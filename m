From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 16:19:18 +0200
Subject: [Buildroot] quick way of doing make atngw100-expanded_defconfig
In-Reply-To: <49F073C3.7050104@promwad.com> (Ivan Kuten's message of "Thu\,
	23 Apr 2009 16\:57\:23 +0300")
References: <49F073C3.7050104@promwad.com>
Message-ID: <87vdovmp09.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivan" == Ivan Kuten <ivan.kuten@promwad.com> writes:

 Ivan> Hello,
 Ivan> It there is a quick way of doing atngw100-expanded_defconfig?
 Ivan> I'm trying this way but getting error (svn trunk):

 Ivan> make atngw100-expanded_defconfig
 Ivan> cp ./target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig .config
 Ivan> make[1]: Entering directory `/home/users/Ivan/buildroot'
 Ivan> package/dbus-glib/Config.in:2:error: found recursive dependency: BR2_PACKAGE_DBUS_GLIB -> BR2_PACKAGE_EXPAT -> BR2_PACKAGE_DBUS -> BR2_PACKAGE_DBUS_PYTHON -> BR2_PACKAGE_DBUS_GLIB

Crap, this is Kconfig playing tricks with us again. Revert r26192 and
you'll be fine.

-- 
Bye, Peter Korsgaard
