From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 23:08:22 +0100
Subject: [Buildroot] [git commit] go: explicitly disable modules to
 avoid unintended network lookup
In-Reply-To: <20190303211425.3DE288D463@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 3 Mar 2019 22:15:24 +0100")
References: <20190303211425.3DE288D463@busybox.osuosl.org>
Message-ID: <87pnqp8889.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f7a2870dd1fef9ee41e78ea1bcbb2ec61e82eb67
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Go "modules" refers to the dependency fetching, verification (hashing), and
 > version control system built into Go as of 1.11.

 > It is not desirable to have Go modules enabled in Buildroot in the normal case,
 > as Buildroot manages downloading the sources, and third party dependency
 > managers are typically not used.

 > In the absence of the GO111MODULE environment variable, the Go compiler will
 > correctly compile using the "vendor" version of dependencies downloaded by
 > Buildroot during the compilation process for Go-based packages.

 > However, if the user sets the GO111MODULE=on environment variable, the Go
 > compiler will download the Go dependencies for Buildroot packages, using the
 > modules system. This is potentially unintended behavior from user environment
 > variables.

 > This commit sets the GO111MODULE=off variable in the Go target and host
 > compilation environments, disabling Go modules support for Buildroot mainline
 > packages.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
