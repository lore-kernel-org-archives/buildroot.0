From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 13:45:30 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add upstream 2020-2
 security fix
In-Reply-To: <20210205121329.31131-1-peter@korsgaard.com>
References: <20210205121329.31131-1-peter@korsgaard.com>
Message-ID: <20210205124530.GT2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-05 13:13 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
>  - wpa_supplicant P2P group information processing vulnerability (no CVE yet)
> 
>    A vulnerability was discovered in how wpa_supplicant processing P2P
>    (Wi-Fi Direct) group information from active group owners.  The actual
>    parsing of that information validates field lengths appropriately, but
>    processing of the parsed information misses a length check when storing a
>    copy of the secondary device types.  This can result in writing attacker
>    controlled data into the peer entry after the area assigned for the
>    secondary device type.  The overflow can result in corrupting pointers
>    for heap allocations.  This can result in an attacker within radio range
>    of the device running P2P discovery being able to cause unexpected
>    behavior, including termination of the wpa_supplicant process and
>    potentially arbitrary code execution.
> 
> For more details, see the advisory:
> https://w1.fi/security/2020-2/wpa_supplicant-p2p-group-info-processing-vulnerability.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

(I just moved the _PATCH near _VERSION and _SITE to keep similar things
together)

Regards,
Yann E. MORIN.)

> ---
>  package/wpa_supplicant/wpa_supplicant.hash | 1 +
>  package/wpa_supplicant/wpa_supplicant.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
> index ff5a2edb34..cce465d849 100644
> --- a/package/wpa_supplicant/wpa_supplicant.hash
> +++ b/package/wpa_supplicant/wpa_supplicant.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256  fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17  wpa_supplicant-2.9.tar.gz
>  sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
> +sha256  c4d65cc13863e0237d0644198558e2c47b4ed91e2b2be4516ff590724187c4a5  0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 9e8282b8ef..43baff6bbe 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -11,6 +11,8 @@ WPA_SUPPLICANT_LICENSE_FILES = README
>  WPA_SUPPLICANT_CPE_ID_VENDOR = w1.fi
>  WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
>  WPA_SUPPLICANT_SUBDIR = wpa_supplicant
> +WPA_SUPPLICANT_PATCH = \
> +	https://w1.fi/security/2020-2/0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
>  WPA_SUPPLICANT_DBUS_OLD_SERVICE = fi.epitest.hostap.WPASupplicant
>  WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
>  WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
