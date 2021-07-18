From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 13:59:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: fix c99 check
In-Reply-To: <20210620180409.1167370-1-bernd.kuhls@t-online.de>
References: <20210620180409.1167370-1-bernd.kuhls@t-online.de>
Message-ID: <20210718135919.6af0e870@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Bernd,

On Sun, 20 Jun 2021 20:04:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The check for c99 contains "include <wchar.h>" although the package
> itself does not use wchar functions outside Windows-specific code.
> This patch forces the detection of c99 for toolchains lacking wchar.
> 
> Fixes:
> http://autobuild.buildroot.net/results/62c/62c07e66491e2fcf32d3921f8286ec1293591194/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsndfile/libsndfile.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks for the research and fix. However the commit log for fixes like
this should always include some details about since when the problem is
occurring and why. Indeed, we want to easily understand if the problem
is applicable to our LTS branch.

In this case, I did the research: the problem didn't exist before the
bump of libsndfile to 1.0.31. Since the bump to libsndfile to 1.0.31
was done in June 2021, the LTS branch is not impacted.

I have amended the commit log with those details, but it would be good
to have such details in your future commit logs :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
