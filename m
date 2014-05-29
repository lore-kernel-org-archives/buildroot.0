From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 29 May 2014 11:21:35 +0200
Subject: [Buildroot] [PATCH 1/3] Add the capability to create
	sub-filesystems from the target filesystem.
In-Reply-To: <1401341054-16705-2-git-send-email-vomlehn@canopus-us.com>
References: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
 <1401341054-16705-2-git-send-email-vomlehn@canopus-us.com>
Message-ID: <2385189.JHtluQLb2I@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Wednesday 28 May 2014 22:24:12 vomlehn at canopus-us.com wrote:
> For example, say that the the root filesystem has a set of files and
> directories that are critical to being able to control, recover, and
> install software on an embedded system. These are redundantly stored in a
> small but reliable memory. The rest of the system is written in Python,
> which is huge (too big to fit in the reliable memory) but not a critical
> part of the system. It can, if necessary, be reloaded remotely, so it is
> stored without redundancy, in NAND flash.
> 
> This patch allows these two pieces to be split up so that the reliable core
> can be an initramfs filesystem (in cpio format) and a JFFS2 image can hold
> the rest of the root filesystem. It supports an arbitrary division of the
> root filesystem among one or more of the available filesystem formats.

Did you check features of "genimage" tool? It looks like it do similar work. 
Maybe it would be better to add missing features to genimage?

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
