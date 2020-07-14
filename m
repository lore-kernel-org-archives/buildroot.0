From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:05:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: set USE_DL if needed
In-Reply-To: <20200714172529.1048144-1-fontaine.fabrice@gmail.com>
References: <20200714172529.1048144-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714220513.763749b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 19:25:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> haproxy uses dladdr since version 2.2.0 and
> http://git.haproxy.org/?p=haproxy.git;a=commit;h=eb8b1ca3eb4c8d4688e1a4a1d9c1b91f68324e09
> 
> So set USE_DL to enable linking with -ldl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7bb76153b7dd8f392b247569c53d0f4cbf408371
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/haproxy.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 6f97840f6d..fba9a7c137 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -15,6 +15,10 @@ HAPROXY_MAKE_OPTS = \
>  	PREFIX=/usr \
>  	TARGET=custom
>  
> +ifneq ($(BR2_STATIC_LIBS),y)

We prefer positive logic:

ifeq ($(BR2_STATIC_LIBS),)

so I modified this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
