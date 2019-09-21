From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:40:57 +0200
Subject: [Buildroot] [PATCH] package/cups-filters: fix broken symlink in
 installation
In-Reply-To: <20190919035121.19223-1-unixmania@gmail.com>
References: <20190919035121.19223-1-unixmania@gmail.com>
Message-ID: <bf039ced-71a2-9455-ac3d-ece2682c2575@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/09/2019 05:51, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The patch used previously to support versions of ln lacking the '-r'
> option generated broken links:
> 
>     $ file target/usr/lib/cups/backend/driverless
>     target/usr/lib/cups/backend/driverless: broken symbolic link to ../../usr/lib/cups/driver/driverless
> 
> Add a squashing of two patches already sent upstream that provide a
> better solution:
> 
>     https://github.com/OpenPrinting/cups-filters/pull/154
>     https://github.com/OpenPrinting/cups-filters/pull/157

 We prefer upstream patches to be taken as-is if possible, so no squashing. This
makes it easier to verify that the patch has been applied upstream when bumping.
However, it's not that important, so I've applied to master as is, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
