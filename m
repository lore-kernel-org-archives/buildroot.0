From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 11:10:41 +0100
Subject: [Buildroot] [PATCH 03/33] tcpdump: use 'pkg-config pcap'
 instead of pcap-config
In-Reply-To: <1353543503-8952-4-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20121122111041.73d397ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 22 Nov 2012 01:17:53 +0100, Samuel Martin wrote:

> +-	    AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
> ++	    AC_PATH_TOOL(PCAP_CONFIG, pkg-config)

This is not generally how pkg-config is used. In general, people use
the PKG_CHECK_MODULES() autoconf macro.

Has this been pushed upstream? I guess you need to make it smarter
like: start testing with pkg-config, then fallback to pcap-config, in
order to make this suitable for upstream.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
