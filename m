From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  8 Sep 2019 18:17:07 +0300
Subject: [Buildroot] [PATCH 0/2] Add Config.in option for WPA3 support in
 wpa_supplicant and hostapd
Message-ID: <20190908151709.23971-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and all,

New wpa_supplicant v2.9 enables by default WPA3 features such as OWE, SAE, DPP.
These features require openssl support for wpa_supplicant build to succeed.
Suggested two patches add Config.in option for WPA3 support in both hostapd
and wpa_supplicant. When this option is selected, openssl is also selected
and WPA3 features are enabled in configuration files.

This change is supposed to fix multiple defconfig build failures from
daily build results for 2019-09-06.

Regards,
Sergey

Sergey Matyukevich (2):
  package/wpa_supplicant: add Config.in option for WPA3
  package/hostapd: add Config.in option for WPA3

 package/hostapd/Config.in                |  7 +++++++
 package/hostapd/hostapd.mk               | 11 +++++++++++
 package/wpa_supplicant/Config.in         |  7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 12 ++++++++++++
 4 files changed, 37 insertions(+)

-- 
2.23.0
