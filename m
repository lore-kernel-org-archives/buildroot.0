From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 May 2011 12:26:29 +0200
Subject: [Buildroot] [PATCH] Disabled altivec optimizations for PPC CPUs
	lacking it
In-Reply-To: <1305231160-15062-1-git-send-email-mike@mikebwilliams.com> (Mike
	Williams's message of "Thu, 12 May 2011 16:12:40 -0400")
References: <1305231160-15062-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <871v02lwve.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:

 Mike> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
 Mike> ---
 Mike>  package/multimedia/ffmpeg/ffmpeg.mk |    8 ++++++++
 Mike>  1 files changed, 8 insertions(+), 0 deletions(-)

 Mike> diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
 Mike> index 1e8f09a..e58add4 100644
 Mike> --- a/package/multimedia/ffmpeg/ffmpeg.mk
 Mike> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
 Mike> @@ -142,6 +142,14 @@ endif
 Mike>  ifeq ($(BR2_cortex_a8),y)
 Mike>  FFMPEG_CONF_OPT += --enable-neon
 Mike>  endif
 Mike> +#Set powerpc altivec appropriately
 Mike> +ifeq ($(BR2_powerpc),y)
 Mike> +ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)

If prefer to use positive logic, E.G. ifeq (...,y) - Committed with that
change, thanks.

-- 
Bye, Peter Korsgaard
