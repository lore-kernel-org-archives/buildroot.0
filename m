From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:57:58 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 1 Jul 2014 20:03:09 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oawxntvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit removes the version selection for the busybox
 > package. Busybox is very well maintained, and bugs are typically fixed
 > in a timely fashion. Moreover, regressions are fairly unlikely in this
 > very stable and well-tested tool.

 > Therefore, there isn't a very compelling reason to have a version
 > selection for Busybox since we don't accept such a version selection
 > for the vast majority of other packages, unless there is a strong
 > reason to do so.

 > Consequently, this commit:

 >  * Removes the 1.19.4, 1.20.2 and 1.21.1 Busybox versions, patches and
 >    default configuration file.

 >  * Moves the 1.22.1 patches from package/busybox/1.22.1 to just
 >    package/busybox/ like all other packages.

 >  * Renames the default 1.22.1 configuration file to just
 >    busybox.config.

 >  * Adapts the busybox.mk makefile to encode the current version to
 >    use.

 >  * Adds appropriate options to Config.in.legacy. However, even though
 >    the BR2_BUSYBOX_VERSION_1_22_X is removed, we don't add a
 >    Config.in.legacy option for it, since it would cause a legacy
 >    warning for virtually *all* users as most people are currently
 >    using 1.22.x.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

I wonder if time also hasn't come to get rid of
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

-- 
Bye, Peter Korsgaard
