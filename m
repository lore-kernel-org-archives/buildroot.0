From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 13:12:35 +0200
Subject: [Buildroot] [PATCH 01/13] core: do not attempt downloads with
	no _VERSION set
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Jul 2016 11:49:49 +0200")
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878txjynz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Alex Suykov <alex.suykov@gmail.com>
 > Currently, when the package defines no _SOURCE and no _VERSION
 > variables, we end up trying to download <PACKAGE>-undefined.tar.gz.

 > This is utterly pointless.

 > Change the logic to not attempt a download when neither _SOURCE
 > nor _VERSION is set:
 >   - do not set an undefined _VERSION to "undefined"
 >   - do not append an empty (or "undefined") version to the package
 >     rawname

 > Consequently, for packages that have no _VERSION, the build
 > directory will be just the package name (which to some may look
 > nicer than the current "package-undefined").

 > Furthermore, the message trace is also a bit leaner (to the same
 > people that find "package" nicer than "package-undefined").

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed entire series, thanks.

-- 
Bye, Peter Korsgaard
