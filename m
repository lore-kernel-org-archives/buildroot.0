From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:40 +0000
Subject: [Buildroot] [PATCH v2 0/7] Adding janus-gateway and dependencies
Message-ID: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2 of janus-gateway and dependencies.

Changelog:
- added sha256
- restructured patches to include Config.in changes for each package separately
- incorporated ealier work on sofia-sip from http://lists.busybox.net/pipermail/buildroot/2012-January/049258.html

Gregory Dymarek (7):
  Adding ding-libs
  Adding gengetopt
  Adding libnice
  Adding libsrtp
  Adding libwebsock
  Adding sofia-sip
  Adding janus-gateway

 package/Config.in                                  |  7 +++++
 package/Config.in.host                             |  1 +
 package/ding-libs/Config.in                        |  9 +++++++
 package/ding-libs/ding-libs.hash                   |  1 +
 package/ding-libs/ding-libs.mk                     | 17 ++++++++++++
 package/gengetopt/Config.in                        |  6 +++++
 package/gengetopt/Config.in.host                   |  6 +++++
 package/gengetopt/gengetopt.hash                   |  1 +
 package/gengetopt/gengetopt.mk                     | 16 +++++++++++
 package/janus-gateway/Config.in                    | 13 +++++++++
 .../janus-gateway-0001-disable-ssp.patch           | 12 +++++++++
 package/janus-gateway/janus-gateway.hash           |  1 +
 package/janus-gateway/janus-gateway.mk             | 27 +++++++++++++++++++
 package/libnice/Config.in                          |  6 +++++
 .../libnice/libnice-0001-build-IPV6_RECVERR.patch  | 20 ++++++++++++++
 package/libnice/libnice.hash                       |  1 +
 package/libnice/libnice.mk                         | 11 ++++++++
 package/libsrtp/Config.in                          |  5 ++++
 package/libsrtp/libsrtp.hash                       |  1 +
 package/libsrtp/libsrtp.mk                         | 13 +++++++++
 package/libwebsock/Config.in                       |  6 +++++
 package/libwebsock/libwebsock.hash                 |  1 +
 package/libwebsock/libwebsock.mk                   | 22 +++++++++++++++
 package/sofia-sip/Config.in                        |  5 ++++
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch | 26 ++++++++++++++++++
 package/sofia-sip/sofia-sip.hash                   |  1 +
 package/sofia-sip/sofia-sip.mk                     | 31 ++++++++++++++++++++++
 27 files changed, 266 insertions(+)
 create mode 100644 package/ding-libs/Config.in
 create mode 100644 package/ding-libs/ding-libs.hash
 create mode 100644 package/ding-libs/ding-libs.mk
 create mode 100644 package/gengetopt/Config.in
 create mode 100644 package/gengetopt/Config.in.host
 create mode 100644 package/gengetopt/gengetopt.hash
 create mode 100644 package/gengetopt/gengetopt.mk
 create mode 100644 package/janus-gateway/Config.in
 create mode 100644 package/janus-gateway/janus-gateway-0001-disable-ssp.patch
 create mode 100644 package/janus-gateway/janus-gateway.hash
 create mode 100644 package/janus-gateway/janus-gateway.mk
 create mode 100644 package/libnice/Config.in
 create mode 100644 package/libnice/libnice-0001-build-IPV6_RECVERR.patch
 create mode 100644 package/libnice/libnice.hash
 create mode 100644 package/libnice/libnice.mk
 create mode 100644 package/libsrtp/Config.in
 create mode 100644 package/libsrtp/libsrtp.hash
 create mode 100644 package/libsrtp/libsrtp.mk
 create mode 100644 package/libwebsock/Config.in
 create mode 100644 package/libwebsock/libwebsock.hash
 create mode 100644 package/libwebsock/libwebsock.mk
 create mode 100644 package/sofia-sip/Config.in
 create mode 100644 package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
 create mode 100644 package/sofia-sip/sofia-sip.hash
 create mode 100644 package/sofia-sip/sofia-sip.mk

-- 
1.9.1
