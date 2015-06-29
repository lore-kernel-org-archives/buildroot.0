From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Jun 2015 19:25:47 -0300
Subject: [Buildroot] [PATCH] board/acmesystems/arietta: new board
In-Reply-To: <1434537135-32177-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1434537135-32177-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <5591C5EB.2010700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/06/15 07:32, Angelo Compagnucci wrote:

> This patch adds support to the Arietta board from Acmesystems.
> This board comes in two memory sizes (128m and 256m) hence the
> reason for two different configs.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Hi Angelo.
A few nits:

>   board/acmesystems/arietta/linux-4.0.config |  99 ++++++++++++++++

Any particular reason you need a custom config instead of being able to 
use at91_dt (like on the Aria sample i sent)?
I know the Arietta lacks an ethernet PHY, but the DTS should take care 
of that.

> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acme"

Also the "acme" tag seems to be the "master" of customization (i.e. a 
moving target), could you switch to a commit hash?
Otherwise it looks OK without having hardware to test and you can have 
my Acked-by if you address these concerns.
Thanks.
Regards.
