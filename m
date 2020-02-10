From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 15:41:33 +0100
Subject: [Buildroot] [PATCH v4 6/9] board/qemu: add post-image script
 for gitlab qemu testing
In-Reply-To: <f049e76f-b96a-b355-1597-b7fda6412afe@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-7-romain.naour@smile.fr>
 <20200210140950.704d0d4b@windsurf>
 <f049e76f-b96a-b355-1597-b7fda6412afe@smile.fr>
Message-ID: <20200210154133.2bfdee65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Feb 2020 14:47:59 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > Why is this script copied a zillion times? This looks like a
> > maintenance nightmare. Why not put it in board/qemu/, and have a single
> > script used by all configurations ?  
> 
> I'm not sure if we should share the same post-image script for several boards.

Why so? We already do that for NXP platforms for example.

> It's not clear how we should maintain theses scripts in board directory.
> 
> For example for genimage (post-image.sh) :
> board/lego/ev3/post-image.sh
> board/grinn/liteboard/post-image.sh
> board/nexbox/a95x/post-image.sh
> 
> This is the same script.
> Maybe we need something board/common/post-image.sh ?
> 
> For Qemu board, maybe add the script in board/qemu/common/post-image.sh.

Yes, or just board/qemu/post-image.sh is sufficient.

> There is also a special case for sh4, so I'll add a second script to add
> "-serial stdio -display none" instead of "-display none"

No, just make a small condition in your script:

case ${defconfig} in
	qemu_sh4_defconfig)
		do something here
		;;
esac

and that's it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
