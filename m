From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:03:05 +0100
Subject: [Buildroot] [PATCH v2 00/54] package/kodi: bump version to
 19.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210306230305.24e8cfef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue,  2 Mar 2021 08:06:55 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> this series bumps kodi to 19.0-Matrix.

Thanks a lot for this series. I have applied it all to the next branch!

First of all, I have to say that it was really a pleasure to see such
documented commit logs, with the details of why the different packaging
changes are being made. It definitely made the series easier to review,
so thanks a lot for this.

I only encountered a few small issues:

 - You forgot the Config.in.legacy entry when dropping
   kodi-screensaver-crystalmorph

 - For the kodi-pvr-mediaportal-tvserver there were line ending issues
   with the patches, but it was not your fault, the line endings get
   damaged by patchwork

 - For another patch (don't remember which one), you had forgotten to
   update the .hash file to take into account the fact that the license
   file is now LICENSE.md.

There are two things however that would be nice to improve:

 - Be able to drop the significant patches on
   kodi-pvr-mediaportal-tvserver, but I see they are already submitted
   upstream, so I assume some next release will allow to drop them.

 - Be able to drop the manual calls to pkg-config --cflags/--libs egl
   that exist in a few packages.

Once again, many thanks for all this work on Kodi!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
