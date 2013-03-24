From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 12:44:59 +0100
Subject: [Buildroot] [PATCH 03/22] libgtk2: use non-host specific patch
In-Reply-To: <1364113606-20836-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:27 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hak1nhs4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The libgtk2 package was using a host-<foo>.patch that should be
 Thomas> applied only on the host variant of the package. Unfortunately, with
 Thomas> the patch model rework, this doesn't work anymore: Buildroot tries to
 Thomas> apply the patch twice, for some reason.

 Thomas> But instead of fixing the patch model, it is probably a lot better to
 Thomas> fix this patch itself, which is the only usage of host-only patch in
 Thomas> Buildroot.

 Thomas> So instead of simply removing code that detects dependencies in gtk2's
 Thomas> configure.in script, we use a condition based on the value of
 Thomas> gdktarget. And it turns out that it makes the patch shorter.

 Thomas> However, it requires autoreconfiguring the libgtk2 target package,
 Thomas> because we are now modifying its configure.in.

Committed, thanks.

-- 
Bye, Peter Korsgaard
