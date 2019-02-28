From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 28 Feb 2019 09:11:57 +0100
Subject: [Buildroot] package/opencv3: missing ffmpeg and gstreamer on
 configure step.
In-Reply-To: <33d3498225ef647bfc2830bc4df5e67d0353b2d0.camel@synopsys.com>
References: <33d3498225ef647bfc2830bc4df5e67d0353b2d0.camel@synopsys.com>
Message-ID: <14534_1551341522_5C7797D2_14534_45_2_20190228081157.GA18744@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy, All,

On 2019-02-27 13:04 +0000, Evgeniy Didin spake thusly:
> Trying to build opencv3 with enabled ffmpeg and gstreamer support I have faced with the issue, that
> during configure process opencv3 is not able to find ffmpeg and gstreamer, which are already built.
> Here is part of the config log:
> --------------------8<---------------------------------
> ...
> -- Looking for sys/videoio.h
> -- Looking for sys/videoio.h - not found
> -- Can't find ffmpeg - 'pkg-config' utility is missing

First, you need to add host-pkgconf to OPENCV3_DEPENDENCIES.
See if that fixes the problem, at least for ffmpeg.

Regards,
Yann E. MORIN.

> -- Performing Test HAVE_CXX_WNO_DEPRECATED
> ...
> -------------------->8---------------------------------
> 
> And finally in the end of log I see next message:
> --------------------8<---------------------------------
> ...
> --   Video I/O:
> --     FFMPEG:                      NO
> --       avcodec:                   NO
> --       avformat:                  NO
> --       avutil:                    NO
> --       swscale:                   NO
> --       avresample:                NO
> --     GStreamer:                   NO
> --     libv4l/libv4l2:              NO
> --     v4l/v4l2:                    linux/videodev2.h
> ...
> -------------------->8---------------------------------
> 
> At the same time modifying output/build/opencv3-3.4.3/CMakeLists.txt file
> by adding lines like "set(HAVE_FFMPEG YES)" leads to successfull opencv3 building
> with ffmpeg and gstreamer support.
> 
> Is it a know issue?
> Maybe I have missed something during configurating of the build?
> 
> Best regards,
> Evgeniy Didin
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
