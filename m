From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:22:41 +0200
Subject: [Buildroot] [PATCH] package/gnupg: fix build with gcc 10
In-Reply-To: <20200526212754.112805-1-thomas.petazzoni@bootlin.com>
References: <20200526212754.112805-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200528222241.5ebe2e39@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 May 2020 23:27:54 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit backports an upstream patch made for gnupg2 into gnupg, in
> order to fix build failures with gcc 10 due to the use of
> -fno-common. Due to the code differences between upstream gnupg2 and
> the old gnupg 1.x, the backport is in fact more a rewrite than an
> actual backport.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/496a18833505dc589f7ae58f2c7e5fe80fe9af79/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...se-EXTERN_UNLESS_MAIN_MODULE-pattern.patch | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
