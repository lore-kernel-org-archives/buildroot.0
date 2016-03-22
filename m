From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:52:39 +0100
Subject: [Buildroot] [PATCH] core/help: fix custom help without a .config
In-Reply-To: <56F1C9D1.2010104@mind.be>
References: <1458509069-11960-1-git-send-email-yann.morin.1998@free.fr>
 <56F1C9D1.2010104@mind.be>
Message-ID: <20160322235239.7a75f515@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 23:40:17 +0100, Arnout Vandecappelle wrote:
> On 03/20/16 22:24, Yann E. MORIN wrote:
> > When there is no .config, we do not source $(BR2_EXTERNAL)/external.mk.
> > So we can not expose the custom help in that situation.
> >
> > It is now known whether sourcing $(BR2_EXTERNAL)/external.mk outside the
> > HAVE_DOT_CONFIG conditional block is entirely safe. Even if it would
> > work today, we would have a hard time not breaking it in the future,
> > because we do not have automatic checks for that and would need to rely
> > on users reporting issues after the fact.
> >
> > Instead, we require the custom help to be defined in its own file in the
> > br2-external tree. This way, we can safely include it unconditionally.
> 
>   IMHO that custom help was a bad idea. It's adding complexity, an extra file in 
> BR2_EXTERNAL, and really not that useful...

Agreed. I'm not sure it's worth it. It's still time to revert if we
don't think it's a good idea. Peter?

Without this custom help thing, it is already possible to define some
custom make target in external.mk that will display some help. It won't
be available until a configuration is defined, but oh well, who reads
help texts anyway?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
