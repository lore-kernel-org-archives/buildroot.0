From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2014 23:07:53 +0100
Subject: [Buildroot] [PATCH 1/4] package: prepare to support modules
	that work with Qt or Qt5
In-Reply-To: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 1 Nov 2014 23:15:08 +0100")
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738a02b0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Currently, all the Qt external modules (qtuio, qjson, etc.) can only
 > be compiled against Qt4. However, some of them (qjson, qextserialport
 > at least) can compile with either Qt4 or Qt5.

 > Therefore, this commit adjusts the Config.in logic to make it possible
 > for certain modules to be selected with either Qt4 or Qt5. We use the
 > same approach as the one of for Python 2 vs. Python 3 modules:

 >  - in package/Config.in, the package Config.in files are included
 >    either if BR2_PACKAGE_QT or BR2_PACKAGE_QT5 are enabled.

 >  - each individual package is then responsible for having a dependency
 >    on either BR2_PACKAGE_QT, or BR2_PACKAGE_QT5 or both depending on
 >    what they support. In this commit, we add a dependency on
 >    BR2_PACKAGE_QT to all packages, since for now, they only support
 >    Qt4.

Committed series after adding a select of qt5base to qt5, thanks.

-- 
Bye, Peter Korsgaard
