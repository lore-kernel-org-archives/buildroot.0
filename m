From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 17:55:58 +0100
Subject: [Buildroot] [PATCH] pkg-download: support file:// in
 BR2_PRIMARY_SITE
In-Reply-To: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
References: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151117175558.156ea1f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 17 Nov 2015 17:07:58 +0100, J?r?me Pouiller wrote:
> This feature was already discuted here:
> 
>   http://lists.busybox.net/pipermail/buildroot/2015-April/125419.html
> 
> Personally, I have a big central directory with all tarballs I have
> ever downloaded. I use this feature to isolate tarballs necessary to
> build a configuration:
> 
>   make project_defconfig
>   make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
>   tar -C /tmp -czvf mirror-project.tgz mirror-project

You have a much simpler option:

	make external-deps

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
