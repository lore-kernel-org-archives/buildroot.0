From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 May 2013 22:37:44 +0200
Subject: [Buildroot] [PATCH 3/5] portaudio: needs threads
In-Reply-To: <1369268647-13128-3-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Wed, 22 May 2013 17:24:05 -0700")
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-3-git-send-email-gilles.talis@gmail.com>
Message-ID: <87ppwhig9z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/ba2/ba2d3832cb6838b2126e0f7db223305eab579d59

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/portaudio/Config.in |    4 ++++
 Gilles>  1 files changed, 4 insertions(+), 0 deletions(-)

 Gilles> diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
 Gilles> index df884a7..0a4d71b 100644
 Gilles> --- a/package/portaudio/Config.in
 Gilles> +++ b/package/portaudio/Config.in
 Gilles> @@ -1,11 +1,15 @@
 Gilles>  config BR2_PACKAGE_PORTAUDIO
 Gilles>  	bool "portaudio"
 Gilles> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Gilles>  	help
 Gilles>  	  PortAudio is a free, cross-platform, open-source,
 Gilles>  	  audio I/O library.
 
 Gilles>  	  http://www.portaudio.com/
 
 Gilles> +comment "portaudio needs a toolchain threads support"
 Gilles> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 Gilles> +

This needs to go either above BR2_PACKAGE_PORTAUDIO or all the way at
the bottom, otherwise the suboptions doesn't get properly indented in
menuconfig.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
