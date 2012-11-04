From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 13:06:56 +0100
Subject: [Buildroot] [PATCH] ulogd: fix build failure
In-Reply-To: <1352028912-23845-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 4 Nov 2012 08:35:12 -0300")
References: <1352028912-23845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bofdr2qn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix Peter's reported build failure:
 Gustavo> http://autobuild.buildroot.net/results/1dcf63799937f2216e3c712af8880ad431dbd47c/build-end.log
 Gustavo> This is because the configure script uses absolute paths to detect dbi,
 Gustavo> mysql and pgsql, so forcibly disable them.
 Gustavo> Also add the optional sqlite dependency when it's selected.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/ulogd/ulogd.mk |    3 ++-
 Gustavo>  1 files changed, 2 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
 Gustavo> index 7d31b73..4620bbd 100644
 Gustavo> --- a/package/ulogd/ulogd.mk
 Gustavo> +++ b/package/ulogd/ulogd.mk
 Gustavo> @@ -7,10 +7,11 @@
 Gustavo>  ULOGD_VERSION = 2.0.1
 Gustavo>  ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 Gustavo>  ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 Gustavo> +ULOGD_CONF_OPT = --with-dbi=no --with-mysql=no --with-pgsql=no

We do have mysql_client though - Any reason to not build support for it
if enabled?

-- 
Bye, Peter Korsgaard
