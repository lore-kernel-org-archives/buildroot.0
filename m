From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Tue, 7 Apr 2009 10:57:40 -0500
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <20090407083540.15437e75@surf>
References: <20090407083540.15437e75@surf>
Message-ID: <980CE415-4586-46DB-ABA4-D6962163D0C6@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I ran into this issue as well and ""lzo/lzo1.h not found" is terribly  
confusing. Adding just "on host" to the end of the message would  
clarify it immensely.

Cheers,

Lloyd


On Apr 7, 2009, at 10:35 AM, Thomas Petazzoni wrote:

> Hi,
>
> When selecting jffs2 as the output filesystem, mtd-utils gets compiled
> both on the host and on the target. I think that generating a jffs2
> filesystem image should *not* trigger the compilation/installation of
> mtd-utils inside the target since this is not necessary.
>
> Moreover, the compilation of host mtd-utils fails with "lzo/lzo1.h not
> found" if the liblzo-dev package is not installed on the host. We
> should probably add a test checking this and telling the user to
> install liblzo-dev, because the current state is quite confusing.
>
> Sincerly,
>
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
