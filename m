From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
 host-dtc for the host package
In-Reply-To: <1040860357.13861098.1462480371842.JavaMail.zimbra@datacom.ind.br>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
 <1040860357.13861098.1462480371842.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160505223621.54bbda0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 17:32:51 -0300 (BRT), Carlos Santos wrote:

> The extra time needed to build host-dtc is negligible. This is what I get when I build it on my Core i5 notebook, including download time:
> 
> 	$ time make host-dtc-dirclean host-dtc
> 	[...]
> 	real	0m8.387s
> 	user	0m7.552s
> 	sys	0m2.231s

This is just the time for host-dtc. But host-dtc depends on host-bison
and host-flex, which in turn bring host-m4. In total, on my machine,
the time to build host-dtc from a clean build is almost one minute.

Not a big amount of time. But FIT images are not that common, and one
key aspect of Buildroot is its build time, which we try to keep low by
making sure we don't rebuild the whole world needlessly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
