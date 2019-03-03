From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Mar 2019 22:16:15 +0100
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <20190126102355.24766-1-christian@paral.in> (Christian Stewart's
 message of "Sat, 26 Jan 2019 02:23:55 -0800")
References: <20190126102355.24766-1-christian@paral.in>
Message-ID: <87imwzk6ao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Go "modules" refers to the dependency fetching, verification (hashing), and
 > version control system built into Go as of 1.11.

 > It is not desirable to have Go modules enabled in Buildroot in the normal case,
 > as Buildroot manages downloading the sources, and third party dependency
 > managers are typically not used.

 > In the absence of the GO111MODULE environment variable, the Go compiler will
 > correctly compile using the "vendor" version of dependencies downloaded by
 > Buildroot during the compilation process for Go-based packages.

 > However, if the user sets the GO111MODULE=yes environment variable, the Go
 > compiler will download the Go dependencies for Buildroot packages, using the
 > modules system. This is potentially unintended behavior from user environment
 > variables.

 > This commit sets the GO111MODULE=off variable in the Go target and host
 > compilation environments, disabling Go modules support for Buildroot mainline
 > packages.

Committed after changing =yes to =on in the commit message, thanks.

-- 
Bye, Peter Korsgaard
