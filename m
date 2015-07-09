From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Jul 2015 08:53:08 +0200
Subject: [Buildroot] [PATCH] openssl: fix static build
In-Reply-To: <1436265478-3738-1-git-send-email-benoit@wsystem.com>
 (=?utf-8?Q?=22Beno=C3=AEt=09Th=C3=A9baudeau=22's?= message of "Tue, 7 Jul
 2015 12:37:58 +0200")
References: <1436265478-3738-1-git-send-email-benoit@wsystem.com>
Message-ID: <87twtdlt4b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:

 > If configured with no-dso, the openssl binary still gets linked with
 > -ldl, while libdl is not available for static-only builds. The OpenSSL
 > framework does not support automatically dropping -ldl with no-dso, so
 > -ldl has to be removed from Makefile after calling ./Configure.

 > Fixes http://autobuild.buildroot.org/results/cbb35f2582f1cfeb3d11cb4952a80784ff660baf

 > Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
