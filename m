From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 16 Jan 2013 13:45:53 +0200
Subject: [Buildroot] [PATCH] proxychains-ng: copy proxychains.conf to
	target dir
In-Reply-To: <87r4llmyj4.fsf@dell.be.48ers.dk>
References: <1358309415-12945-1-git-send-email-stefan.froberg@petroprogram.com>
 <87r4llmyj4.fsf@dell.be.48ers.dk>
Message-ID: <50F692F1.4090800@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

16.1.2013 8:29, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> proxychains installation does not copy proxychains.conf to 
>  Stefan> $(TARGET_DIR)/etc anymore so we have to do it manually now.
>
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  Stefan> ---
>  Stefan>  package/proxychains-ng/proxychains-ng.mk |    6 ++++++
>  Stefan>  1 files changed, 6 insertions(+), 0 deletions(-)
>
>  Stefan> diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
>  Stefan> index 9cf24bf..70d35b6 100644
>  Stefan> --- a/package/proxychains-ng/proxychains-ng.mk
>  Stefan> +++ b/package/proxychains-ng/proxychains-ng.mk
>  Stefan> @@ -7,4 +7,10 @@ PROXYCHAINS_NG_VERSION = 4.4
>  Stefan>  PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
>  Stefan>  PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
>  
>  Stefan> +define PROXYCHAINS_NG_POST_INSTALL_TARGET
>  Stefan> +	$(INSTALL) -m 755 $(@D)/src/proxychains.conf $(TARGET_DIR)/etc
>
> Does the configuration file really need to be executable?

Uuups!  sorry

> /etc is almost guaranteed to exist, but for consistency please use
> install -D . $(TARGET_DIR)/etc/proxychains.conf
>
Okay

Fixing and resubmitting

Stefan
