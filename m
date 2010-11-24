From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 16:24:15 +0100
Subject: [Buildroot] [PATCH v2] zlib: fix shared lib logic for
	static-only targets
In-Reply-To: <1290224711-21643-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Fri, 19 Nov 2010 22:45:11 -0500")
References: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
	<1290224711-21643-1-git-send-email-vapier@gentoo.org>
Message-ID: <87k4k268yo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> FLAT targets only support static libraries.  The zlib code atm though
 Mike> assumes a libz.so is always created.  So have the targets check to see
 Mike> if libz.so exists before trying to work with it.

 Mike> While we're here, also punt the package-local stripping.

Thanks, but I prefer to simply use zlib's own 'make install' instead,
instead of repeating these steps 3 times. I've committed a change to do
so in git.

-- 
Bye, Peter Korsgaard
