From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:55:16 +0200
Subject: [Buildroot] [PATCH 1/4] package/polkit: install service file
In-Reply-To: <20200418025816.1642936-1-aduskett@gmail.com>
References: <20200418025816.1642936-1-aduskett@gmail.com>
Message-ID: <20200418145516.230bb8eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 19:58:13 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The default installed service file is missing a target, which causes preset-all
> to not enable the service.
> 
> Add the service file to package/polkit with the addition of:
> 
> [Install]
> WantedBy=multi-user.target
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/polkit/polkit.mk      |  6 ++++++
>  package/polkit/polkit.service | 12 ++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/polkit/polkit.service

I've applied the series. However, I hesitated to apply PATCH 1/4:
upstream provides a service file so it would be better to be able to
use it. Could you report to upstream the missing [Install] section in
the .service file ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
