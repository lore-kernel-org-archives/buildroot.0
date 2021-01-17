From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:26:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-esptool: fix zlib module
 for python3
In-Reply-To: <20210117112145.2239056-1-bernd.kuhls@t-online.de>
References: <20210117112145.2239056-1-bernd.kuhls@t-online.de>
Message-ID: <20210117152629.4eaad8a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 12:21:45 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes config with BR2_PACKAGE_PYTHON3=y
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_ZLIB
>   Depends on [n]: BR2_PACKAGE_PYTHON [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_ESPTOOL [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y])
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-esptool/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I wonder how I didn't spot that during the review/merge of this patch.
Anyway, thanks a lot for fixing this! Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
