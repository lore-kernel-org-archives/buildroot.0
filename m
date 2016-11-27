From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:51:36 +0100
Subject: [Buildroot] [PATCH] odroid-scripts: add support for auto resize
 on first boot for SYSV
In-Reply-To: <trinity-2fcdc0f4-9fb1-4f65-8c09-14877a9c5f63-1480282606427@3capp-mailcom-bs07>
References: <20161127212449.14159-1-daggs@gmx.com>
 <20161127222742.5a58f49c@free-electrons.com>
 <trinity-2fcdc0f4-9fb1-4f65-8c09-14877a9c5f63-1480282606427@3capp-mailcom-bs07>
Message-ID: <20161127225136.37b20b37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 22:36:46 +0100, daggs wrote:

> two reasons:
>  1. this came from a Odroid-specific repo as stated above.

Right, but what Buildroot forks are doing is not necessarily the
appropriate way of doing things.

>  2. afaics, the only way to make it more generic is to add systemd
> support and that is something I don't know how to do nor I have time
> to do so.

No, you don't _have_ to add systemd support. It's nice when people do
it, but it's not a strict requirement.

> moreover, if it can be useful for other platforms, why not have it as
> part of the generated tree and not have it as a pkg?

Well, we certainly don't want to have it unconditionally installed, so
it would have to be optional. And a package is nice to isolate this
feature and the related init script in a clean way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
