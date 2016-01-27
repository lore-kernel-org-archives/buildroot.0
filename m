From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 00:01:31 +0100
Subject: [Buildroot] [PATCH 07/21] pulseaudio: remove
 BR2_ARCH_HAS_ATOMICS dependency
In-Reply-To: <20160127225106.GB3365@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125185238.GH3386@free.fr>
 <20160127225656.5c8afda9@free-electrons.com>
 <20160127225106.GB3365@free.fr>
Message-ID: <20160128000131.71d873e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jan 2016 23:51:06 +0100, Yann E. MORIN wrote:

> > I intentionally kept the json-c and pulseaudio patches separate. The
> > json-c patch only adds the additional BR2_TOOLCHAIN_HAS_SYNC_4
> > dependency to json-c and all its reverse dependencies, keeping the
> > BR2_ARCH_HAS_ATOMICS when they existed.
> > 
> > This patch then removes the BR2_ARCH_HAS_ATOMICS where they are no
> > longer needed.
> > 
> > I think it remains bisectable, and allows to kept the patches somewhat
> > saner in size than the cairo one.
> 
> Sorry, what I meant was that the 'depends on BR2_TOOLCHAIN_HAS_SYNC_4'
> on the comment should have been added in the previous commit, i.e. at
> the time json-c gains the _SYNC_4 dependency.
> 
> Then in this very commit, you can indeed 'just' remove the _HAS_ATOMICS
> dependency.

Hum, right, I see what you mean. Indeed, I should fix that, it's not
consistent. I'll wait for some other review on the v2, and I'll respin.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
