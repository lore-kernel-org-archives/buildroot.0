From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 21:59:12 +0200
Subject: [Buildroot] [PATCH] package: fix 'local' site method for host
	packages
In-Reply-To: <1381572908-22696-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 12 Oct 2013 12:15:08 +0200")
References: <1381572908-22696-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob6rpqsv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Using the 'local' site method works just fine for target
 Thomas> packages. However, for host packages, when HOST_<pkg>_SITE is
 Thomas> automatically defined by the package infrastructure to be equal to
 Thomas> <pkg>_SITE, when defining the <pkg>_OVERRIDE_SRCDIR, the $($(2)_SITE)
 Thomas> is empty, due to a missing additional dollar sign.

 Thomas> This patch ensures that the <pkg>_OVERRIDE_SRCDIR gets the correct
 Thomas> value, regardless of whether the HOST_<pkg>_SITE variable has been
 Thomas> defined by the package itself, or inferred by the package
 Thomas> infrastructure using the <pkg>_SITE value.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Reported-by: http://stackoverflow.com/questions/19311747/buildroot-cant-use-local-site-method-for-custom-host-packages

Heh, odd place to report such issues. Committed, thanks.

-- 
Bye, Peter Korsgaard
