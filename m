From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:49:22 +0200
Subject: [Buildroot] [PATCH v3,
 3/6] package/collectd: add DPDK_TELEMETRY option
In-Reply-To: <20200817121834.3054906a@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 17 Aug 2020 12:18:34 +0200")
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-3-fontaine.fabrice@gmail.com>
 <20200817121834.3054906a@windsurf.home>
Message-ID: <877dtisokt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 15 Apr 2020 08:30:05 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> DPDK support is available since version 5.11.0 and
 >> https://github.com/collectd/collectd/commit/00cbd4d2c016a676db476ae66bbc58d6bf11a6a0
 >> 
 >> It depends on jansson and is currently enabled by default raising the
 >> following build failure on musl:
 >> 
 >> src/dpdk_telemetry.c:43:10: fatal error: sys/unistd.h: No such file or directory
 >> #include <sys/unistd.h>
 >> ^~~~~~~~~~~~~~
 >> 
 >> Fixes:
 >> - autobuild.buildroot.org/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...c-dpdk_telemetry.c-fix-build-on-musl.patch | 37 +++++++++++++++++++
 >> package/collectd/Config.in                    |  7 ++++
 >> package/collectd/collectd.mk                  |  5 +++
 >> 3 files changed, 49 insertions(+)
 >> create mode 100644 package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
