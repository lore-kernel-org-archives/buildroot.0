From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 23:47:00 +0100
Subject: [Buildroot] [PATCH] fs: set packages permissions even with no
	system device tables
In-Reply-To: <1481754490-12801-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 14 Dec 2016 23:28:10 +0100")
References: <1481754490-12801-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oa0eyvq3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when there is no sytem device table (permissions or static
 > devices) defined, then package permissions are not applied, because they
 > are guarded by the check on the system device tables being non empty.

 > Fix that by narrowing the guarding condition.

 > Note that the dependency on host-makedevs was not conditional; we always
 > build it even if we don;t need it. Making it conditional is not
 > possible, because we don't know all the packages permissions by the time
 > the fs infra is parsed (packages from br2-external are parsed after it).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

Out of interest, what is your use case for NOT having any system device
table?

-- 
Bye, Peter Korsgaard
