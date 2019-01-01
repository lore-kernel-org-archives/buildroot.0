From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:14:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: Fix build issue with
 SENSORS_API_VERSION >= 0x500
In-Reply-To: <20190101095954.8313-1-vadim4j@gmail.com>
References: <20190101095954.8313-1-vadim4j@gmail.com>
Message-ID: <20190101111429.1667f33d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Jan 2019 11:59:54 +0200, Vadim Kochan wrote:
> Current collectd version 5.7.1 fails to compile because there is
> check which breaks the compilation if lm_sensors API >= 0x500, but
> in the mainline codebase this check was removed in commit:
> 
> 	https://github.com/collectd/collectd/commit/069796bd76dd1ab0089a64f7c9c2a3c9f1475414
> 
> So add backported patch based on this commit.
> 
> Fixes:
> 
> 	http://autobuild.buildroot.net/results/c3c84ca6e11b268ba5ada7e3dca18bca681ee43d/
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...oved-checks-for-upper-limit-of-SENSORS_AP.patch | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 package/collectd/0003-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
