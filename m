From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:40:08 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <1479460224-6119-5-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124008.2b7a3178@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:13 +0100, J?r?me Pouiller wrote:

> -# Minimal version = 1.17 (previous versions do not correctly unpack archives
> -# containing hard-links if the --strip-components option is used).
> +# Minimal version = 1.28 (previous versions do not does not support --sort=name)
>  major_min=1
> -minor_min=17
> +minor_min=28

Unfortunately, this version dependency is not really acceptable I'm
afraid. Ubuntu 14.04, which is really not that old, only has tar 1.27.

And the old Debian 6.0 that I have for the autobuilders to test "old
systems" uses tar 1.23.

Can we find a better way?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
