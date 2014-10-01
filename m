From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 01 Oct 2014 16:42:04 -0300
Subject: [Buildroot] wpa_supplicant using epoll
In-Reply-To: <CABGWzsRbmekc0+vDqd37Cg1hT-At_pUkrgPN95oA5dsGR407qQ@mail.gmail.com>
References: <CABGWzsRbmekc0+vDqd37Cg1hT-At_pUkrgPN95oA5dsGR407qQ@mail.gmail.com>
Message-ID: <542C590C.20808@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/2014 04:27 PM, Eric Limpens wrote:

> Hi Gustavo, all,
> 
> In commit ad92b26df746ef1d9a78e75c6ac8e8557211cf0b epoll has been
> enabled for wpa_supplicant. 
> 
> While debugging issues between connman and wpa_supplicant it looks like
> wpa_supplicant is not able to receive dbus messages. I see the same
> symptoms
> as: https://lists.archlinux.org/pipermail/arch-commits/2014-July/245614.html
> 
> My  issues where solved by removing CONFIG_ELOOP_EPOLL from the
> wpa_supplicant.mk <http://wpa_supplicant.mk>. 
> 
> Shouldn't we use the default 'select' method instead of epoll? 
> 
> Eric.

Hi Eric.
I normally don't use wpa_supplicant with dbus, just with wpa_cli in
daemon/agent mode so i haven't seen this problem.
It seems to be a known issue as you posted so just send a patch
disabling it.
Upstream git doesn't seem to have any fixes related to this (no epoll
changes at all), though there are a couple of dbus changes that might be
related. But since it's just a small performance feature i don't think
it's worth to deal with this in BR.
Regards.
