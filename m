From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 23:17:55 +0200
Subject: [Buildroot] [PATCH 1/5] python-pyasn: new package
In-Reply-To: <1380830465-16083-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1380830465-16083-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20131003231755.72ecace9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 3 Oct 2013 15:01:01 -0500, Ryan Barnett wrote:

> +		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
> +		CXX="$(TARGET_CXX)" \
> +		CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include" \
> +		LDSHARED="$(TARGET_CC) -shared" \
> +		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \

These additional -I and -L are rather weird because they simply pass
what are already the default search paths for headers and libraries.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
