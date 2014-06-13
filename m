From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 13 Jun 2014 11:54:48 +0300
Subject: [Buildroot] Qt5Declarative examples
In-Reply-To: <5395E7B5.1050604@carallon.com>
References: <5395E7B5.1050604@carallon.com>
Message-ID: <201406131154.48198.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 09 June 2014 19:58:29 Will Wagner wrote:
> Hello,

Hi,

> Just started taking a look at Qt5Declarative and noticed that examples
> aren't being built/installed.
> 
> Having looked at the .mk files it is easy to conditionally build the
> examples depending on qt5base config option about examples, but I'm
> unsure how best to do the install target step.
> 
> In Qt5Base it just does:
> cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/*
> $(TARGET_DIR)/usr/lib/qt/examples
> to install examples from staging.
> 
> This would also work for Qt5Declarative but it seems like a poor
> solution to just copy and paste the same code.
> 
> Can anyone think of a better way of doing this? Perhaps define something
> in qt5.mk and use that in both qt5base and qt5declarative?

You can have a look at qt5enginio and qt5websockets packages. They are
installing their examples if BR2_PACKAGE_QT5BASE_EXAMPLES.

There are 3 directories you need to copy for qt5declarative. Following lines will be enough
to copy all of them:

cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qml* $(TARGET_DIR)/usr/lib/qt/examples/
cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quick $(TARGET_DIR)/usr/lib/qt/examples/

Regards,
Fatih
