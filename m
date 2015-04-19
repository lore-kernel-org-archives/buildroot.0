From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:42:35 +0200
Subject: [Buildroot] [PATCH] live555: fix library installation
In-Reply-To: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>
References: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150419134235.18c914b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Thu, 16 Apr 2015 16:50:50 +0200, Luca Ceresoli wrote:
> The manual target installation commands optionally copies 3 executables
> that demonstrate the library usage, but do not the library itself.
> 
> This results in the following errors at runtime:
> 
>   # openRTSP
>   openRTSP: can't load library 'libliveMedia.so.38'
>   # live555MediaServer
>   live555MediaServer: can't load library 'libliveMedia.so.38'
>   # MPEG2TransportStreamIndexer
>   MPEG2TransportStreamIndexer: can't load library 'libliveMedia.so.38'
>   #

I understand the issue, but I'm not entirely happy with the solution.
There are some options BR2_PACKAGE_LIVE555_OPENRTSP,
BR2_PACKAGE_LIVE555_MEDIASERVER, etc. to control which tools to
install. But with your new patch, regardless of the value of those
options, a lot of other programs (tests and others) are installed.
Which make the existing per-program options a bit weird/useless.

I would personally advocate for a simple removal of the per-program
options, just install everything, and leave it to post-build scripts to
clean up what's needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
