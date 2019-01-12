From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:23:55 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: default to 4.19.x
In-Reply-To: <20190110144508.5650-1-peter@korsgaard.com>
References: <20190110144508.5650-1-peter@korsgaard.com>
Message-ID: <20190112182355.26e4e38a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jan 2019 15:45:08 +0100, Peter Korsgaard wrote:
> 4.20.x is not a long term support kernel, but 4.19.x is (supported until end
> 2020):
> https://www.kernel.org/category/releases.html
> 
> With the upcoming Buildroot 2019.02 release being a LTS release, default to
> 4.19.x instead.
> 
> Notice: The userspace API breakage in net_stamp.h causing build failures has
> now been fixed in 4.19.14 by commit e4a2ffe9029fd (net: Use
> __kernel_clockid_t in uapi net_stamp.h)
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/Config.in                      | 4 ++--
>  package/linux-headers/Config.in.host | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. I added some comments in Config.in files to
explain why we use 4.19 and not 4.20+, and so that others don't
mistakenly send patches to bump these versions.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
