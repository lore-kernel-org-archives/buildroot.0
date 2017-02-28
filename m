From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 15:56:26 +0100
Subject: [Buildroot] [PATCH for-master] qt5quickcontrols: fix
	installation of PrivateWidgets
In-Reply-To: <20170228110252.5695-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 28 Feb 2017 12:02:52 +0100")
References: <20170228110252.5695-1-arnout@mind.be>
Message-ID: <8760jujrdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Commit e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc attempted to fix the
 > installation of qt5quickcontrols by only installing the PrivateWidgets
 > directory for the 5.8.0 version.

 > However, the availability of PrivateWidgets has nothing to do with the
 > version; in both 5.6.2 and 5.8.0, the installation is gated by the
 > following statement in src/src.pro:

 > qtHaveModule(quick):qtHaveModule(widgets): SUBDIRS += widgets

 > i.e. it is installed when both the Quick and the Widgets module are
 > available. The Widgets module is controlled by Buildroot's
 > BR2_PACKAGE_QT5BASE_WIDGETS symbol, the Quick module is controlled by
 > Buildroot's BR2_PACKAGE_QT5DECLARATIVE_QUICK. The qt5quickcontrols
 > package selects BR2_PACKAGE_QT5DECLARATIVE_QUICK so it is not really
 > needed to include it in the condition. However, it is theoretically
 > possible to build this package without QtQuick. Also, adding this
 > condition makes it consistent with src.pro.

 > Note that commit e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc introduces a
 > second fix (not mentioned in the commit message): for version 5.6.2, the
 > Layouts directory is installed, but in 5.8.0 this directory doesn't
 > exist any more. Therefore, a separate condition on the version is still
 > needed.

 > Fixes:
 > http://autobuild.buildroot.net/results/1ff3e9ad4ba518d0a37f9fc12038bf9020f28094

 > Cc: Peter Seiderer <ps.report@gmx.net>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
