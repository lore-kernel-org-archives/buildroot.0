From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:14:47 +0200
Subject: [Buildroot] [PATCH] package/dovecot: security bump to version
 2.3.5.2
In-Reply-To: <20190425102618.32491-1-peter@korsgaard.com>
References: <20190425102618.32491-1-peter@korsgaard.com>
Message-ID: <20190426091447.5a0168f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 12:26:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> * CVE-2019-10691: Trying to login with 8bit username containing
>   invalid UTF8 input causes auth process to crash if auth policy is
>   enabled. This could be used rather easily to cause a DoS. Similar
>   crash also happens during mail delivery when using invalid UTF8 in
>   From or Subject header when OX push notification driver is used.
> 
> https://dovecot.org/pipermail/dovecot-news/2019-April/000406.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
