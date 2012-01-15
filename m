From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jan 2012 20:05:40 +0100
Subject: [Buildroot] [PATCH v2] New package: sane-backends
In-Reply-To: <1326197939-26535-1-git-send-email-fhunleth@troodon-software.com>
References: <1326197939-26535-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <201201152005.40245.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 10 January 2012 13:18:59 Frank Hunleth wrote:
> +SANE_BACKENDS_DEPENDENCIES += libusb
> +SANE_BACKENDS_CONF_OPT += --enable-libusb_1_0

 Since there is an optional dependency on libjpeg, I guess it needs 
something like:

ifeq (BR2_PACKAGE_JPEG,y)
SANE_BACKENDS_DEPENDENCIES += jpeg
endif

 And ideally it should also have a config option to select the backends.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120115/530c5abc/attachment.html>
