From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 23:40:40 +0200
Subject: [Buildroot] [PATCH] package/netsurf: remove package
In-Reply-To: <20190531081957.12781-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 31 May 2019 10:19:56 +0200")
References: <20190531081957.12781-1-peter@korsgaard.com>
Message-ID: <874l5awbdz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The package causes a large amount of build failures, E.G.:
 > http://autobuild.buildroot.net/results/eaf/eafc3e4be571d5ecee549a11530ac4e508f31782/

 > Caused by the custom build system mixing up host and target compiler flags.
 > The original submitter seems no longer active in fixing the package, so lets
 > drop it rather than releasing with a known broken package.

 > If these issues gets fixed upstream then the package can be re-added.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

During discussions about this on IRC there was some doubts about
removing the package this close to the release, so I have instead sent a
patch disabling it for architectures where we pass ABI specific CFLAGS
(as the build system ends up passing those to the host compiler as well)
and marked this patch as superseeded.

-- 
Bye, Peter Korsgaard
