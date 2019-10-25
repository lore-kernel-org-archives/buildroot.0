From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 18:41:36 +0200
Subject: [Buildroot] [PATCHv2] package/kmod: add patch fixing the build
 with Python 3.8
In-Reply-To: <20191025093136.7621-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 25 Oct 2019 11:31:36 +0200")
References: <20191025093136.7621-1-thomas.petazzoni@bootlin.com>
Message-ID: <87tv7wixq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since the bump of python3 to 3.8, the kmod Python extensions fail to
 > build. There was a change in Python 3.8: they no longer want Python
 > extensions to be linked with libpython.

 > However, kmod Python extensions are built with -Wl,--no-undefined,
 > which checks that there isn't any unresolved symbol in the .so files
 > being built. This is not compatible with the new Python policy, so we
 > add a patch (submitted upstream) that passes -Wl,-z,undefs when
 > building the kmod Python extensions, to override the effect of
 > -Wl,--no-undefined.

 > Fixes:

 >   http://autobuild.buildroot.net/results/84455dbc892865b9748bedeecb1d3b0bdc15704d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes from v1 to v2:
 > - Add link to the patch sent upstream

Committed, thanks.

-- 
Bye, Peter Korsgaard
