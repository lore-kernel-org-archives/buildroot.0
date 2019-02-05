From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Feb 2019 23:06:26 -0200
Subject: [Buildroot] [PATCH] support/testing: use minimal build for
 test_git
References: <1549298395-7248-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5c58e192bcd82_290e3faf9e10c0c41288b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for looking into this.

+ Arnout

On Mon, Feb 04, 2019 at 02:39 PM, Matt Weber wrote:

> Original configuration results in a full Buildroot internal toolchain
> build.  This config update drops the build time to ~60sec from ~700sec.

It should not be needed if we split runtime test from BRTest
http://patchwork.ozlabs.org/patch/912353/
and make test_git inherit from the new BRTest.

Then we build almost nothing. Actually host-lzip is built in the GitRefs test
case because the docker image does not have it or it has an unsuitable version,
I did not checked what is the reason, the former or the latter.

But I am not against using this patch as a quick solution.


Regards,
Ricardo
