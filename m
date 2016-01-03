From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 22:15:57 +0100
Subject: [Buildroot] [PATCH] pkg-generic: improve incorrectly used
	package detection
In-Reply-To: <1451606483-29096-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 1 Jan 2016 01:01:23 +0100")
References: <1451606483-29096-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87egdymkj6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Currently, the check that packages we build are indeed enabled is done
 > at the time a package is configured.

 > This can come quite late in the build process, and does not provide
 > direct knowledge of the real culprit for the incorrect dependency.

 > However, we can improve these two issues quite easily, albeit at the
 > expense of a very slightly more complicated make code.

 > First, the check can not be done at the time we define the package, i.e.
 > in the inner-generic-pacakge, because all its dependencies might have
 > not been parsed yet, so we can't yet know whether it is enabled or not
 > (because we can't match the package name of the dependency to its
 > Kconfig variable yet).

 > But then, we know we have all packages definitions after we scanned the
 > the bundled packages, kernel, bootloaders and toolchains, as well as the
 > br2-external tree (if any).

 > So, at this location, we iterate through the list of enabled packages,
 > and check that the packages they each depend on are indeed enabled.

 > This allows us to:
 >  1- do the check very early, before any build action,
 >  2- report on the exact offending package very easily.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
