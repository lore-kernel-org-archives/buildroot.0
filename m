From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:57:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] check-package: add version format
 check
In-Reply-To: <20191025092104.1164-1-heiko.thiery@gmail.com>
References: <20191025092104.1164-1-heiko.thiery@gmail.com>
Message-ID: <20191026155754.38eade84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Fri, 25 Oct 2019 11:21:04 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> To meet the requirement of "Anitya", the tool used by
> https://release-monitoring.org/, the <pkg>_VERSION variable
> should not contain a prefix 'v'.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

The implementation looks good, but we cannot apply this patch now,
because a number of packages cause this check to fail:

package/mcelog/mcelog.mk:7: remove 'v' prefix from v153 of variable MCELOG_VERSION and add to MCELOG_SITE
package/pru-software-support/pru-software-support.mk:7: remove 'v' prefix from v5.1.0 of variable PRU_SOFTWARE_SUPPORT_VERSION and add to PRU_SOFTWARE_SUPPORT_SITE
package/dt-utils/dt-utils.mk:7: remove 'v' prefix from v2019.01.0 of variable DT_UTILS_VERSION and add to DT_UTILS_SITE
package/dt/dt.mk:7: remove 'v' prefix from v18.32 of variable DT_VERSION and add to DT_SITE
package/gstreamer1/gst1-shark/gst1-shark.mk:7: remove 'v' prefix from v0.6.1 of variable GST1_SHARK_VERSION and add to GST1_SHARK_SITE
package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk:7: remove 'v' prefix from v0.3 of variable GST1_PLUGINS_BAYER2RGB_NEON_VERSION and add to GST1_PLUGINS_BAYER2RGB_NEON_SITE
package/perl-net-snmp/perl-net-snmp.mk:7: remove 'v' prefix from v6.0.1 of variable PERL_NET_SNMP_VERSION and add to PERL_NET_SNMP_SITE
package/linux-zigbee/linux-zigbee.mk:7: remove 'v' prefix from v0.3.1 of variable LINUX_ZIGBEE_VERSION and add to LINUX_ZIGBEE_SITE
package/spidev_test/spidev_test.mk:14: remove 'v' prefix from v4.10 of variable SPIDEV_TEST_VERSION and add to SPIDEV_TEST_SITE
package/spidev_test/spidev_test.mk:17: remove 'v' prefix from v3.0 of variable SPIDEV_TEST_VERSION and add to SPIDEV_TEST_SITE
package/flannel/flannel.mk:7: remove 'v' prefix from v0.5.5 of variable FLANNEL_VERSION and add to FLANNEL_SITE
package/flatbuffers/flatbuffers.mk:7: remove 'v' prefix from v1.11.0 of variable FLATBUFFERS_VERSION and add to FLATBUFFERS_SITE
package/python-scapy3k/python-scapy3k.mk:7: remove 'v' prefix from v0.18 of variable PYTHON_SCAPY3K_VERSION and add to PYTHON_SCAPY3K_SITE
package/softether/softether.mk:7: remove 'v' prefix from v4.28-9669-beta of variable SOFTETHER_VERSION and add to SOFTETHER_SITE

Until we fix those, we cannot add your patch as otherwise our CI would
be complaining all day long.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
