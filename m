From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:37:11 +0100
Subject: [Buildroot] [PATCH] x264: fix build on OpenRISC
In-Reply-To: <1488635150-9381-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488635150-9381-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305213711.3b5adfb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 14:45:50 +0100, Thomas Petazzoni wrote:
> Even though x264 doesn't use an autoconf generated configure script
> (and hence doesn't use the autotools-package infrastructure), it uses
> config.guess and config.sub. The ones bundled in x264 are too old to
> know about the OpenRISC architecture, so this commit leverages the
> UPDATE_CONFIG_HOOK from the autotools-package infrastructure to update
> config.sub and config.guess.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b458c2dff0ecde61248f058092c6eeaa75039cfb
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/x264/x264.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
