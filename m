From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 21:38:57 +0200
Subject: [Buildroot] [PATCH] package/docker-cli: fix version info since
 move to 19.03.x
In-Reply-To: <20200831065842.9869-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 31 Aug 2020 08:58:41 +0200")
References: <20200831065842.9869-1-peter@korsgaard.com>
Message-ID: <877dtd8ey6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Upstream changed the variables used when outputting version / git commit
 > info in docker version since:

 >  commit 04b5f44230162de40741acaa0f94c7af6f2fa1d5
 >  Author: Ian Campbell <ijc@docker.com>
 >  Date:   Tue Jan 8 15:03:51 2019 +0000

 >     Move versioning variables to a separate package.

 >     This helps to avoid circular includes, by separating the pure data out from the
 >     actual functionality in the cli subpackage, allowing other code which is
 >     imported to access the data.

 >     Signed-off-by: Ian Campbell <ijc@docker.com>
 >     Upstream-commit: 20c19830a95455e8562551aad52c715ad0807cc6
 >     Component: cli

 > Which is included in docker-cli 19.3.x - So adjust the _CLI_LDFLAGS to match
 > to get proper docker version output:

 > Client:
 >  Version:           19.03.11
 >  API version:       1.40
 >  Go version:        go1.13.14
 >  Git commit:        19.03.11

 > vs:

 > Client:
 >  Version:           unknown-version
 >  API version:       1.40
 >  Go version:        go1.13.14
 >  Git commit:        unknown-commit

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
