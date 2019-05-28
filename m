From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 22:43:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/mender: update rootfs parts in
 mender.conf
In-Reply-To: <20190514090450.20142-2-mirza.krak@northern.tech>
References: <20190514090450.20142-1-mirza.krak@northern.tech>
 <20190514090450.20142-2-mirza.krak@northern.tech>
Message-ID: <25b8caad-efc5-4694-a490-636c88a13897@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/05/2019 11:04, Mirza Krak wrote:
> The configuration options (RootfsPartA/RootfsPartB) must
> provide a valid path to a block devices.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

 Applied to master, thanks. This is clearly a bugfix, so master, not next.

 Regards,
 Arnout

> ---
>  package/mender/mender.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mender/mender.conf b/package/mender/mender.conf
> index 979f16aaf6..f89118ac1b 100644
> --- a/package/mender/mender.conf
> +++ b/package/mender/mender.conf
> @@ -2,8 +2,8 @@
>    "InventoryPollIntervalSeconds": 1800,
>    "UpdatePollIntervalSeconds": 1800,
>    "RetryPollIntervalSeconds": 300,
> -  "RootfsPartA": "mmcblk0p2",
> -  "RootfsPartB": "mmcblk0p3",
> +  "RootfsPartA": "/dev/mmcblk0p2",
> +  "RootfsPartB": "/dev/mmcblk0p3",
>    "ServerCertificate": "/etc/mender/server.crt",
>    "ServerURL": "https://docker.mender.io",
>    "TenantToken": "dummy"
> 
