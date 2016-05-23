From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 22:30:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/jack2: Fix build on xtensa
In-Reply-To: <1464022076-24135-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464022076-24135-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160523223033.0500246d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 18:47:55 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/1ee/1ee48356d8da5e0ebf3e5b61b02fed81704a01dd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/jack2/0003-Add-support-for-xtensa.patch | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/jack2/0003-Add-support-for-xtensa.patch

So we've already added an exclusion for nios2, now xtensa and arc, and
the list was already long.

Isn't it time to find a better solution, like the below patch?

(Took me a while to cook, I had never used this waf thing until now...)

I've tested that it properly detects the absence of NGREG on Xtensa.
However, I have not tested on architectures where it exists, so I hope
I didn't do any typo.

Best regards,

Thomas
