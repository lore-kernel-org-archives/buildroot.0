From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 11:06:41 +0200
Subject: [Buildroot] [PATCH v2] bandwidthd: incorporate fixes for
	autobuilders
In-Reply-To: <1408062429-25594-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Fri, 15 Aug 2014 08:27:09 +0800")
References: <1408062429-25594-1-git-send-email-nroach44@gmail.com>
Message-ID: <87wqaa2kbi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > "The build failures of bandwidthd observed in the autobuilders in
 > 	relation to libpng are caused by the usage of -L/usr/lib
 > 	-L/usr/local/lib in the compiler flags, which leads the configure
 > 	script to try to link against a host libpng library."

 > These issues are fixed by:

 > * Version bump to -r08
 > 	"[patched] the configure.ac script to remove the hardcoded
 > 	-L/usr/local/lib and -I/usr/local/include. The bandwidthd package
 > 	-was already autoreconfigured, so there is no need to add it."

 > * "Adding the --without-x option, which ensures that the configure.ac
 > 	script will not add -L/usr/lib to the compiler flags (and we anyway
 > 	haven't added any sort of X.org support to bandwidthd for the
 > 	moment)."
 > Both fixes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Changes v1 to v2
 >  - Added details of the failure this patch fixes

Committed, thanks.

-- 
Bye, Peter Korsgaard
