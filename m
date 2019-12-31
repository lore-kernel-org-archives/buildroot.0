From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 18:12:38 +0100
Subject: [Buildroot] [PATCH] package/libcurl: add option for no SSL/TLS
 support
In-Reply-To: <20191231164023.10258-1-yann.morin.1998@free.fr>
References: <20191231164023.10258-1-yann.morin.1998@free.fr>
Message-ID: <20191231181238.0f2ade9c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Dec 2019 17:40:23 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since we already have a choice to select the backend to do crypto, push
> the limits even further and add an option to do no crypto.
> 
> Usually, we would have added that option first in the choice, but if we
> were to do that now, existing defconfigs that previously used openssl
> (the first item in the choice) would now default to non crypto, which is
> not so nice. So we add the new option last in the choice.
> 
> Each crypto backend option is used in a conditional block, each of which
> default to disabling said backend. So, selecting none will indeed
> disable all.
> 
> We can now drop the blind intermediate option that would hide the choice
> when no backend library was available; there will now always be at least
> the none option in the choice, so we need not hide it.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  package/libcurl/Config.in | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
