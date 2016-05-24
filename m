From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 20:46:33 +0200
Subject: [Buildroot] [PATCH] mpg123: unbreak static linking with
	alsa/portaudio
In-Reply-To: <20160524204107.570fbb64@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 24 May 2016 20:41:07 +0200")
References: <1464112745-4450-1-git-send-email-peter@korsgaard.com>
 <20160524204107.570fbb64@free-electrons.com>
Message-ID: <87wpmjb8fq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 24 May 2016 19:59:05 +0200, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.org/results/b2b/b2bc143fbd0b34e75a44af41ab6899dd9fa3c21a/
 >> http://autobuild.buildroot.org/results/60d/60d56b0a75d209f2cfeff0727c2f900abc89d263/
 >> http://autobuild.buildroot.org/results/6a8/6a8729ce69055821fdf0b91adcea2ea201d40189/
 >> 
 >> And many more.
 >> 
 >> A recent upstream build system change caused LIBS to be ignored at build
 >> time (but still used a configure time), causing our static linking
 >> workarounds to no longer work.
 >> 
 >> Fix it by adding a patch to cause it to no longer ignore LIBS.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > It would be so much better to use pkg-config, especially since they
 > already use PKG_CHECK_MODULES() in their configure script to detect
 > other packages.

Agreed, but I wanted as minimalistic as possible fix for 2016.05.

-- 
Venlig hilsen,
Peter Korsgaard 
