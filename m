Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3877ECD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E1785554;
	Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RW5WzvzYKd8w; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0D085549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010078;
	bh=pIJvuxxp7KZdmyLZDkF94j5if4uqKw2xKJYtaagpWYY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y5ocmefrhQQC47wROTvPF1ZAG17v7QiOGG0W1tAhfRB3T2S6fhkCBHKLJV0QFc/Lh
	 Gp354yicYAEIaCNaudf4SgpA71M9od0SgQWNS1MMHSKRC73azaNIqRev2yIVWSlnIj
	 2gTpFwiI+2dQ2c1f87r5q3+bxas47bvG/suGCC1Lyz/q+BWczn1Hevl7X2e/sCu5kD
	 wtlSUtG+NXh6rhJyoAMj++Psyx7bA0ZZq3qW/oVK7hKaznyHjoyVtsl2/D4xByBIxK
	 Yfo5PfClpadS0W/0XbuFLiPTz+3kzmwhkGtJDUXTuNTeLM+id+buT3Ojd/UgvpFzIb
	 2FKzv6EI9L42A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0D085549;
	Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC69B190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9269F8551E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdSawf5w9w61 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CEB78550A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CEB78550A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4B4E87DE8; Tue,  9 Jun 2026 13:00:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 14:57:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a562b8c3aa8f47976c4eb10dc9723f1dc86e5d56
X-Git-Newrev: 62afff3baabd4535cb6909e7324779aea577ad85
X-Patchwork-Hint: ignore
Message-Id: <20260609130053.B4B4E87DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: Bump version to 10.5.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8043423322581889574=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8043423322581889574==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62afff3baabd4535cb6909e7324779aea577ad85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/FRRouting/frr/releases/tag/frr-10.5.4

Summary of Changes:

bfdd:
    - cap IPv6 echo reflection to declared length
    - account for FP offset in echo length checks
    - fix recv errno filter logic in a few places
    - tighten SBFD reflector packet sanity checks
    - gate IPv6 echo reflection on known sessions
    - tighten auth header parsing skeleton
    - validate control packet length before session lookup

bgpd:
    - Fix memleak when configuring rd
    - Validate if NHC BGPID TLV value is non-zero
    - Avoid having a dangling pointer after we free NHC attribute
    - Check if BGPID NHC TLV exists when IPv6 next-hop is link-local
    - Do not allocate NHC TLV with an extra trailer
    - migrate timers during peer_xfer_conn to fix stale route cleanup
    - honor 'no activate' for dynamic neighbors in peer-group
    - Return immediately when dynamic capability action is not valid
    - Validate BGP role capability when handling it dynamically
    - fix neighbor IP comparison for IPv6 memcmp return values
    - Don't mark nexthop as changed if a set next-hop unchanged is applied
    - Return BGP_PEER_INTERNAL when first peer's as type is set to auto
    - Update peer sort cache when remote-as auto is used and AS number changed
    - Check dynamic capability action before validating ENHE capability
    - Do not allocate stream if route-refresh capability is not received
    - Move rpki strict check to bgp_accept()
    - Fix memory leak for nhc attribute if ipv6 is link-local address
    - Fix compilation for Debian 11 when printing uint64 values
    - Return zero labels if no BOS found and it's not a withdraw label
    - Fix signed overflow in hexstr2num()
    - Check the length also when parsing ENCAP attr sub-TLVs
    - Validate prefixlen before subtracting when parsing labeled unicast NLRI
    - Reset the stream to attr_start + attribute_len when WITHDRAWN
    - Revalidate locally originated routes against RPKI changes
    - Check if prefixlen is not 0 when parsing flowspec stuff
    - Prevent len_string going negative when trying to display flowspec entries
    - fix import vrf on non existing vrf
    - fix no vrf import command
    - Free hostname for FQDN capability if the parsing goes wrong
    - Validate MP_REACH_NLRI attribute against incorrect next-hop
    - Fix dynamic FQDN capability handling
    - Check if the remaining length for subtracting TLV length is enough
    - Fix the end pointer boundaries for dynamic graceful restart capability
    - Add missing returns when parsing enhanced route-refresh
    - Return original as-path when reconciling AS versus AS4
    - Do not process route-refresh for AFI/SAFI if it's not negotiated
    - Check if we are not overusing error_data buffer when unknown cap received
    - fix NHT for explicit link-local BGP peers
    - improve packet parsing for EVPN and ENCAP/VNC
    - Prevent heap use-after-free for tunnel encapsulation attribute
    - Return 0 if AS4 capability is malformed
    - close dynamic peer socket in ttl error path
    - fix logic handling EVPN_FLAG_DEFAULT_GW
    - avoid early return in MPLSVPN NLRI processing
    - remove unneeded asserts in packet reads

