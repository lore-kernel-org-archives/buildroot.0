From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:58:28 +0100
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171124215828.47855fdd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Sep 2017 14:08:11 +0300, Alexander Mukhin wrote:
> Since kernel drivers for Realtek wireless chips use non-standard
> interfaces, upstream hostapd does not support them. One have to apply
> an external patch for hostapd to work with these chips. See:
> https://github.com/pritambaral/hostapd-rtl871xdrv
> 
> A configuration option is added to enable support for Realtek chips,
> and it's turned off by default.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  DEVELOPERS                   | 3 +++
>  package/hostapd/Config.in    | 5 +++++
>  package/hostapd/hostapd.hash | 1 +
>  package/hostapd/hostapd.mk   | 5 +++++
>  4 files changed, 14 insertions(+)

To be honest, I was about to reject your patch: it's basically adding a
feature patch to a package, which we normally don't do, and the patch
is very likely to break when we update to newer versions of hostapd.

But I saw that both Peter and Arnout had a look at the problem, and the
overall feeling is that there really isn't a better solution.

So, I've applied to next. We'll see how often it breaks hostapd (or
not).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
