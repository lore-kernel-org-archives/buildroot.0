From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:10:14 +0100
Subject: [Buildroot] [PATCH 2/3] iptables: enable basic kernel options
In-Reply-To: <544FDACB.1050508@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
 <1413925852-12765-2-git-send-email-gustavo@zacarias.com.ar>
 <20141028190236.7b8ed9be@free-electrons.com>
 <544FDACB.1050508@zacarias.com.ar>
Message-ID: <20141028191014.64709e21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Oct 2014 15:04:59 -0300, Gustavo Zacarias wrote:
> On 10/28/2014 03:02 PM, Thomas Petazzoni wrote:
> 
> > For this one, I don't know. Back some time ago, Peter said that his
> > preference was to not enforce too much stuff in terms of kernel
> > configuration options in linux/linux.mk. I think the idea is that it's
> > something that can quickly become very complicated if you want to
> > handle all the kernel config options that all packages might need. It's
> > also being forced without the user being capable of doing anything
> > against that: those KCONFIG_ENABLE_OPT calls are done even if the user
> > passes a custom configuration file.
> > 
> > But back at the time, we only had the CONFIG_AEABI option being
> > handled. Now it's true we already have ktap, systemd, smack being
> > handled, and many other things related to appended DTB, initramfs, and
> > more. So it seems like the iptables/xtables-addons proposal from
> > Gustavo are not really creating a precedent.
> > 
> > Peter, what is your position on this?
> 
> Unfortunately it's not optional for xtables-addons, it needs the
> iptables bits for the xtables bits in the other patch.
> We could just get them together or ditch the package since it will
> result in a build failure.

As said on IRC, if those options are needed at build time for
xtables-addons, it makes a very good case for having them.

Peter, OK ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
