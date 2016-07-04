From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:16:45 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pulseaudio: allow to build
 without C++11 support
In-Reply-To: <1467588906-14153-1-git-send-email-romain.naour@gmail.com>
References: <1467588906-14153-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160704171645.1fd6d7db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 01:35:04 +0200, Romain Naour wrote:
> C++11 support is only required for WebRTC optional support but
> pulseaudio can still be built with toolchains based on gcc 4.7 or older
> witch doesn't have it.
> 
> Add a patch to make C++11 support optional and explicitely check for
> gnu++11. Also stop the build only if no C++11 support has been found
> and WebRTC support has been resquested.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d89/d897a94a8b6a52eba03d04c24536f554a7643000
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: keep original comments in configure.ac (Yann)
>     fix syntax paramters to m4 macros (Yann)
> ---
>  ...-C-11-is-only-required-for-WebRTC-support.patch | 41 ++++++++++++++++++++++
>  package/pulseaudio/pulseaudio.mk                   |  3 ++
>  2 files changed, 44 insertions(+)
>  create mode 100644 package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch

Series applied, thanks. Please don't forget to send the patch
upstream to pulseaudio people.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
