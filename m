From: phil.edworthy at renesas.com <phil.edworthy@renesas.com>
Date: Thu, 11 Apr 2013 10:04:33 +0100
Subject: [Buildroot] [PATCH 2/2] arch: remove support for SuperH 2 and
	SuperH 3
In-Reply-To: <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF1A17C1C6.7A8E9AFD-ON80257B4A.00307FB4-80257B4A.0031DC13@eu.necel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> The SuperH 2 architecture is a noMMU architecture from Renesas, and
> its Linux support is really poor. A number of packages fail to build,
> the kernel support is almost inexistant, we have never heard of any
> user of it.
> 
> I was originally the one who introduced support for SuperH 2, but the
> project switched to a different architecture due to the poor Linux
> support for SuperH 2.
Actually, there are a couple of sh2a devices that are supported in the 
upstream Linux kernel, the sh7264 and sh7269 devices. Though they lack a 
number of upstream drivers, the basics are there, and there are a number 
of out-of-tree drivers. I also know of a number of customers using these 
devices with Buildroot, mostly in Japan.

The main reason that most packages fail to build is the noMMU 
architecture. That, of course, is a problem. However, I have found that it 
is useful to use Buildroot to build the busybox and a few packages at 
least. One of the main reasons for using Buildroot is that it is the one 
of the few tools that can build for noMMU devices.

> Regarding SuperH 3, I've never heard of Linux support for it that is
> used in practice.
Regarding the other Renesas families that are removed by this patch, I 
would agree that there are any users.

So, can we keep sh2a?

Regards
Phil
