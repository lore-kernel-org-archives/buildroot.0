From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 19:24:43 +0100
Subject: [Buildroot] [PATCH] bind: disable libjson support
In-Reply-To: <1451494264-2399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451494264-2399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151230192443.29192de5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Dec 2015 13:51:04 -0300, Gustavo Zacarias wrote:
> It conflicts with jsoncpp, bind probes for json/json.h first, but that
> header is installed by jsoncpp, which is completely different from
> json-c.
> Since it's not clear who's correct here (there might be some other
> json-c predecessor/version that installs there as well) and the same
> functionality (stats channel) is provided by libxml2 as well, just
> disable libjson support completely.
> 
> Fixes:
> http://autobuild.buildroot.net/results/226/2262c9b46663ea7a45e128a5fd7ff30417c2c2a7/build-end.log
> (indirectly, it was probing aboslute directories while searching for it)
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
