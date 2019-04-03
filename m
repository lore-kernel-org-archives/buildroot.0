From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Apr 2019 13:32:58 +0200
Subject: [Buildroot] [PATCH v3] package/libcamera: Add libcamera package
In-Reply-To: <20190403112902.29930-1-kieran.bingham@ideasonboard.com>
References: <20190403112902.29930-1-kieran.bingham@ideasonboard.com>
Message-ID: <4b4aeae9-67d5-f958-91ad-cfb0db784c2d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/04/2019 13:29, Kieran Bingham wrote:
> +LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> +LIBCAMERA_VERSION = d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080
> +LIBCAMERA_SITE_METHOD = git

 That debug line gave me the idea... you can use an http download on gitlab:

LIBCAMERA_SITE =
https://gitlab.com/libcamera/libcamera/-/archive/$(LIBCAMERA_VERSION)
LIBCAMERA_SOURCE = libcamera-$(LIBCAMERA_VERSION).tar.bz2

 Only, I'm not sure how stable the tarball generation is, i.e. if it will always
yield the same hash.


 Either way:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
