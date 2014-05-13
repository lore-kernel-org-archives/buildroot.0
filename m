From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 09:28:20 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: detect readline support
	in wpa_cli
In-Reply-To: <5371ADE2.8010807@mind.be> (Arnout Vandecappelle's message of
 "Tue, 13 May 2014 07:30:10 +0200")
References: <1399911369-3165-1-git-send-email-oscar.hellstrom@vinnter.se>
 <5371ADE2.8010807@mind.be>
Message-ID: <87r43yuoh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 12/05/14 18:16, Oscar Hellstr?m wrote:
 >> Signed-off-by: Oscar Hellstr?m <oscar.hellstrom@vinnter.se>
 >> ---
 >> package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
 >> 1 file changed, 5 insertions(+)
 >> 
 >> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
 >> index 9fcda2e..9321f08 100644
 >> --- a/package/wpa_supplicant/wpa_supplicant.mk
 >> +++ b/package/wpa_supplicant/wpa_supplicant.mk
 >> @@ -105,6 +105,11 @@ define WPA_SUPPLICANT_DEBUG_CONFIG
 >> endef
 >> endif
 >> 
 >> +ifeq ($(BR2_PACKAGE_READLINE),y)
 >> +	WPA_SUPPLICANT_DEPENDENCIES += readline
 >> +	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE

 >  In package .mk file, we don't indent within if... constructs; we only use
 > indentation for commands and for continuation lines. I admit that that coding
 > style is objectionable, but it is what it is.

True, but this is atleast consistent with the rest of the file, so I
will leave it like this for now.

-- 
Bye, Peter Korsgaard
