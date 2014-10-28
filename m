From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 15:04:59 -0300
Subject: [Buildroot] [PATCH 2/3] iptables: enable basic kernel options
In-Reply-To: <20141028190236.7b8ed9be@free-electrons.com>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>	<1413925852-12765-2-git-send-email-gustavo@zacarias.com.ar>
 <20141028190236.7b8ed9be@free-electrons.com>
Message-ID: <544FDACB.1050508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2014 03:02 PM, Thomas Petazzoni wrote:

> For this one, I don't know. Back some time ago, Peter said that his
> preference was to not enforce too much stuff in terms of kernel
> configuration options in linux/linux.mk. I think the idea is that it's
> something that can quickly become very complicated if you want to
> handle all the kernel config options that all packages might need. It's
> also being forced without the user being capable of doing anything
> against that: those KCONFIG_ENABLE_OPT calls are done even if the user
> passes a custom configuration file.
> 
> But back at the time, we only had the CONFIG_AEABI option being
> handled. Now it's true we already have ktap, systemd, smack being
> handled, and many other things related to appended DTB, initramfs, and
> more. So it seems like the iptables/xtables-addons proposal from
> Gustavo are not really creating a precedent.
> 
> Peter, what is your position on this?

Unfortunately it's not optional for xtables-addons, it needs the
iptables bits for the xtables bits in the other patch.
We could just get them together or ditch the package since it will
result in a build failure.
Regards.
