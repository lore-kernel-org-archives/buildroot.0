From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:05:34 -0300
Subject: [Buildroot] [PATCH 1/4] board/minnowboard-max: Rework to
	generate SD card image
In-Reply-To: <87bn5djn55.fsf@dell.be.48ers.dk>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D82EA.9010609@mind.be> <87bn5djn55.fsf@dell.be.48ers.dk>
Message-ID: <CAAEAJfB=q_axzabaGmX7NGOfB1Nnt96dWCEXnv7NkQXN=sxo4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 April 2016 at 16:59, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 04/12/16 07:29, Ezequiel Garcia wrote:
>  >> Let's rework the board and config files to use genimage
>  >> to generate the SD card image directly.
>  >>
>  >> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
>  > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  >> ---
>  >> board/minnowboard-max/genimage.cfg  | 34 ++++++++++++++++++++++++++++++++
>  >> board/minnowboard-max/post-image.sh | 13 +++++++++++++
>
>  >  If you feel up to it: I think it would be nice to add an fs/genimage
>  > infra that runs genimage at the end of the build with a user-specified
>  > config file. All the post-image scripts we have for the defconfigs are
>  > identical.
>
> Yes, I also think the time has come to add support for this.

I've just sent a patchset :-)

> Perhaps we
> should also add explicit sub options to pull in the needed dependencies
> (E.G. host-dosfstools/mtools for vfat, host-mtd for jffs2/ubifs,
> .. which isn't directly obvious).
>

Yeah, I thought about this, but went for the KISS (lazy?) option: just keep the
stuff as it is, and add the infra to make only the genimage call.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