eigrpd:
    - fix byte order in Hello TLV decode functions
    - Handling for malformed update packets
    - enforce minimum TLV length in Hello handler
    - reject invalid prefix mask len
    - skip unknown and ignored TLVs
    - Improve packet validation

isisd:
    - Reject SRv6 Locator TLV with Loc-Size of zero
    - consume leftover bytes after FAD sub-sub-TLV loop
    - use correct min size values for srv6 subtlvs
    - improve validation of flex-algo decoder
    - Fix missing neighbor address Sub-TLVs after link-params change
    - add unit test for remove_excess_adjs() memory leak fix
    - fix memory leak in remove_excess_adjs()
    - fix edge condition in max_lsp_count computation

ldpd:
    - improve tlv validation in several places

lib:
    - Report IPv6 MTU and not IPv4 for if_update_state_mtu6
    - disable warning in zlog.c to match master

nhrpd:
    - stop debugging auth credentials
    - fix byte-order when comparing error code in shortcut path
    - guard against zbuf_pulln NULL on truncated packets
    - require auth for all received packet types
    - harden debug packet parsing against malformed input
    - validate AFI index in extension replies

ospf6d:
    - move log call out of priv block
    - remove asserts in packet-handling paths
    - fix issues in ospf6 auth trailer code

ospfd:
    - add LSA validation in the apiserver path
    - add validation in several places before accessing

pceplib:
    - validate during of_list TLV decoding

pimd:
    - fix NOCACHE MFC resync detection log, add vrf name too
    - use upstream-owned pim pointer in register and upstream timers
    - use upstream-owned pim pointer in MSDP update paths
    - avoid JP build deref through channel OIL
    - guard RP RPF-failure mroute delete on detached OIL
    - avoid null deref in upstream delete debug path
    - guard channel OIL detach against stale pointers
    - fix crash due to double free
    - Ensure igmp message is of proper size
    - Reject pim packets with a malformed header length
    - Fix out of bounds read in AutoRP code
    - igmpv3 never checks packet length and trusts the num-sources field
    - Do not allow a register-stop message if not received from the RP
    - Prevent received msg length from being larger than buffer
    - Remove unnecessary asserts
    - When receiving a register stop ensure we have enough data to read
    - Ensure a register packet has enough space to read S,G data
    - Ensure that header has space on packet

ripngd:
    - fix data handling in several places

tests:
    - Check if route-map with set nexthop unchanged does not prevent outgoing
    - Check if mixed peer-group remote-as types can be used with auto
    - Verify neighbor addr Sub-TLVs after link-params reset
    - Expect return code being 0, not -1 when AS4 is empty or ASN is 0

vrrpd:
    - replace some asserts
    - only support ethernet in GARP code
    - limit advertised timers to 12-bits

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 349c56fc24..043d890b23 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ecc95009b88e66df2c91be02fbf0a3eb8e1de434fd652e0cbf46f19126f708ec  frr-10.5.3.tar.gz
+sha256  1e8401e1bfcbb9b0dfefc9b335013733a3c77cdf85c79ff66d9e65167d9cfb1e  frr-10.5.4.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index c5a12f6992..5138b34dca 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.5.3
+FRR_VERSION = 10.5.4
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \

--===============8043423322581889574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8043423322581889574==--
