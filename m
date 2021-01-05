From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 23:32:48 +0100
Subject: [Buildroot] [PATCH] package/nginx: use CacheDirectory
In-Reply-To: <20200123083641.3808-1-p.debruijn@unilogic.nl>
References: <20200123083641.3808-1-p.debruijn@unilogic.nl>
Message-ID: <20210105233248.488eca66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Jan 2020 09:36:41 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> move
>   http-client-body-temp-path
>   http-proxy-temp-path
>   http-fastcgi-temp-path
>   http-scgi-temp-path
>   http-uwsgi-temp-path
> 
> from /var/tmp/nginx to /var/cache/nginx
> 
> this allows the use of systemd constructs
> 
>   LogsDirectory=nginx
>   CacheDirectory=nginx
> 
> to replace
> 
>   ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
> 
> as there isn't similar construct for /var/tmp
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/nginx/S50nginx      |  2 +-
>  package/nginx/nginx.mk      | 10 +++++-----
>  package/nginx/nginx.service |  3 ++-
>  3 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
