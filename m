From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jul 2018 15:17:40 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <1840086717.4674313.1532086956701.JavaMail.zimbra@datacom.com.br>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
 <589643561.4441380.1531997921281.JavaMail.zimbra@datacom.com.br>
 <877elq5tz0.fsf@tkos.co.il>
 <1840086717.4674313.1532086956701.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180723151740.145c41ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Jul 2018 08:42:36 -0300 (BRT), Carlos Santos wrote:

> > But if we allow dangling non-relative symlinks I don't think we want to
> > add this complexity to the vim package, or any other package that
> > installs similar relative symlinks.  
> 
> The complexity is a consequence of the BR2_ROOTFS_MERGED_USR stuff.
> We already need to deal with such situations in six packages. I'd
> rather declare merged /usr as mandatory and send all those ifeq's
> down the tubes.

Perhaps we could introduce one or two helper functions that hide what
BR2_ROOTFS_MERGED_USR is doing. I thought a few minutes about this and
couldn't find immediately a good semantic/naming, but perhaps this is
a direction that could be investigated ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
