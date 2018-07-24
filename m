From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Jul 2018 10:30:31 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <93989b29-232f-20a2-4ac4-835066e5229b@mind.be>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
 <589643561.4441380.1531997921281.JavaMail.zimbra@datacom.com.br>
 <877elq5tz0.fsf@tkos.co.il>
 <1840086717.4674313.1532086956701.JavaMail.zimbra@datacom.com.br>
 <20180723151740.145c41ea@windsurf>
 <93989b29-232f-20a2-4ac4-835066e5229b@mind.be>
Message-ID: <20180724103031.1b1cd416@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jul 2018 09:55:40 +0200, Arnout Vandecappelle wrote:

>  The thing is, I don't believe that relying on BR2_ROOTFS_MERGED_USR is the
> right approach. I've had projects with a usr -> . symlink in a custom skeleton,
> for instance. We could of course declare such a skeleton invalid, but I don't
> think that it is checked currently. Also I can imagine that there could be other
> custom skeleton layouts that could create problems.
> 
>  We already use ln --relative in a few places, isn't that the easiest solution?

ln --relative is not supported on old distros, we even have a patch on
systemd to remove its use of ln --relative.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
