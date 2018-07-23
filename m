From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jul 2018 15:08:15 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <87fu0g53wd.fsf@tkos.co.il>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
Message-ID: <20180723150815.304d1c9d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 05:57:06 +0300, Baruch Siach wrote:

> My vim patch is at
> 
>   http://patchwork.ozlabs.org/patch/943314/
> 
> I marked it as Rejected following the comment of Arnout. Carlos' patch
> works around the merged /usr issue by changing the symlink target for
> merged /usr. In my opinion this solution is error prone. It would be
> much easier to allow dangling symlinks in the target directory, and
> tweak the busybox install.sh to cope with that. That's what my pending
> busybox patch suggests.
> 
>   http://patchwork.ozlabs.org/patch/944884/

Allowing dangling symlinks is indeed desirable, but I think it is also
nice if we have as few dangling symlinks are possible. It looks cleaner
to me. So like Carlos said, I believe both your patch fixing the
Busybox installation and Carlos patch adjusting vim are useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
