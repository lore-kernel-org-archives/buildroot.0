From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:56:07 +0100
Subject: [Buildroot] [PATCH v4 04/18] fs/tar: make results reproducible
In-Reply-To: <1479905937-17241-5-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-5-git-send-email-jezz@sysmic.org>
Message-ID: <20161123225607.573c13a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:43 +0100, J?r?me Pouiller wrote:

>  define ROOTFS_TAR_CMD
> -	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
> +	( cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
> +		tar $(TAR_OPTS) -cf $@ --null -T - --no-recursion --numeric-owner )

I've remove the space after ( and before ).

Applied with this changed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
