From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:07:21 +0100
Subject: [Buildroot] [PATCH] apitrace: do not use bundled version of
 libpng
In-Reply-To: <1448104176-19721-1-git-send-email-jezz@sysmic.org>
References: <1448104176-19721-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151122140721.59bc61d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 21 Nov 2015 12:09:36 +0100, J?r?me Pouiller wrote:
> In case libpng is not found apitrace its own version of libpng. However
> current bundled version (1.1.16) is impacted by
> https://sourceforge.net/p/libpng/bugs/230/. We simplify problem by
> forcing use of external libpng.
> 
> Notice this patch also impact use of zlib. Apitrace also use its own
> version of zlib if none was found. Since we select libpng, external
> zlib is also selected.
> 
> Fix:
>   http://autobuild.buildroot.net/results/ac790191127cf4d8b19d0c7c640981264772f503/
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/apitrace/Config.in   | 1 +
>  package/apitrace/apitrace.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
