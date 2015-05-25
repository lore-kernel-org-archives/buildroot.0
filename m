From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:14:53 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: fix static linking for
	test-unicode program
In-Reply-To: <5562DD0F.8020707@openwide.fr> (Romain Naour's message of "Mon,
 25 May 2015 10:27:59 +0200")
References: <1431988660-3991-1-git-send-email-romain.naour@openwide.fr>
 <20150521123759.5b3c9706@free-electrons.com>
 <5562DD0F.8020707@openwide.fr>
Message-ID: <87egm4za6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

Hi,

>> So shouldn't we fix icu-uc.pc instead of hardcoding the need for
 >> -lstdc++ in harfbuzz?

 > Yes you're right, but it would require invasive change in icu build system.
 > If we want to do things right, we needs to patch configure.ac to add -lstdc++
 > when --enable-static is passed to icu's configure script.

Why only add it conditionally? The Libs.private stuff is only used for
static linking, so it can just be added unconditionally.

-- 
Bye, Peter Korsgaard
