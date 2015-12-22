From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 20:58:08 +0100
Subject: [Buildroot] [PATCH v7 1/1] package/unscd: new package
In-Reply-To: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
References: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20151222205808.2d24281e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Wed,  2 Dec 2015 08:56:17 -0600, Doug Kehn wrote:
> A daemon which handles passwd, group and host lookups for running
> programs and caches the results for the next query. This package is
> intended to replace glibc nscd. Presently, glibc nscd is not installed
> by Buildroot.
> 
> unscd depends on glibc because it relies on glibc function
> __nss_disable_nscd.
> 
> nscd.conf is taken from glibc with unused configurations removed.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
> Changes v6 -> v7
>   - Re-add package/Config.in (Arnout).
>   - Reword config help test (Arnout).
>   - Remove commented params in nscd.conf (Arnout).
>   - Rework BUILD_CMDS (Arnout/Thomas).
>   - Reword commit log (Arnout).
> Changes v5 -> v6
>   - Remove toolchain patch/BR2_GLIBC_NSCD (Thomas).
>   - Change source site from Debian to upstream (Thomas).
>   - Update to version 0.52 (Thomas).
> Changes v4 -> v5
>   - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
> Changes v3 -> v4
>   - Incorporate feedback/suggestions by Yann and Maxime.
> Changes v2 -> v3
>   - Remove trailing '/' from UNSCD_SITE.
>   - Whitespace cleanup.
> Changes v1 -> v2
>   - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
> ---
>  package/Config.in        |  1 +
>  package/unscd/Config.in  | 25 +++++++++++++++++++++++++
>  package/unscd/S46unscd   | 24 ++++++++++++++++++++++++
>  package/unscd/nscd.conf  | 33 +++++++++++++++++++++++++++++++++
>  package/unscd/unscd.hash |  2 ++
>  package/unscd/unscd.mk   | 36 ++++++++++++++++++++++++++++++++++++
>  6 files changed, 121 insertions(+)
>  create mode 100644 package/unscd/Config.in
>  create mode 100644 package/unscd/S46unscd
>  create mode 100644 package/unscd/nscd.conf
>  create mode 100644 package/unscd/unscd.hash
>  create mode 100644 package/unscd/unscd.mk

I've applied your patch. However, I think a follow-up patch would be
good to add the use of a PID file in the init script. See for example
S50dropbear for an example where a PID file is used.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
