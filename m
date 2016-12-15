From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 17:19:06 +0100
Subject: [Buildroot] [PATCH] docker-engine: needs pkg-config
In-Reply-To: <20161214223943.16676-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 14 Dec 2016 23:39:43 +0100")
References: <20161214223943.16676-1-peter@korsgaard.com>
Message-ID: <8760mlcghx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.org/results/fcc/fcc32f6cdc46f354a016a9b137d4f51d4054cdb6/
 > http://autobuild.buildroot.org/results/083/0832b7be86c525522e2caed66246d5aeb365afb2/
 > http://autobuild.buildroot.org/results/ede/ede0ddf0c5685ece8443a9b1bbd5c63b4d98af33/

 > pkg-config is used for some of the docker-engine dependencies (at least
 > libseccomp and libsystemd), so make sure it is available.

 > The make.sh script used to configure docker-engine uses the PKG_CONFIG
 > variable, but the libseccomp-golang go module simply uses whatever
 > pkg-config binary it finds in the path at build time, so also pass
 > TARGET_MAKE_ENV to ensure our cross-pkg-config is used.

 > For consistency and robustness against future changes, use both approaches
 > for the configure and build steps.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
