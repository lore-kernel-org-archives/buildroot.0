From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 22:55:23 +0100
Subject: [Buildroot] [PATCH] support/kconfig: fix 'space' to (de)select
	options
In-Reply-To: <1384379593-32281-1-git-send-email-yann.morin.1998@free.fr>
References: <1384379593-32281-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131113225523.30f7eb69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 13 Nov 2013 22:53:13 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> In case a menu has comment without letters/numbers (eg. characters
> matching the regexp '^[^[:alpha:][:digit:]]+$', for example - or *),
> hitting space will cycle through those comments, rather than
> selecting/deselecting the currently-highlighted option.
> 
> This is the behaviour of hitting any letter/digit: jump to the next
> option which prompt starts with that letter. The only letters that
> do not behave as such are 'y' 'm' and 'n'. Prompts that start with
> one of those three letters are instead matched on the first letter
> that is not 'y', 'm' or 'n'.
> 
> Fix that by treating 'space' as we treat y/m/n, ie. as an action key,
> not as shortcut to jump to  prompt.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
> Note: I'll be running this upstream soonish.

Thanks?

> ---
>  support/kconfig/lxdialog/menubox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Shouldn't we also update the patches in support/kconfig/patches/ ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
