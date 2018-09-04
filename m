From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Sep 2018 22:58:44 +0200
Subject: [Buildroot] [PATCH v3] mediastreamer: fix avcodec functions
 conflict
In-Reply-To: <20180904131251.30724-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 4 Sep 2018 15:12:51 +0200")
References: <20180904131251.30724-1-giulio.benetti@micronovasrl.com>
Message-ID: <87va7lasjf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Autotools miss avcodec function check leading to conflicts between local
 > functions and avcodec functions.

 > Add patch to swap $FFMPEG_LIBS and -lavutil which are checked when
 > AC_CHECK_LIB on avcodec_* functions. $FFMPEG_LIBS contain -ldrm that must
 > be listed after -lavutil.

 > Fixes:
 > http://autobuild.buildroot.net/results/394/3945e06ea0dd1e16013184fbab5b67b3561c87ce/
 > http://autobuild.buildroot.net/results/576/576c7d71313c45753848462717200b2b8ff5bb0e/
 > http://autobuild.buildroot.net/results/f33/f339ac6ea30815eeb8ecb144c971f56c06a9f995

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 > Changes V2->V3:
 > * don't append -ldrm, swap $FFMPEG_LIBS with -lavutil

 > Changes V1->V2:
 > * merge -ldrm into FFMPEG_LIBS instead of repeating it thrice.

Committed after extending the commit message to clarify that this is
about static linking, thanks.

-- 
Bye, Peter Korsgaard
