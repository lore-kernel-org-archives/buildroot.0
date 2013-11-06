From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 22:46:11 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Mon, 4 Nov 2013 09:48:06 -0800")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <87eh6tkxuk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 > Everyone,
 > This is an RFC for a new make option to download all package
 > sources to aid developers who cannot freely download packages.
 > This includes limited internet access or restrictive firewalls.
 > This is a best effort download. Any errors in downloading are
 > ignored rather than causing a failure.

 > The main changes in this patch is the addition of an "allsource"
 > make option that pulls down all of the package sources if a
 > version string is found. The version check is required because
 > packages that do not have a default version cause a invalid file
 > download attempt. I had to abstract the download steps from
 > pkg-generic.mk so they are callable by both the main Makefile
 > and the pkg-generic.mk download step.

 > Implementation details:
 >  1) The allsource command filters the make .VARIABLES for all
 >     "*_TARGET_SOURCE" and then strips off the "_TARGET_SOURCE"
 >     to get the package name. This results in a list of all
 >     of the packages that can be downloaded.
 >  2) The newly created PKG_DOWNLOAD define is called on all of
 >     the package names to download the source. This call does
 >     not cause the allsource command to fail if there is an
 >     error. This is only a best effort call.
 >  3) All of the sources are downloaded to the BR2_DL_DIR folder.

 > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

Sorry, how is this different than make allpackageyesconfig; make source?

-- 
Bye, Peter Korsgaard
