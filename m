From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 21:58:17 +0200
Subject: [Buildroot] [PATCH] package/gcc9: Fix parallel build problem
 (xgcc not found)
In-Reply-To: <b60c5da0-cf8e-3f5b-d271-659345733aff@inbox.ru>
References: <b60c5da0-cf8e-3f5b-d271-659345733aff@inbox.ru>
Message-ID: <20200507215817.48d744be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 May 2020 02:04:44 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Some times gcc 9.2.0, 9.3.0 failed to build with a message: "xgcc: No 
> such file or directory"
> 
> When it fails, it's trying to execute selftests.
> 
> So to fix this problem we can disable selftests.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Do you have more details about this failure? Does it happen in our
autobuilders? In which context?

> diff --git a/package/gcc/9.3.0/0001-disable-selftest.patch 
> b/package/gcc/9.3.0/0001-disable-selftest.patch
> new file mode 100644
> index 0000000000..d7150b0fb1
> --- /dev/null
> +++ b/package/gcc/9.3.0/0001-disable-selftest.patch

We need all patches to have a description and a Signed-off-by line.
Also, they should ideally be upstreamable, which is not the case here.

Could you work on an improved version of this patch, with some more
extensive description, and hopefully a solution that can be accepted by
upstream gcc ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
