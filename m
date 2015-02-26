From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:48:52 +0100
Subject: [Buildroot] [PATCH 1/1] libgc: Remove duplicated package
In-Reply-To: <1424988981-9787-1-git-send-email-paguilar@paguilar.org> (Pedro
 Aguilar's message of "Thu, 26 Feb 2015 23:16:21 +0100")
References: <1424988981-9787-1-git-send-email-paguilar@paguilar.org>
Message-ID: <87ioeo47cb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pedro" == Pedro Aguilar <paguilar@paguilar.org> writes:

 > Remove libgc that is a copy of bdwgc but it's not used
 > by any package and gives an error when building make-4.1.
 > bdwgc is a mandatory dependency for guile.

Funky - But libgc seems to be newer (7.4.0) than bdwgc (7.2f)?

bdwgc has not been in any released version, but libgc has so if we
remove the symbol we should add Config.in.legacy handling for it.

-- 
Bye, Peter Korsgaard
