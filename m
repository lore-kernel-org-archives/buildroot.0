From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 14 Dec 2014 14:32:35 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy
	location
In-Reply-To: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
References: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <548D9173.3070905@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 13/12/2014 18:08, Yann E. MORIN a ?crit :
> nmap is looking for pcre headers in pcre/pcre.h which our current
> version of pcre does not populates.
> 
> So, just create those as symlinks to the actual headers.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Note: this is not fixing anything for now, because the error in nmap is
> hidden by another error. But this is relaticvely easy to fix, so here we
> go... ;-)
> ---

Confirmed by the nmap's configure output before this patch...

checking pcre/pcre.h usability... no
checking pcre/pcre.h presence... no
checking for pcre/pcre.h... no

... and after this patch:

checking pcre/pcre.h usability... yes
checking pcre/pcre.h presence... yes
checking for pcre/pcre.h... yes

But it seems that the bundled nmap's libpcre is not build even with this patch.
In nmap's Makefile, "pcre_build" is not part of "all" target.

But for consistency with --with-libpcre="$(STAGING_DIR)/usr", let's the pcre
checking works...
(Maybe some other packages are looking for pcre in /usr/include/pcre/ directory).

So;
Acked-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
