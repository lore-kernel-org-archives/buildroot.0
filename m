From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:52:33 +0100
Subject: [Buildroot] [PATCH 1/1] check-package: avoid false warning of
 useless flag
In-Reply-To: <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
References: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
Message-ID: <20171202145233.62c248e9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 02:28:24 -0200, Ricardo Martincoski wrote:
> Just AUTORECONF = NO is redundant.
> Just HOST_AUTORECONF = NO is redundant.
> But the combination of AUTORECONF = YES + HOST_AUTORECONF = NO is valid.
> 
> So basically for all variables that have inheritance between target and
> host, having the host variant of the variable set the variable value
> back to its default is correct if the target variable is set.
> 
> Instead of increasing complexity of the script to fully detect this
> case, ignore the host flag set to its default value as it can be
> overriding a non-default value inherited from the equivalent target
> flag.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> Part of commit log copied from Thomas' e-mail. I hope you don't mind.
> ---
>  utils/checkpackagelib/lib_mk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
