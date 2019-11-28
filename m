From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:59:25 +0100
Subject: [Buildroot] [PATCH 3/3] package/nodejs: properly pass
 HOST_LDFLAGS when building host tools
In-Reply-To: <20191127203648.291701-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Nov 2019 21:36:48 +0100")
References: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
 <20191127203648.291701-4-thomas.petazzoni@bootlin.com>
Message-ID: <87imn4gffm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > After building host tools, we currently run a pass of patchelf to add
 > the proper RPATH to these tools so that they are able to find the
 > libraries they depend on.

 > Unfortunately, the "torque" host tool is used during the build itself,
 > before we have a chance to run "patchelf" on it. Since it is linked
 > against libcrypto.so available in $(HOST_DIR)/lib, the build aborts
 > because the RPATH is not set.

 > To fix this, we make sure that $(HOST_LDFLAGS) are properly taken into
 > account: since they contain the -Wl,-rpath option, the host tools will
 > have the correct RPATH. This both fixes the build failure, and makes
 > the patchelf hack no longer necessary.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12211
 >   http://autobuild.buildroot.net/results/a1f5e336ddaf386ba08eb5a7a299a48e2bdfe2d9/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
