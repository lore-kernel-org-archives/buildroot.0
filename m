From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 18 Nov 2014 14:17:09 -0300
Subject: [Buildroot] [PATCH v3 5/5] package: linux-fusion: use install
	instead of cp
In-Reply-To: <546A714D.3040402@mind.be>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
 <546A714D.3040402@mind.be>
Message-ID: <20141118171709.GD20682@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all

On Mon, Nov 17, 2014 at 11:06:05PM +0100, Arnout Vandecappelle wrote:
> On 17/11/14 18:19, Guido Mart?nez wrote:
> > in order to not depend on the previous permissions of the file
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  There are a few more suspicious cp instances:
> 
> board/boundarydevices/nitrogen6x/post-build.sh
> boot/grub/grub.mk
> fs/iso9660/iso9660.mk
I'll take a look at these, thanks.

>  Also, it would be good to document somewhere (e.g. in the intro mail) why the
> rsync in the toolchain is OK. Or even better, replace it even though it's not
> really necessary - it just feels more consistent and safe.
Yes, this sounds good. Maybe use --chmod on the toolchain and add a
comment there? This way we should be covered in the future if someone
uses 'rsync -a' from there.

Cheers!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
