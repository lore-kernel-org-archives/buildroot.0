From: Artem Panfilov <apanfilov@spectracom.com>
Date: Thu, 2 Aug 2018 11:37:35 +0300
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: add optional support
 for linux-pam
In-Reply-To: <5b393fxsn8.ln2@ID-313208.user.individual.net>
References: <20180801132114.24273-1-apanfilov@spectracom.com>
 <5b393fxsn8.ln2@ID-313208.user.individual.net>
Message-ID: <c18728a2-e18d-07f4-7dbd-e2bb05778c12@spectracom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

 > could you please add
 >
 > ??? else
 > ??? PURE_FTPD_CONF_OPTS += --without-pam

I added your change, thanks.

Best Regards,
Artyom

 From fd70cdf2634e279eb604bbf3381ce70eefd9a7b2 Mon Sep 17 00:00:00 2001
From: Artem Panfilov <apanfilov@spectracom.com>
Date: Wed, 1 Aug 2018 16:05:59 +0300
Subject: [PATCH 1/1] package/pure-ftpd: add optional support for linux-pam

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
---
 ?package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 ?1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 457e67ea60..ae3ca9d1f0 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -57,4 +57,11 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT),y)
 ?PURE_FTPD_CONF_OPTS += --with-uploadscript
 ?endif

+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+PURE_FTPD_CONF_OPTS += --with-pam
+PURE_FTPD_DEPENDENCIES += linux-pam
+else
+PURE_FTPD_CONF_OPTS += --without-pam
+endif
+
 ?$(eval $(autotools-package))
-- 
2.17.1

On 01.08.2018 19:22, Bernd Kuhls wrote:
> Am Wed, 01 Aug 2018 16:21:14 +0300 schrieb Artem Panfilov:
>
>> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>> +PURE_FTPD_CONF_OPTS += --with-pam
>> +PURE_FTPD_DEPENDENCIES += linux-pam
>> +endif
> Hi Artem,
>
> could you please add
>
> 	else
> 	PURE_FTPD_CONF_OPTS += --without-pam
>
> to make sure the outcome of the configure step takes our config into
> account and not defaults chosen by upstream?
>
> Thanks!
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
