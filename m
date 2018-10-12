From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Oct 2018 21:50:08 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix static linking build failure
 when using libavutil
In-Reply-To: <8fb396bf-456c-2385-8fd0-84cbd4142e56@micronovasrl.com>
References: <20180911204230.15890-1-giulio.benetti@micronovasrl.com>
 <20180916222224.519fa1f8@windsurf>
 <63ee101c-ee45-57cc-4aeb-7f3b49753ccb@micronovasrl.com>
 <20180924130929.4b345624@windsurf>
 <1b5dece6-8730-89d4-53dc-44f3492c49d9@micronovasrl.com>
 <8fb396bf-456c-2385-8fd0-84cbd4142e56@micronovasrl.com>
Message-ID: <20181012215008.0eab3a2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 19:38:14 +0200, Giulio Benetti wrote:

> >>>> Indeed, when we're dynamic linking, there is no need to link consumers
> >>>> of libavutil with libdrm. It is only when we're statically linking that
> >>>> it should be done. And that's exactly what Libs vs. Libs.private is for.  
> >>>
> >>> You've explained me it very well, but by now FFmpeg upstreamed my patch:
> >>> https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c50dc77ac708e98d02da7c422a6b9cbf9f565aa5
> >>>
> >>> So, do I rework and resubmit to them or can I re-create a patch for BR
> >>> with what you've pointed me above?  
> I've missed one thing to ask you about ffmpeg:
> Can I still use this hack:
> https://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff/bc2301429e9c779237e43acf913331af018211f2..c50dc77ac708e98d02da7c422a6b9cbf9f565aa5:/configure
> 
> to obtain if -ldrm is used and then add it to Libs.private like this:
> Libs.private: -ldrm
> 
> as you've pointed me.
> 
> Or there is something that makes it simpler and better?

I'm not sure what "hack" you're talking about here. My only point it is
only needed to link "indirect" libraries when static linking, and
therefore such "indirect" libraries should be listed in Libs.private
and not Libs in pkg-config files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
