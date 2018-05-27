From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 22:03:04 +0200
Subject: [Buildroot] [PATCH] board: amarula: vyasa: Give raw space for
 falcon mode
In-Reply-To: <1525891389-6096-1-git-send-email-mayhs11saini@gmail.com> (shyam
 saini's message of "Thu, 10 May 2018 00:13:09 +0530")
References: <1525891389-6096-1-git-send-email-mayhs11saini@gmail.com>
Message-ID: <874lisoohz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "shyam" == shyam saini <mayhs11saini@gmail.com> writes:

 > From: Jagan Teki <jagan@amarulasolutions.com>
 > RK3288 Vyasa board support falcon mode in U-Boot and SD layout start from
 > 16MB offset for args and 17MB for uImage. So give full u-boot partition
 > space as 30M so-that it can occupy bigger uImage file and doesn't overlap
 > rootfs partition.

 > Reported-by: Shyam Saini <shyam@amarulasolutions.com>
 > Tested-by: Shyam Saini <shyam@amarulasolutions.com>
 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
 > Signed-off-by: Shyam saini <shyam@amarulasolutions.com>
 > ---
 >  board/amarula/vyasa/genimage.cfg | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/board/amarula/vyasa/genimage.cfg b/board/amarula/vyasa/genimage.cfg
 > index fa41de36720e..c8066ace9b68 100644
 > --- a/board/amarula/vyasa/genimage.cfg
 > +++ b/board/amarula/vyasa/genimage.cfg
 > @@ -12,6 +12,7 @@ image sdcard.img {
 >  		in-partition-table = "no"
 >  		image = "u-boot-dtb.img"
 >  		offset = 8M
 > +		size = 30M // falcon mode: 16M args, 17M uImage

We use # as comment character in all other genimage.cfg files, so I've
changed that. I also reworded to make it clear that these refers to
offsets and not sizes:

size = 30M # falcon mode: args @ 16M args, uImage @ 17M

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
