From: Andreas Naumann <dev@andin.de>
Date: Fri, 31 Mar 2017 09:46:29 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
Message-ID: <f2428cf7-660e-f22d-0e5e-4b22e1abf870@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Phelip,

Am 31.03.2017 um 00:51 schrieb Arnout Vandecappelle:
>
>  I'm still not entirely sure if this new option is worthwhile. Without it, you
> would instead need
>
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> BR2_ROOTFS_POST_SCRIPT_ARGS="board/acmesystems/aria-g25/genimage.cfg"
>
> Not really complicated either... The only real advantage I see is that it
> motivates people more to use genimage (which is otherwise a bit hidden). But for
> that, a paragraph or two in docs/manual/customize-post-image.txt would also
> work. By the way, even for this series an explanation of the option would be
> required in that file.
>
>  What do the others think?

I have a slightly different use case than most genimage configs in 
buildroot right now. This is, I use genimage's ability to split my 
customized rootfs into multiple filesystems in order to give them them 
ro/writeable and other capabilities as appropriate.
Thus to preserve ownership and such I need to run genimage under 
fakeroot. Currently I do this explicitely in a post image script. An 
improvement I think about is switching to using the post fakeroot 
integration which buildroot provides since a while.

So unless this becomes some kind of option, your proposed change 
probably wouldnt work for me.

What I was thinking about in the past would be a deeper integration of 
genimage in buildroots filesystem configuration, actually generating the 
genimage config. But so far it was not worth the effort for me.


regards,
Andreas

>
>
>  Regards,
>  Arnout
>
