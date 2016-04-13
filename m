From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Apr 2016 21:59:18 +0200
Subject: [Buildroot] [PATCH 1/4] board/minnowboard-max: Rework to
	generate SD card image
In-Reply-To: <570D82EA.9010609@mind.be> (Arnout Vandecappelle's message of
 "Wed, 13 Apr 2016 01:21:14 +0200")
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D82EA.9010609@mind.be>
Message-ID: <87bn5djn55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/12/16 07:29, Ezequiel Garcia wrote:
 >> Let's rework the board and config files to use genimage
 >> to generate the SD card image directly.
 >> 
 >> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >> ---
 >> board/minnowboard-max/genimage.cfg  | 34 ++++++++++++++++++++++++++++++++
 >> board/minnowboard-max/post-image.sh | 13 +++++++++++++

 >  If you feel up to it: I think it would be nice to add an fs/genimage
 > infra that runs genimage at the end of the build with a user-specified
 > config file. All the post-image scripts we have for the defconfigs are
 > identical.

Yes, I also think the time has come to add support for this. Perhaps we
should also add explicit sub options to pull in the needed dependencies
(E.G. host-dosfstools/mtools for vfat, host-mtd for jffs2/ubifs,
.. which isn't directly obvious).

-- 
Bye, Peter Korsgaard
