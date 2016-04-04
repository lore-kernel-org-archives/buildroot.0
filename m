From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 01:25:20 +0200
Subject: [Buildroot] [PATCH v4 6/7] barebox: support 2nd config build
In-Reply-To: <1458513351-6556-7-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-7-git-send-email-pieter@boesman.nl>
Message-ID: <5702F7E0.1060601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 23:35, Pieter Smith wrote:
> Adds support to build barebox with a 2nd config.
>
> This is useful for building an SPL (Secondary Program Loader) in addition to
> the traditional TPL (Tertiary Program Loader). The Beaglebone Black for example
> has two barebox configurations:
> - am335x_defconfig builds the full barebox bootloader with device tree, and
> - am335x_mlo_defconfig builds the smaller MLO bootloader that loads the full
>    barebox bootloader from the eMMC or SD card.
>
> Signed-off-by: Pieter Smith<pieter@boesman.nl>

  Looks good to me, except for the comments I made for barebox-1:

- BR2_TARGET_BAREBOX_2_BUILT_IMAGE_FILE name+prompt;

- BR2_TARGET_BAREBOX_2_OUTPUT_IMAGE_FILE name or maybe remove;

- Redundant $(call ...)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
