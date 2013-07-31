From: Paul B. Henson <henson@acm.org>
Date: Tue, 30 Jul 2013 19:13:06 -0700
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for
	target
In-Reply-To: <20130729205101.17741846@skate>
References: <20130729021746.EF4355C127@zaphod.pbhware.com>
 <20130729205101.17741846@skate>
Message-ID: <51F872B2.5080100@acm.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/29/2013 11:51 AM, Thomas Petazzoni wrote:

> Applied, thanks. I've made the changes suggested by Thomas De
> Schampheleire, as well as added the necessary 'depends on' statements
> for the requires toolchain features.

Cool, I appreciate you tuning it up for me.

It looks like you copied the dependencies from util-linux? I'm not that 
familiar with kconfig, there's no concept of transitive dependencies, 
such that if mkfs.ubifs selects util-linux, it will automatically 
inherit its dependencies? If I'm understanding correctly, if at some 
point util-linux changes dependencies, the mtd config for mkfs.ubifs 
would also need to be updated explicitly to capture them?

Thanks much?
