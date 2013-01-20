From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 23:10:53 +0100
Subject: [Buildroot] [PATCH v3 2/5] polkit: new package
In-Reply-To: <1358546927-25707-3-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Fri, 18 Jan 2013 23:08:44 +0100")
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
 <1358546927-25707-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87fw1vbj4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
 Marek> ---
 Marek>  package/Config.in        |    1 +
 Marek>  package/polkit/Config.in |   11 +++++++++++
 Marek>  package/polkit/polkit.mk |   20 ++++++++++++++++++++
 Marek>  3 files changed, 32 insertions(+)
 Marek>  create mode 100644 package/polkit/Config.in
 Marek>  create mode 100644 package/polkit/polkit.mk

 Marek> diff --git a/package/Config.in b/package/Config.in
 Marek> index e6153f0..c889d8a 100644
 Marek> --- a/package/Config.in
 Marek> +++ b/package/Config.in
 Marek> @@ -761,6 +761,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Marek>  source "package/module-init-tools/Config.in"
 Marek>  endif
 Marek>  source "package/monit/Config.in"
 Marek> +source "package/polkit/Config.in"
 Marek>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Marek>  source "package/procps/Config.in"
 Marek>  source "package/psmisc/Config.in"
 Marek> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..36206bd
 Marek> --- /dev/null
 Marek> +++ b/package/polkit/Config.in
 Marek> @@ -0,0 +1,11 @@
 Marek> +config BR2_PACKAGE_POLKIT
 Marek> +	bool "polkit"
 Marek> +	depends on BR2_USE_WCHAR # gettext
 Marek> +	select BR2_PACKAGE_LIBGLIB2

While the comment is technically correct, I find it more helpful to
mention that the dependency comes from libglib2 (and indirectly from
gettext), so I've changed that.

Committed with that small change, thanks.

-- 
Bye, Peter Korsgaard
