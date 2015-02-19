From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Feb 2015 19:55:32 -0600
Subject: [Buildroot] How  automate source download from  a google drive?
Message-ID: <54E54294.3030702@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bit off the wall. I'm working with a package called tovid
which you download from a google drive by clicking on a link on the wiki
Darn if I can figure out how to put that into the .mk file to automate it.
Look through packages directory and did not see anything obviously like it

Any thoughts would be appreciated

Steve Kenton

################################################################################
#
# tovid
#
################################################################################

TOVID_VERSION = 0.35
# I don't see how to automate downloads from a google drive http://goo.gl/o8IWR7
# The file which is downloaded has the expected name tovid-0.35.tar.gz
TOVID_SITE = http://tovid.wikia.com/wiki/Installing_tovid
TOVID_LICENSE = GPLv2.0
TOVID_LICENSE_FILES = COPYING

# Must be run in source directory to avoid "error: package directory 'libtovid' does not exist"
define TOVID_INSTALL_TARGET_CMDS
	bash -c "cd $(@D); ./setup.py install --root=$(TARGET_DIR) --prefix=/usr"
endef

$(eval $(generic-package))
