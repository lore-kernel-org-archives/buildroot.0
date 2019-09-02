From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 14:31:24 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5enginio: switch to a depends
 on for SSL support
In-Reply-To: <20190804154545.32525-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 4 Aug 2019 17:45:45 +0200")
References: <20190804154545.32525-1-thomas.petazzoni@bootlin.com>
Message-ID: <87ftleyj4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > qt5enginio requires SSL support in qt5base. However, the SSL support
 > in qt5base is a bit annoying: while it can be provided by either
 > openssl or libressl for Qt latest, it can only be provided by
 > libressl for Qt 5.6.

 > Fabrice Fontaine initially proposed [0] a dependency on
 > BR2_PACKAGE_QT5BASE_OPENSSL, and a long discussion
 > followed. Ultimately, we found the dependency to not be nice, as it
 > required users to know that they need to enable some SSL
 > implementation to be able to enable qt5enginio.

 > The current solution enables BR2_PACKAGE_OPENSSL (the virtual
 > package), which can be either openssl or libressl. This choice was
 > done under the assumption that we anyway don't test Qt 5.6 in the
 > autobuilders. However, this is incorrect: Qt latest needs gcc >= 4.8
 > on host and target, and we have configurations in the autobuilders
 > that don't meet this requirement, and therefore build Qt 5.6, and face
 > a build issue due to OpenSSL being used instead of LibreSSL.

 > After additional thinking, this commit simply gets back to the
 > original solution proposed by Fabrice: a "depends on". We simply add
 > Config.in comments to help the user in knowing what is missing to
 > enable qt5enginio.

 > An alternate solution would have been to disallow selecting qt5enginio
 > when Qt 5.6 is used. But fixing the qt5enginio build is also needed
 > for the LTS branch, and we can't drop qt5enginio on Qt 5.6 in the LTS
 > branch, as that could bother users.

 > Fixes:

 >   http://autobuild.buildroot.net/results/227d4b9e2b48c5b3f2dcf0fad9eefa2816c1eb0c/

 > [0] https://patchwork.ozlabs.org/patch/1053883/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
