From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 17:55:01 +0100
Subject: [Buildroot] [PATCH v2] ncurses: add support for 256 colors
In-Reply-To: <1418455139-4668-1-git-send-email-tbultel@free.fr>
References: <1418455139-4668-1-git-send-email-tbultel@free.fr>
Message-ID: <20150203175501.0fffe4d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Sat, 13 Dec 2014 08:18:59 +0100, Thierry Bultel wrote:
> ---
> Changes v1 -> v2:
>   - extended colors enabled by default (suggested by Yann E. MORIN)
>     Namely, size delta is negligible:
>     with 256 colors:
>      -rwxr-xr-x 1 thierry thierry 210K d?c.   9 14:23 output/target/usr/lib/libncursesw.so.6.0
>     with std colors:
>      -rwxr-xr-x 1 thierry thierry 202K d?c.   9 15:46 output/target/usr/lib/libncursesw.so.5.9
>   - the option, now selected by default, still needs ABI 6, and support of widechar. Thus it
>     is conditional in ncurses.mk, and we keep ABI 5 when widechar is not available
> 
> Signed-off-by: Thierry Bultel <tbultel@free.fr>

Your SoB line should have been before the "---" line above.

I've fixed the nano package to use $(NCURSES_CONFIG_SCRIPTS) since the
256 colors enabled ncurses has a different config script name.

Applied with this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
