From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Sep 2014 09:42:24 +0200
Subject: [Buildroot] [PATCH] ipackage/cdrkit: fix namespace of variables
In-Reply-To: <1411762440-17520-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 26 Sep 2014 22:13:59 +0200")
References: <1411762440-17520-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d2ahy0f3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Not all cdrkit variables are prefixed with CDRKIT_, so they leak.
 > Most importantly, they look like they belong to another package's
 > namespace, cmake, as they start with CMAKE_ (but fortunately, they
 > have no impact on cmake, as they are not used by our infras.)

 > Fix that by removing the intermediate variables, and directly set
 > the CDRKIT_CONF_OPT variable.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with $SUBJECT fixed, thanks.

-- 
Bye, Peter Korsgaard
