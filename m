From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 17:35:16 +0200
Subject: [Buildroot] [PATCH] linux: ensure correct make targets are used
 for cuImage/simpleImage.<dtb>
In-Reply-To: <20180506063418.6326-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 6 May 2018 08:34:18 +0200")
References: <20180506063418.6326-1-peter@korsgaard.com>
Message-ID: <87r2mopzkb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/66561794
 > LINUX_DTS_NAME may end up with a leading space because of the += logic, and
 > may contain multiple dts files - Neither of which works when we construct
 > the {cu,simple}Image.$(LINUX_DTS_NAME) make target name.

 > Fix it by using the first word in the variable.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
