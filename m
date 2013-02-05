From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Feb 2013 22:28:04 +0100
Subject: [Buildroot] [PATCH 2/4] target/generic: add filesystem overlay
	option
In-Reply-To: <874nhqpkdg.fsf@dell.be.48ers.dk>
References: <cover.1360084128.git.arnout@mind.be>
 <cover.1360084128.git.arnout@mind.be>
 <228e7c83b0dda1bb7e9ba6748ade0974368b8335.1360084128.git.arnout@mind.be>
 <874nhqpkdg.fsf@dell.be.48ers.dk>
Message-ID: <51117964.7070409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/13 21:37, Peter Korsgaard wrote:
>   Arnout> +	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
>   Arnout> +		if [ -d $${dir} ]; then \
>   Arnout> +			$(call MESSAGE,"Copying overlay $${dir}"); \
>   Arnout> +			rsync -a \
>   Arnout> +				--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
>   Arnout> +				$${dir}/ $(TARGET_DIR); \
>   Arnout> +		fi \
>
> Similar to the recent discussion about the post-build script, I don't
> think we should ignore missing (misspelled?) directories, so I dropped
> the -d test and committed, thanks.

  Yes, thanks, that was a left-over from when I had a default value for 
the overlay.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
