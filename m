From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:32:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/sngrep: fix static linking
 against libpcap
In-Reply-To: <20170128170759.2489-1-bernd.kuhls@t-online.de>
References: <20170128170759.2489-1-bernd.kuhls@t-online.de>
Message-ID: <20170129143230.4c63b486@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 18:07:59 +0100, Bernd Kuhls wrote:

> +SNGREP_CONF_ENV += \
> +	$(if $(BR2_STATIC_LIBS),LIBS="-lpcap `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`")

Why do you use --additional-libs instead of --libs? With --libs, you
wouldn't have to separately pass -lpcap, as it would be returned by
pcap-config.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
