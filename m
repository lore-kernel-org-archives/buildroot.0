From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 07:38:36 +0200
Subject: [Buildroot] [PATCH] fxload: do not pass -g on Microblaze
In-Reply-To: <1494878505-27111-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 May 2017 22:01:45 +0200")
References: <1494878505-27111-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871srp9x9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > gcc on Microblaze is affected by PR63261, which causes a build failure
 > when optimization *and* debugging symbols are enabled. As a
 > work-around, do not build fxload with debugging symbols.

 > Fixes:

 >   http://autobuild.buildroot.net/results/24640a042d84f45339246c0a18e10905494b2199/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > A possible alternate solution is to disable fxload on Microblaze
 > entirely. If you prefer this option, let me know, and I'll send a
 > different patch.

I wouldn't mind just disabling fxload. I personally haven't seen any hw
with the cypress 8051's needing fxload in the last 10 years or so, and
there are no reverse dependencies.

I see that the bug is very old :/ I wonder why we don't have a lot of
other fallout from it - Is fxload really the only package passing -g or
is the fxload source code so special that the bug only triggers there?

-- 
Bye, Peter Korsgaard
