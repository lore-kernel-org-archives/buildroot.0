From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 1 Feb 2019 19:07:53 +0100
Subject: [Buildroot] bug in package/qt5/qt5base/qt5base.mk ?
In-Reply-To: <974e7b88-1018-6b1b-79eb-5fa677ef713c@gmx.com>
References: <974e7b88-1018-6b1b-79eb-5fa677ef713c@gmx.com>
Message-ID: <20190201190753.2aabfa16@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Fri, 1 Feb 2019 17:20:50 +0100, David Picard <dplamp@gmx.com> wrote:

> Hi,
> 
> If BR2_PACKAGE_QTBASE_CONFIG_FILE is set, qt5base.mk calls Qt's 
> configure utility with the '-config' option, which is not recognized by 
> configure. Also, I couldn't find an equivalent option.

You mean BR2_PACKAGE_QT5BASE_CONFIG_FILE and '-qconfig' and yes
it is the Qt-5.6.x (still present as a choice in buildroot) way
for fain grained configure...

> 
> My suggestion would be to replace the original 
> $(@D)/src/corelib/global/qconfig.h with the file pointed to by 
> BR2_PACKAGE_QTBASE_CONFIG_FILE. What do you think ?

The modern way (since Qt-5.8) is via the config.opt file
and configure -redo (see [1])...

Regards,
Peter

[1] https://doc.qt.io/QtForDeviceCreation/qt-configuration-tool.html

> 
> - David
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
