From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:14:03 +0200
Subject: [Buildroot] [PATCH] support: properly check bash is available
In-Reply-To: <1395185629-728-1-git-send-email-yann.morin.1998@free.fr>
References: <1395185629-728-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140420111403.4d0fd54a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 19 Mar 2014 00:33:49 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The current check is broken, as it only checks if the user's login
> shell is bash, not what the system shell is.
> 
> Mimick the sequence found in the top-level Makefile to search for
> bash, except for the fallback case, where we explicitly check that
> 'sh' is bash, by checking if it sets $BASH, so we know the fallback
> case, in the top-level Makefile, to use 'sh' will indeed use bash.
> 
> Remove superfluous semi-colons ';' at the end of lines, they are
> not needed in a shell script (this is not C!)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Andrew Barnes <andy@outsideglobe.com>
> ---
>  support/dependencies/dependencies.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
