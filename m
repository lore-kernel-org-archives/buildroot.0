From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 10:23:31 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <b11495d8-a875-decb-ad32-4ff257023ac6@c-sky.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
 <20170320224839.6677ccd0@free-electrons.com>
 <d2d57c6c-b3b0-2bc8-71a4-d6fe3578a804@c-sky.com>
 <20170323101042.186c3fc6@free-electrons.com>
 <b11495d8-a875-decb-ad32-4ff257023ac6@c-sky.com>
Message-ID: <20170323102331.6f245905@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 17:16:14 +0800, ren_guo wrote:

> > Or change gdbinit to:
> >
> > restore output/images/gx6605s.dtb binary 0x92000000
> >  
> It won't work for "make O=/tmp/br".

Right, but the readme.txt instructions do assume anyway that the output
is in output/images. But OK, the user can easily adjust by himself the
instructions he is copy/pasting from readme.txt and be confused by a
hardcoded path in the gdbinit file.

> Update readme.txt is OK.

OK, then please send a patch, but you also need to change the relative
path to the gdbinit file, it was not correct in your example, it should
be:

	-x ../../board/csky/...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
