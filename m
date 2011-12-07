From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 21:04:10 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: add CONFIG_AP support
In-Reply-To: <1323088398-32014-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 5 Dec 2011 13:33:18 +0100")
References: <1323088398-32014-1-git-send-email-zonque@gmail.com>
Message-ID: <87aa74cfnp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Daniel> ---
 Daniel>  package/wpa_supplicant/Config.in         |    9 +++++++++
 Daniel>  package/wpa_supplicant/wpa_supplicant.mk |   11 +++++++++++
 Daniel>  2 files changed, 20 insertions(+), 0 deletions(-)

 Daniel> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
 Daniel> index e3df2b4..aa2d196 100644
 Daniel> --- a/package/wpa_supplicant/Config.in
 Daniel> +++ b/package/wpa_supplicant/Config.in
 Daniel> @@ -23,3 +23,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 Daniel>  	help
 Daniel>  	  Install wpa_passphrase command line utility
 
 Daniel> +config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 Daniel> +	bool "Enable support for soft AP"
 Daniel> +	depends on BR2_PACKAGE_WPA_SUPPLICANT
 Daniel> +	help
 Daniel> +	  With this option enabled, wpa_supplicant can act as
 Daniel> +	  access point. This can be used for open and WPA2-Personal networks
 Daniel> +          (optionally, with WPS); this links in parts of hostapd functionality
 Daniel> +          into wpa_supplicant.

The indentation is wrong, otherwise it looks good, committed thanks.

-- 
Bye, Peter Korsgaard
