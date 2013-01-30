From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jan 2013 08:47:19 -0300
Subject: [Buildroot] [PATCH] wireshark: new package
In-Reply-To: <9b4fd5a7c061d1912a23865e2cd2bbfe9cef6390.1359524462.git.baruch@tkos.co.il>
References: <9b4fd5a7c061d1912a23865e2cd2bbfe9cef6390.1359524462.git.baruch@tkos.co.il>
Message-ID: <51090847.2040208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2013 02:42 AM, Baruch Siach wrote:
> +WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config

I need ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config in
CONF_ENV also. That's because configure is finding /usr/bin/pcap-config
from my distribution before the staging one.
And also the exec_prefix/prefix fixups in
$(STAGING_DIR)/usr/bin/pcap-config since they point to /usr (the usual
way in libpcap or Stefan's patch for the nice fixup).
With these tweaks it builds nicely.
Also might be worth to bump (again!) to 1.8.5 a security release.
Regards.
