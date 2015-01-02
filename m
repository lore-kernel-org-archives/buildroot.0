From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 17:16:29 +0100
Subject: [Buildroot] [PATCH v3 1/2] Added mpd-mpc, mpc client to mpd
In-Reply-To: <1418419480-7570-1-git-send-email-tbultel@free.fr>
References: <1418419480-7570-1-git-send-email-tbultel@free.fr>
Message-ID: <20150102171629.44662fe1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Fri, 12 Dec 2014 22:24:39 +0100, Thierry Bultel wrote:
> ---
> 
> Changes v2 -> v3
>   - dependency to host-pkgconf (noticed by J?rg Krause)
>   - optional dependency to libiconv
>   - configure environnement for C99 compiler
> 
> Changes v1 -> v2
>   - No needed dependency to mpd (suggested by Thomas)
>   - Added hash and license information
> 
> Signed-off-by: Thierry Bultel <tbultel@free.fr>

Committed, thanks, with a few changes:

[Thomas:
 - Changed hash file to use SHA256
 - Remove libiconv handling, since the iconv detection in mpc is
   broken: if it's not available in the C library, it expects to find
   iconv() in libintl (from gettext). But it's actually libiconv that
   provides iconv() for non-locale capable uClibc toolchains. But
   since anyway the package builds fine without iconv() support and
   properly detects when it's available, don't bother with this.]

If you can report to upstream the libiconv detection problem, it would
be good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
