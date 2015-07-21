From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 22:57:24 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <55AE72C8.10405@lucaceresoli.net>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150718233012.5293b49f@free-electrons.com>
 <55AE72C8.10405@lucaceresoli.net>
Message-ID: <20150721225724.401300ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Tue, 21 Jul 2015 18:26:48 +0200, Luca Ceresoli wrote:

> > Can you respin a new version? In the mean time, I'll mark this one as
> > "Changes Requested" in patchwork.
> 
> It's on my todo list.
> 
> However, I still haven't understood your opinion about using mdev
> without devtmpfs (it's for firmware loading in this case)...

I think it's OK to support this case. People using kernels older than
2.6.32 are stuck with static /dev and may have to load firmwares.

Now, I'm wondering if we should simply make the "mdev" /dev management
option work with both static /dev *and* devtmpfs, or if we should have
something like "mdev with static /dev" and "mdev with devtmpfs".

Do you have some proposals?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
