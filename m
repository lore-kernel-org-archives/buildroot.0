From: john <john.osullivan@cloudiumsystems.com>
Date: Thu, 18 Oct 2012 09:05:44 +0100
Subject: [Buildroot] Local SVN respository
Message-ID: <1350547544.8368.8.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to build a local package from a local svn repository. The
software I am building is a heavily hacked version of some open source
package. I am trying to retrieve the software from a local svn
repository (svn:// and not http) but buildroot keeps fetching the
official version of the software rather than my local copy. I have tried
various options like _OVERRIDE_SRCDIR but cannot change this behaviour,
any suggestions?

An extract from my mk file follows:

MYPACKAGE_VERSION = 1.0.1

#This should fetch it from an SVN repository and create
mysoftware-1.0.1.tar.gz in the dl directory
MYPACKAGE_SITE=svn://myserver/mydir/trunk/mysoftware-1.0.1/

#MYPACKAGE_SITE_METHOD = svn

#MYPACKAGE_OVERRIDE_SRCDIR =
${BUILDROOT_LOCATION}/../../mydir/mysoftware-1.0.1/

#This should take  mysoftware-1.0.1.tar.gz directly from the dl
directory and place it in output/build/mysoftware directory
MYPACKAGE_SOURCE = mysoftware-$(MYPACKAGE_VERSION).tar.gz
