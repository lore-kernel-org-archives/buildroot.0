From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:54:27 +0200
Subject: [Buildroot] [PATCH] uclibc: arc: Disable usage of atomic ops if
 hardware has no LLSC
In-Reply-To: <20170419174857.23185-1-abrodkin@synopsys.com>
References: <20170419174857.23185-1-abrodkin@synopsys.com>
Message-ID: <20170504225427.31047d77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 20:48:57 +0300, Alexey Brodkin wrote:

> +ifneq ($(BR2_ARC_ATOMIC_EXT),y)

Changed to:

ifeq ($(BR2_ARC_ATOMIC_EXT),)

and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
