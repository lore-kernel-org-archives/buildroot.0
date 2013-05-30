From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:47:40 +0200
Subject: [Buildroot] [PATCH 2/6] gettext: don't patch different the host
	and target build
In-Reply-To: <1369695664-5670-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:01:00 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li6wz1ur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, the gettext source code was being patched differently for
 Thomas> the host and the target build, which is going to be incompatible with
 Thomas> out-of-tree build. The difference is that the gettext tools could be
 Thomas> disabled in the target build, but are always enabled on the host
 Thomas> build.

 Thomas> Therefore, this commit switches the gettext package to using proper
 Thomas> patches against the relevant configure.ac and Makefile.am
 Thomas> files. gettext is now being autoreconfigured. Configuration options
 Thomas> are also passed for the host variant, in order to disable the build of
 Thomas> a large number of things we don't care about.

 Thomas> Finally, the two existing patches are renamed to include a number in
 Thomas> their filename.

Committed to next, thanks.

Please don't forget to send the patches upstream.

-- 
Bye, Peter Korsgaard
