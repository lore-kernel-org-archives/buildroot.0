From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 17 Oct 2017 10:26:51 +0200
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: add upstream security
	fixes
In-Reply-To: <87sheimbkj.fsf@dell.be.48ers.dk>
References: <20171016111921.627-1-peter@korsgaard.com>
 <1508225024.10343.2.camel@embedded.rocks> <87sheimbkj.fsf@dell.be.48ers.dk>
Message-ID: <1508228811.10343.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-10-17 at 10:18 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
>  > Hi Peter,
>  > On Mon, 2017-10-16 at 13:19 +0200, Peter Korsgaard wrote:
>  >> Fixes CVE-2017-13078, CVE-2017-13079, CVE-2017-13080, CVE-2017-
> 13081,
>  >> CVE-2017-13087, CVE-2017-13088:
>  >> 
>  >> http://lists.infradead.org/pipermail/hostap/2017-October/037989.h
> tml
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> package/wpa_supplicant/wpa_supplicant.hash | 6 ++++++
>  >> package/wpa_supplicant/wpa_supplicant.mk   | 7 +++++++
>  >> 2 files changed, 13 insertions(+)
>  >> 
>  >> diff --git a/package/wpa_supplicant/wpa_supplicant.hash
>  >> b/package/wpa_supplicant/wpa_supplicant.hash
>  >> index 22b2e8ddd8..b522661fe0 100644
>  >> --- a/package/wpa_supplicant/wpa_supplicant.hash
>  >> +++ b/package/wpa_supplicant/wpa_supplicant.hash
>  >> @@ -1,2 +1,8 @@
>  >> # Locally calculated
>  >>
> sha256  b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b
>  >> 1450  wpa_supplicant-2.6.tar.gz
>  >>
> +sha256  d86d47ab74170f3648b45b91bce780949ca92b09ab43df065178850ec0c3
>  >> 35d7  rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-
> use-
>  >> group-ke.patch
>  >>
> +sha256  d4535e36739a0cc7f3585e6bcba3c0bb8fc67cb3e729844e448c5dc751f4
>  >> 7e81  rebased-v2.6-0003-Extend-protection-of-GTK-IGTK-
> reinstallation-
>  >> of-WNM-.patch
>  >>
> +sha256  793a54748161b5af430dd9de4a1988d19cb8e85ab29bc2340f886b0297ce
>  >> e20b  rebased-v2.6-0004-Prevent-installation-of-an-all-zero-
> TK.patch
>  >>
> +sha256  596d4d3b63ea859ed7ea9791b3a21cb11b6173b04c0a14a2afa47edf1666
>  >> afa6  rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch
>  >>
> +sha256  c5a17af84aec2d88c56ce0da2d6945be398fe7cab5c0c340deb30973900c
>  >> 2736  rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-
> without-
>  >> pending-r.patch
>  >>
> +sha256  c8840d857b9432f3b488113c85c1ff5d4a4b8d81078b7033388dae1e9908
>  >> 43b1  rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-
>  >> Response-fram.patch
>  >> diff --git a/package/wpa_supplicant/wpa_supplicant.mk
>  >> b/package/wpa_supplicant/wpa_supplicant.mk
>  >> index 2e8b82cebe..67b502d6ef 100644
>  >> --- a/package/wpa_supplicant/wpa_supplicant.mk
>  >> +++ b/package/wpa_supplicant/wpa_supplicant.mk
>  >> @@ -6,6 +6,13 @@
>  >> 
>  >> WPA_SUPPLICANT_VERSION = 2.6
>  >> WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
>  >> +WPA_SUPPLICANT_PATCH = \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0002-Prevent-r
> eins
>  >> tallation-of-an-already-in-use-group-ke.patch \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0003-Extend-pr
> otec
>  >> tion-of-GTK-IGTK-reinstallation-of-WNM-.patch \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0004-Prevent-i
> nsta
>  >> llation-of-an-all-zero-TK.patch \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0006-TDLS-Reje
> ct-T
>  >> PK-TK-reconfiguration.patch \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0007-WNM-Ignor
> e-WN
>  >> M-Sleep-Mode-Response-without-pending-r.patch \
>  >> +	http://w1.fi/security/2017-1/rebased-v2.6-0008-FT-Do-not
> -all
>  >> ow-multiple-Reassociation-Response-fram.patch
>  >> WPA_SUPPLICANT_LICENSE = BSD-3-Clause
>  >> WPA_SUPPLICANT_LICENSE_FILES = README
>  >> WPA_SUPPLICANT_CONFIG =
> $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
> 
>  > As wpa_supplicant also provides an AP mode capability, which
> shares the
>  > most code with hostap, patch 0001 should be applied, too.
> 
> Ok, that wasn't clear from the security announcement (it explicitly
> says
> this is for hostapd).

I haven't checked if the patched functionality is really used by
wpa_supplicants AP mode. However, the involved source files are used
when building with CONFIG_AP. At least, it does not hurt to apply all
patches.

> Anything else that should be added to this or hostapd?

Nothing I can think of.

> The whole hostapd/wpa_supplicant mix is kind of confusing to me.

That's true.

J?rg.
