From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 09:57:27 +0100
Subject: [Buildroot] [PATCH] pkg-download: support file:// in
 BR2_PRIMARY_SITE
In-Reply-To: <564BB014.6030809@mind.be>
References: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
 <20151117175558.156ea1f0@free-electrons.com>
 <564BB014.6030809@mind.be>
Message-ID: <20151118095727.08b48388@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, J?r?me,

On Tue, 17 Nov 2015 23:54:12 +0100, Arnout Vandecappelle wrote:

> >>   make project_defconfig
> >>   make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
> >>   tar -C /tmp -czvf mirror-project.tgz mirror-project
> > 
> > You have a much simpler option:
> > 
> > 	make external-deps
> 
>  You probably mean:
> 
> for file in $(make external-deps); cp dl/$file /tmp/mirror-project; done

Yes, indeed, I only pointed at "make external-deps", leaving it to the
reader to figure out how to make use of it in the context of what
J?r?me is trying to do. But I could have been more explicit.

>  I think a local file PRIMARY_SITE can be useful for other situations as well,
> e.g. a slow CIFS-mounted shared download location that is too slow to use as
> DL_DIR, so I think the feature has merit.

Yes, I also think the feature has merit.

J?r?me, could you respin the patch after updating the Config.in help
text of the BR2_PRIMARY_SITE option?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
