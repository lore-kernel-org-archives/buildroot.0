From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2021 08:56:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump to version 1.13.1
In-Reply-To: <20210221004750.3639-1-stefan@ott.net>
References: <20210221004750.3639-1-stefan@ott.net>
Message-ID: <20210221075639.GW2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2021-02-21 01:47 +0100, Stefan Ott via buildroot spake thusly:
> This release contains a number of bug fixes. There is added support
> for the EDNS Padding option (RFC7830 and RFC8467), and the EDNS NSID
> option (RFC 5001). Unbound control has added commands to enable and
> disable rpz processing. Reply callbacks have a start time passed to
> them that can be used to calculate time, these are callbacks for
> response processing. With the option serve-original-ttl the TTL served
> in responses is the original, not counted down, value, for when in
> front of authority service.
> 
> https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.1

It's unfortunate that they managed to sneak in a few features in a
bug-fix release, but oh well...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Stefan Ott <stefan@ott.net>
> ---
>  package/unbound/unbound.hash | 4 ++--
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 9ccea6eb88..ec7e940791 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,5 +1,5 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.0.tar.gz.sha256
> -sha256  a954043a95b0326ca4037e50dace1f3a207a0a19e9a4a22f4c6718fc623db2a1  unbound-1.13.0.tar.gz
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.1.tar.gz.sha256
> +sha256  8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8  unbound-1.13.1.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index faed60ccb9..140b7d278b 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.13.0
> +UNBOUND_VERSION = 1.13.1
>  UNBOUND_SITE = https://www.unbound.net/downloads
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
>  UNBOUND_LICENSE = BSD-3-Clause
> -- 
> 2.30.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
