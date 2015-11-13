From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sat, 14 Nov 2015 00:16:53 +0100
Subject: [Buildroot] zedboard: uboot: load env earlier
In-Reply-To: <1447418954-3350-1-git-send-email-gwenj@trabucayre.com>
References: <1447418954-3350-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151114001653.045f56b3@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems reasonable to me. Thanks for this fix!

Acked-By: Jan Viktorin <viktorin@rehivetech.com>

On Fri, 13 Nov 2015 13:49:14 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> By default, with the original patch bootcmd runs sdboot before loading uEnv.txt.
> Consequently, if the user change modeboot, the user's defined content is updated
> too late.
> By loading uEnv.txt before 'run $modeboot' the correct boot mode is used instead
> of default mode.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  .../0001-zynq-Create-zedboard-specific-U-Boot-environment.patch    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
