Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA364C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436D06F924;
	Fri, 16 Sep 2022 13:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436D06F924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyP47OJbmnie; Fri, 16 Sep 2022 13:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC6961376;
	Fri, 16 Sep 2022 13:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC6961376
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7913E1BF2C0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5458461376
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5458461376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bzutedg7wb0v for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 13:46:55 +0000 (UTC)
X-Greylist: delayed 00:07:35 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F3F612A4
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7F3F612A4
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id C84DB39857;
 Fri, 16 Sep 2022 15:04:24 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 15:04:23 +0200
Message-Id: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v2] package/gnuradio: bump version to 3.10.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

- remove all no more required patches
- backport patch to fix failure with fmt > 9
- add dependency to SPDLOG
- add pybind dependency where python is set

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- remove #runtime comment for PYTHON_NUMPY and PYTHON_PYBIND (Thomas)
- remove host-python-mako to the dependencies list (now useless) (Thomas)
- backport patch to fix build failure with libfmt > 9
---
 ...-failures-with-libfmt-9.0.0-in-logge.patch |  399 +++++++
 ....h-drop-boost-cstdint.hpp-and-use-cs.patch |   39 -
 ...aceholders_with_their_full_namespace.patch | 1012 -----------------
 ...rdcode-INTERFACE_INCLUDE_DIRECTORIES.patch |   57 -
 ...add-examples-c-subdirectory-when-gr-.patch |   55 -
 ...ve-deprecated-math-common_factor.hpp.patch |  165 ---
 package/gnuradio/Config.in                    |    7 +-
 package/gnuradio/gnuradio.hash                |    2 +-
 package/gnuradio/gnuradio.mk                  |   12 +-
 9 files changed, 409 insertions(+), 1339 deletions(-)
 create mode 100644 package/gnuradio/0001-global-Fix-build-failures-with-libfmt-9.0.0-in-logge.patch
 delete mode 100644 package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
 delete mode 100644 package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
 delete mode 100644 package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
 delete mode 100644 package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
 delete mode 100644 package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch

diff --git a/package/gnuradio/0001-global-Fix-build-failures-with-libfmt-9.0.0-in-logge.patch b/package/gnuradio/0001-global-Fix-build-failures-with-libfmt-9.0.0-in-logge.patch
new file mode 100644
index 0000000000..cb3aed07ad
--- /dev/null
+++ b/package/gnuradio/0001-global-Fix-build-failures-with-libfmt-9.0.0-in-logge.patch
@@ -0,0 +1,399 @@
+From aff7fb81dd472018aefa2c6b5387b51fdd7cf20e Mon Sep 17 00:00:00 2001
+From: Huang Rui <vowstar@users.noreply.github.com>
+Date: Tue, 30 Aug 2022 23:31:37 +0800
+Subject: [PATCH] global: Fix build failures with libfmt-9.0.0 in logger
+
+libfmt-9.0.0 disabled automatic std::ostream insertion operator
+(operator<<) discovery when fmt/ostream.h is included to prevent
+ODR violations. It require explicit tagging of ARG types.
+
+Tried the following:
+fmt::streamed and fmt::ostream_formatter not compatible with
+older versions, FMT_DEPRECATED_OSTREAM will be removed in the
+next major release so can't use.
+
+With the help of @mormj, fixed this issue by not passing pointers
+of types not supported by libfmt into the logging functions.
+
+Bug: https://bugs.gentoo.org/858659
+Closes: https://github.com/gnuradio/gnuradio/issues/6052
+Signed-off-by: Huang Rui <vowstar@gmail.com>
+
+Signed-off-by: Huang Rui <vowstar@gmail.com>
+(cherry picked from commit 0019f292f526242a12c88489b56b63aa57f14ffb)
+Signed-off-by: Jeff Long <willcode4@gmail.com>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ gnuradio-runtime/lib/flat_flowgraph.cc     | 45 +++++++++++--------
+ gnuradio-runtime/lib/flowgraph.cc          |  9 ++--
+ gnuradio-runtime/lib/hier_block2_detail.cc | 50 ++++++++++++----------
+ gr-analog/lib/sig_source_impl.cc           |  2 +-
+ gr-uhd/lib/usrp_block_impl.cc              | 24 ++++++-----
+ 5 files changed, 74 insertions(+), 56 deletions(-)
+
+diff --git a/gnuradio-runtime/lib/flat_flowgraph.cc b/gnuradio-runtime/lib/flat_flowgraph.cc
+index 42875fb4c..eb6edfb10 100644
+--- a/gnuradio-runtime/lib/flat_flowgraph.cc
++++ b/gnuradio-runtime/lib/flat_flowgraph.cc
+@@ -64,10 +64,10 @@ void flat_flowgraph::setup_connections()
+     // Connect message ports connections
+     for (msg_edge_viter_t i = d_msg_edges.begin(); i != d_msg_edges.end(); i++) {
+         d_debug_logger->debug("flat_fg connecting msg primitives: ({}, {})->({}, {})\n",
+-                              i->src().block(),
+-                              i->src().port(),
+-                              i->dst().block(),
+-                              i->dst().port());
++                              i->src().block()->identifier(),
++                              pmt::write_string(i->src().port()),
++                              i->dst().block()->identifier(),
++                              pmt::write_string(i->dst().port()));
+         i->src().block()->message_port_sub(
+             i->src().port(), pmt::cons(i->dst().block()->alias_pmt(), i->dst().port()));
+     }
+@@ -347,10 +347,10 @@ void flat_flowgraph::merge_connections(flat_flowgraph_sptr old_ffg)
+         for (msg_edge_viter_t i = d_msg_edges.begin(); i != d_msg_edges.end(); i++) {
+             d_debug_logger->debug(
+                 "flat_fg connecting msg primitives: ({}, {})->({}, {})\n",
+-                i->src().block(),
+-                i->src().port(),
+-                i->dst().block(),
+-                i->dst().port());
++                i->src().block()->identifier(),
++                pmt::write_string(i->src().port()),
++                i->dst().block()->identifier(),
++                pmt::write_string(i->dst().port()));
+             i->src().block()->message_port_sub(
+                 i->src().port(),
+                 pmt::cons(i->dst().block()->alias_pmt(), i->dst().port()));
+@@ -411,24 +411,31 @@ std::string flat_flowgraph::msg_edge_list()
+ void flat_flowgraph::dump()
+ {
+     for (edge_viter_t e = d_edges.begin(); e != d_edges.end(); e++)
+-        d_logger->info(" edge: {}", *e);
++        d_logger->info(" edge: {}", (*e).identifier());
+ 
+     for (basic_block_viter_t p = d_blocks.begin(); p != d_blocks.end(); p++) {
+-        d_logger->info(" block: {}", *p);
++        d_logger->info(" block: {}", (*p)->identifier());
+         block_detail_sptr detail = cast_to_block_sptr(*p)->detail();
+-        d_logger->info(" detail @{}:", detail);
++        d_logger->info(" detail @{}:", static_cast<void*>(detail.get()));
+ 
+         int ni = detail->ninputs();
+         int no = detail->noutputs();
+         for (int i = 0; i < no; i++) {
+             buffer_sptr buffer = detail->output(i);
+-            d_logger->info("   output {:d}: {}", i, buffer);
++            d_logger->info(
++                "   output {:d}: {}",
++                i,
++                static_cast<std::stringstream&&>(std::stringstream() << buffer).str());
+         }
+ 
+         for (int i = 0; i < ni; i++) {
+             buffer_reader_sptr reader = detail->input(i);
+             d_logger->info(
+-                "   reader {:d}: {} reading from buffer={}", i, reader, reader->buffer());
++                "   reader {:d}: {} reading from buffer={}",
++                i,
++                static_cast<std::stringstream&&>(std::stringstream() << reader).str(),
++                static_cast<std::stringstream&&>(std::stringstream() << reader->buffer())
++                    .str());
+         }
+     }
+ }
+@@ -481,16 +488,16 @@ void flat_flowgraph::replace_endpoint(const msg_endpoint& e,
+ {
+     size_t n_replr(0);
+     d_debug_logger->debug("flat_flowgraph::replace_endpoint( {}, {}, {:d} )\n",
+-                          e.block(),
+-                          r.block(),
++                          e.block()->identifier(),
++                          r.block()->identifier(),
+                           is_src);
+     for (size_t i = 0; i < d_msg_edges.size(); i++) {
+         if (is_src) {
+             if (d_msg_edges[i].src() == e) {
+                 d_debug_logger->debug(
+                     "flat_flowgraph::replace_endpoint() flattening to ( {}, {} )\n",
+-                    r,
+-                    d_msg_edges[i].dst());
++                    r.identifier(),
++                    d_msg_edges[i].dst().identifier());
+                 d_msg_edges.push_back(msg_edge(r, d_msg_edges[i].dst()));
+                 n_replr++;
+             }
+@@ -498,8 +505,8 @@ void flat_flowgraph::replace_endpoint(const msg_endpoint& e,
+             if (d_msg_edges[i].dst() == e) {
+                 d_debug_logger->debug(
+                     "flat_flowgraph::replace_endpoint() flattening to ( {}, {} )\n",
+-                    r,
+-                    d_msg_edges[i].src());
++                    r.identifier(),
++                    d_msg_edges[i].src().identifier());
+                 d_msg_edges.push_back(msg_edge(d_msg_edges[i].src(), r));
+                 n_replr++;
+             }
+diff --git a/gnuradio-runtime/lib/flowgraph.cc b/gnuradio-runtime/lib/flowgraph.cc
+index 0bc04adc2..144f54262 100644
+--- a/gnuradio-runtime/lib/flowgraph.cc
++++ b/gnuradio-runtime/lib/flowgraph.cc
+@@ -77,7 +77,7 @@ void flowgraph::validate()
+         std::vector<int> used_ports;
+         int ninputs, noutputs;
+ 
+-        d_debug_logger->debug("Validating block: {}", *p);
++        d_debug_logger->debug("Validating block: {}", (*p)->identifier());
+ 
+         used_ports = calc_used_ports(*p, true); // inputs
+         ninputs = used_ports.size();
+@@ -125,15 +125,16 @@ void flowgraph::check_valid_port(gr::io_signature::sptr sig, int port)
+ 
+ void flowgraph::check_valid_port(const msg_endpoint& e)
+ {
+-    d_debug_logger->debug("check_valid_port({}, {})", e.block(), e.port());
++    d_debug_logger->debug(
++        "check_valid_port({}, {})", e.block()->identifier(), pmt::write_string(e.port()));
+ 
+     if (!e.block()->has_msg_port(e.port())) {
+         const gr::basic_block::msg_queue_map_t& msg_map = e.block()->get_msg_map();
+-        d_logger->warn("Could not find port {} in:", e.port());
++        d_logger->warn("Could not find port {} in:", pmt::write_string(e.port()));
+         for (gr::basic_block::msg_queue_map_t::const_iterator it = msg_map.begin();
+              it != msg_map.end();
+              ++it)
+-            d_logger->warn("  {}", it->first);
++            d_logger->warn("  {}", pmt::write_string(it->first));
+         throw std::invalid_argument("invalid msg port in connect() or disconnect()");
+     }
+ }
+diff --git a/gnuradio-runtime/lib/hier_block2_detail.cc b/gnuradio-runtime/lib/hier_block2_detail.cc
+index 5cb42030d..9ce662249 100644
+--- a/gnuradio-runtime/lib/hier_block2_detail.cc
++++ b/gnuradio-runtime/lib/hier_block2_detail.cc
+@@ -90,8 +90,9 @@ void hier_block2_detail::connect(basic_block_sptr src,
+ {
+     std::stringstream msg;
+ 
+-    d_debug_logger->debug(
+-        "connecting: {} -> {}", endpoint(src, src_port), endpoint(dst, dst_port));
++    d_debug_logger->debug("connecting: {} -> {}",
++                          endpoint(src, src_port).identifier(),
++                          endpoint(dst, dst_port).identifier());
+ 
+     if (src.get() == dst.get())
+         throw std::invalid_argument(
+@@ -182,11 +183,11 @@ void hier_block2_detail::msg_connect(basic_block_sptr src,
+ 
+     // add edge for this message connection
+     d_debug_logger->debug("msg_connect( ({}, {}, {:d}), ({}, {}, {:d}) )",
+-                          src,
+-                          srcport,
++                          src->identifier(),
++                          pmt::write_string(srcport),
+                           hier_out,
+-                          dst,
+-                          dstport,
++                          dst->identifier(),
++                          pmt::write_string(dstport),
+                           hier_in);
+     d_fg->connect(msg_endpoint(src, srcport, hier_out),
+                   msg_endpoint(dst, dstport, hier_in));
+@@ -271,7 +272,8 @@ void hier_block2_detail::disconnect(basic_block_sptr block)
+         if ((*p).src().block() == block || (*p).dst().block() == block) {
+             edges.push_back(*p);
+ 
+-            d_debug_logger->debug("disconnect: block found in edge {}", *p);
++            d_debug_logger->debug("disconnect: block found in edge {}",
++                                  (*p).identifier());
+         }
+     }
+ 
+@@ -292,8 +294,9 @@ void hier_block2_detail::disconnect(basic_block_sptr src,
+                                     basic_block_sptr dst,
+                                     int dst_port)
+ {
+-    d_debug_logger->debug(
+-        "disconnecting: {} -> {}", endpoint(src, src_port), endpoint(dst, dst_port));
++    d_debug_logger->debug("disconnecting: {} -> {}",
++                          endpoint(src, src_port).identifier(),
++                          endpoint(dst, dst_port).identifier());
+ 
+     if (src.get() == dst.get())
+         throw std::invalid_argument(
+@@ -514,7 +517,8 @@ endpoint_vector_t hier_block2_detail::resolve_endpoint(const endpoint& endp,
+ 
+     // Check if endpoint is a leaf node
+     if (cast_to_block_sptr(endp.block())) {
+-        d_debug_logger->debug("Block {} is a leaf node, returning.", endp.block());
++        d_debug_logger->debug("Block {} is a leaf node, returning.",
++                              endp.block()->identifier());
+         result.push_back(endp);
+         return result;
+     }
+@@ -523,7 +527,7 @@ endpoint_vector_t hier_block2_detail::resolve_endpoint(const endpoint& endp,
+     hier_block2_sptr hier_block2(cast_to_hier_block2_sptr(endp.block()));
+     if (hier_block2) {
+         d_debug_logger->debug("Resolving endpoint {} as an {:s}, recursing",
+-                              endp,
++                              endp.identifier(),
+                               is_input ? "input" : "output");
+         return hier_block2->d_detail->resolve_port(endp.port(), is_input);
+     }
+@@ -666,7 +670,7 @@ void hier_block2_detail::flatten_aux(flat_flowgraph_sptr sfg) const
+     d_debug_logger->debug("Flattening stream connections: ");
+ 
+     for (p = edges.begin(); p != edges.end(); p++) {
+-        d_debug_logger->debug("Flattening edge {}", *p);
++        d_debug_logger->debug("Flattening edge {}", (*p).identifier());
+ 
+         endpoint_vector_t src_endps = resolve_endpoint(p->src(), false);
+         endpoint_vector_t dst_endps = resolve_endpoint(p->dst(), true);
+@@ -674,7 +678,7 @@ void hier_block2_detail::flatten_aux(flat_flowgraph_sptr sfg) const
+         endpoint_viter_t s, d;
+         for (s = src_endps.begin(); s != src_endps.end(); s++) {
+             for (d = dst_endps.begin(); d != dst_endps.end(); d++) {
+-                d_debug_logger->debug(" {} -> {}", *s, *d);
++                d_debug_logger->debug(" {} -> {}", (*s).identifier(), (*d).identifier());
+                 sfg->connect(*s, *d);
+             }
+         }
+@@ -686,28 +690,29 @@ void hier_block2_detail::flatten_aux(flat_flowgraph_sptr sfg) const
+     std::vector<std::pair<msg_endpoint, bool>> resolved_endpoints;
+     for (q = msg_edges.begin(); q != msg_edges.end(); q++) {
+         d_debug_logger->debug(" flattening edge ( {}, {}, {:d}) -> ( {}, {}, {:d})",
+-                              q->src().block(),
+-                              q->src().port(),
++                              q->src().block()->identifier(),
++                              pmt::write_string(q->src().port()),
+                               q->src().is_hier(),
+-                              q->dst().block(),
+-                              q->dst().port(),
++                              q->dst().block()->identifier(),
++                              pmt::write_string(q->dst().port()),
+                               q->dst().is_hier());
+ 
+ 
+         if (q->src().is_hier() && q->src().block().get() == d_owner) {
+             // connection into this block ..
+-            d_debug_logger->debug("hier incoming port: {}", q->src());
++            d_debug_logger->debug("hier incoming port: {}", q->src().identifier());
+             sfg->replace_endpoint(q->src(), q->dst(), false);
+             resolved_endpoints.push_back(std::pair<msg_endpoint, bool>(q->src(), false));
+         } else if (q->dst().is_hier() && q->dst().block().get() == d_owner) {
+             // connection out of this block
+-            d_debug_logger->debug("hier outgoing port: {}", q->dst());
++            d_debug_logger->debug("hier outgoing port: {}", q->dst().identifier());
+             sfg->replace_endpoint(q->dst(), q->src(), true);
+             resolved_endpoints.push_back(std::pair<msg_endpoint, bool>(q->dst(), true));
+         } else {
+             // internal connection only
+-            d_debug_logger->debug(
+-                "internal msg connection: {} --> {}", q->src(), q->dst());
++            d_debug_logger->debug("internal msg connection: {} --> {}",
++                                  q->src().identifier(),
++                                  q->dst().identifier());
+             sfg->connect(q->src(), q->dst());
+         }
+     }
+@@ -716,7 +721,8 @@ void hier_block2_detail::flatten_aux(flat_flowgraph_sptr sfg) const
+              resolved_endpoints.begin();
+          it != resolved_endpoints.end();
+          it++) {
+-        d_debug_logger->debug("sfg->clear_endpoint({}, {})", it->first, it->second);
++        d_debug_logger->debug(
++            "sfg->clear_endpoint({}, {})", it->first.identifier(), it->second);
+         sfg->clear_endpoint((*it).first, (*it).second);
+     }
+ 
+diff --git a/gr-analog/lib/sig_source_impl.cc b/gr-analog/lib/sig_source_impl.cc
+index 0e1db8164..5750e6cd4 100644
+--- a/gr-analog/lib/sig_source_impl.cc
++++ b/gr-analog/lib/sig_source_impl.cc
+@@ -113,7 +113,7 @@ void sig_source_impl<T>::set_cmd_msg(pmt::pmt_t msg)
+                 this->d_logger->warn("offset value needs to be a number");
+             }
+         } else {
+-            this->d_logger->warn("unsupported message key {}", key);
++            this->d_logger->warn("unsupported message key {}", pmt::write_string(key));
+         }
+ 
+         // advance to next item, if any
+diff --git a/gr-uhd/lib/usrp_block_impl.cc b/gr-uhd/lib/usrp_block_impl.cc
+index cb6dccfcd..989363195 100644
+--- a/gr-uhd/lib/usrp_block_impl.cc
++++ b/gr-uhd/lib/usrp_block_impl.cc
+@@ -433,7 +433,8 @@ void usrp_block_impl::msg_handler_command(pmt::pmt_t msg)
+     // hopefully remove this:
+     if (pmt::is_tuple(msg)) {
+         if (pmt::length(msg) != 2 && pmt::length(msg) != 3) {
+-            d_logger->alert("Error while unpacking command PMT: {}", msg);
++            d_logger->alert("Error while unpacking command PMT: {}",
++                            pmt::write_string(msg));
+             return;
+         }
+         pmt::pmt_t new_msg = pmt::make_dict();
+@@ -441,7 +442,8 @@ void usrp_block_impl::msg_handler_command(pmt::pmt_t msg)
+         if (pmt::length(msg) == 3) {
+             new_msg = pmt::dict_add(new_msg, cmd_chan_key(), pmt::tuple_ref(msg, 2));
+         }
+-        d_debug_logger->warn("Using legacy message format (tuples): {}", msg);
++        d_debug_logger->warn("Using legacy message format (tuples): {}",
++                             pmt::write_string(msg));
+         return msg_handler_command(new_msg);
+     }
+     // End of legacy backward compat code.
+@@ -451,15 +453,16 @@ void usrp_block_impl::msg_handler_command(pmt::pmt_t msg)
+     if (!(pmt::is_dict(msg)) && pmt::is_pair(msg)) {
+         d_logger->debug(
+             "Command message is pair, converting to dict: '{}': car({}), cdr({})",
+-            msg,
+-            pmt::car(msg),
+-            pmt::cdr(msg));
++            pmt::write_string(msg),
++            pmt::write_string(pmt::car(msg)),
++            pmt::write_string(pmt::cdr(msg)));
+         msg = pmt::dict_add(pmt::make_dict(), pmt::car(msg), pmt::cdr(msg));
+     }
+ 
+     // Make sure, we use dicts!
+     if (!pmt::is_dict(msg)) {
+-        d_logger->error("Command message is neither dict nor pair: {}", msg);
++        d_logger->error("Command message is neither dict nor pair: {}",
++                        pmt::write_string(msg));
+         return;
+     }
+ 
+@@ -494,7 +497,7 @@ void usrp_block_impl::msg_handler_command(pmt::pmt_t msg)
+     _force_tune = pmt::dict_has_key(msg, cmd_direction_key());
+ 
+     /// 4) Loop through all the values
+-    d_debug_logger->debug("Processing command message {}", msg);
++    d_debug_logger->debug("Processing command message {}", pmt::write_string(msg));
+     pmt::pmt_t msg_items = pmt::dict_items(msg);
+     for (size_t i = 0; i < pmt::length(msg_items); i++) {
+         try {
+@@ -504,8 +507,8 @@ void usrp_block_impl::msg_handler_command(pmt::pmt_t msg)
+                                      msg);
+         } catch (pmt::wrong_type& e) {
+             d_logger->alert("Invalid command value for key {}: {}",
+-                            pmt::car(pmt::nth(i, msg_items)),
+-                            pmt::cdr(pmt::nth(i, msg_items)));
++                            pmt::write_string(pmt::car(pmt::nth(i, msg_items))),
++                            pmt::write_string(pmt::cdr(pmt::nth(i, msg_items))));
+             break;
+         }
+     }
+@@ -672,7 +675,8 @@ void usrp_block_impl::_cmd_handler_gpio(const pmt::pmt_t& gpio_attr,
+         ));
+ 
+     if (!pmt::is_dict(gpio_attr)) {
+-        d_logger->error("gpio_attr in  message is neither dict nor pair: {}", gpio_attr);
++        d_logger->error("gpio_attr in  message is neither dict nor pair: {}",
++                        pmt::write_string(gpio_attr));
+         return;
+     }
+     if (!pmt::dict_has_key(gpio_attr, pmt::mp("bank")) ||
+-- 
+2.35.1
+
diff --git a/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
deleted file mode 100644
index 532bebcf2e..0000000000
--- a/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f643bc12100c67288adda3699a9e61d6a66fb529 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Fri, 7 Feb 2020 16:49:30 +0100
-Subject: [PATCH] gr-digital:glfsr.h: drop boost/cstdint.hpp and use cstdint
-
-gr-digital/glfsr.h include boost/cstdint.hpp to have uintxx_t.
-These types are in boost namespace but nor using namespace xxx, nor boost:: are used.
-The result is :
-In file included from /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/glfsr.cc:23:
-/home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/../include/gnuradio/digital/glfsr.h:42:5: error: 'uint32_t' does not name a type; did you mean 'u_int32_t'?
-uint32_t d_shift_register;
-^~~~~~~~
-u_int32_t
-
-Since Gnuradio policy is Less boost == better and C++11 is used, use cstdint
-instead of boost/cstdint.hpp.
-
-[backported from 475e4a156b516c089175afb998acdc80b740b437]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-digital/include/gnuradio/digital/glfsr.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gr-digital/include/gnuradio/digital/glfsr.h b/gr-digital/include/gnuradio/digital/glfsr.h
-index 0b5141f1f..1003bcd01 100644
---- a/gr-digital/include/gnuradio/digital/glfsr.h
-+++ b/gr-digital/include/gnuradio/digital/glfsr.h
-@@ -24,7 +24,7 @@
- #define INCLUDED_DIGITAL_GLFSR_H
- 
- #include <gnuradio/digital/api.h>
--#include <boost/cstdint.hpp>
-+#include <cstdint>
- 
- namespace gr {
- namespace digital {
--- 
-2.24.1
-
diff --git a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch b/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
deleted file mode 100644
index 431cc12522..0000000000
--- a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
+++ /dev/null
@@ -1,1012 +0,0 @@
-From 5d4c317a372c77aa70df6ab3403d161cd41a7d17 Mon Sep 17 00:00:00 2001
-From: ponce <matteo.bernardini@gmail.com>
-Date: Sun, 17 May 2020 14:02:57 +0200
-Subject: [PATCH] boost: qualify placeholders with their full namespace.
-
-This is needed with boost >= 1.73.0.
-
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/3566]
-
-Signed-off-by: ponce <matteo.bernardini@gmail.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- .../(exported from wiki) Message Passing.txt  |  8 +++---
- gnuradio-runtime/lib/block.cc                 |  3 ++-
- gr-blocks/lib/copy_impl.cc                    |  4 ++-
- gr-blocks/lib/message_debug_impl.cc           | 13 +++++++---
- gr-blocks/lib/message_strobe_impl.cc          |  5 ++--
- gr-blocks/lib/message_strobe_random_impl.cc   |  5 ++--
- gr-blocks/lib/multiply_matrix_impl.cc         | 11 +++++---
- gr-blocks/lib/mute_impl.cc                    |  5 ++--
- gr-blocks/lib/nop_impl.cc                     |  5 ++--
- gr-blocks/lib/pdu_filter_impl.cc              |  5 ++--
- gr-blocks/lib/pdu_remove_impl.cc              |  5 ++--
- gr-blocks/lib/pdu_set_impl.cc                 |  4 ++-
- gr-blocks/lib/random_pdu_impl.cc              |  5 ++--
- gr-blocks/lib/repeat_impl.cc                  |  5 ++--
- gr-blocks/lib/socket_pdu_impl.cc              | 18 ++++++++-----
- .../lib/tagged_stream_multiply_length_impl.cc |  7 +++---
- gr-blocks/lib/tuntap_pdu_impl.cc              |  3 ++-
- gr-digital/lib/chunks_to_symbols_impl.cc      |  5 ++--
- .../lib/constellation_receiver_cb_impl.cc     | 14 ++++++-----
- gr-digital/lib/costas_loop_cc_impl.cc         |  4 ++-
- gr-digital/lib/crc32_async_bb_impl.cc         |  8 ++++--
- gr-digital/lib/header_payload_demux_impl.cc   |  7 +++---
- .../lib/protocol_formatter_async_impl.cc      |  4 ++-
- gr-fec/lib/async_decoder_impl.cc              |  8 ++++--
- gr-fec/lib/async_encoder_impl.cc              |  8 ++++--
- gr-fec/lib/depuncture_bb_impl.cc              |  4 ++-
- gr-fec/lib/puncture_bb_impl.cc                |  4 ++-
- gr-fec/lib/puncture_ff_impl.cc                |  4 ++-
- gr-filter/lib/freq_xlating_fir_filter_impl.cc |  2 +-
- gr-filter/lib/mmse_resampler_cc_impl.cc       |  5 ++--
- gr-filter/lib/mmse_resampler_ff_impl.cc       |  5 ++--
- gr-qtgui/lib/const_sink_c_impl.cc             |  5 ++--
- gr-qtgui/lib/edit_box_msg_impl.cc             |  4 ++-
- gr-qtgui/lib/freq_sink_c_impl.cc              | 12 ++++++---
- gr-qtgui/lib/freq_sink_f_impl.cc              | 12 ++++++---
- gr-qtgui/lib/histogram_sink_f_impl.cc         |  5 ++--
- gr-qtgui/lib/sink_c_impl.cc                   |  4 ++-
- gr-qtgui/lib/sink_f_impl.cc                   |  4 ++-
- gr-qtgui/lib/time_raster_sink_b_impl.cc       |  4 ++-
- gr-qtgui/lib/time_raster_sink_f_impl.cc       |  4 ++-
- gr-qtgui/lib/time_sink_c_impl.cc              |  4 ++-
- gr-qtgui/lib/time_sink_f_impl.cc              |  4 ++-
- gr-qtgui/lib/waterfall_sink_c_impl.cc         | 13 +++++++---
- gr-qtgui/lib/waterfall_sink_f_impl.cc         | 13 +++++++---
- gr-uhd/lib/usrp_block_impl.cc                 | 25 ++++++++++++-------
- gr-uhd/lib/usrp_source_impl.cc                |  5 ++--
- gr-zeromq/lib/pub_msg_sink_impl.cc            |  4 ++-
- gr-zeromq/lib/push_msg_sink_impl.cc           |  4 ++-
- 48 files changed, 213 insertions(+), 106 deletions(-)
-
-diff --git a/docs/usage-manual/(exported from wiki) Message Passing.txt b/docs/usage-manual/(exported from wiki) Message Passing.txt
-index 4654bd5da..551e71022 100644
---- a/docs/usage-manual/(exported from wiki) Message Passing.txt	
-+++ b/docs/usage-manual/(exported from wiki) Message Passing.txt	
-@@ -94,7 +94,7 @@ must then bind this port to the message handler. For this, we use
- Boost's 'bind' function:
- 
-   set_msg_handler(pmt::pmt_t port_id,
--    boost::bind(&block_class::message_handler_function, this, _1));
-+    boost::bind(&block_class::message_handler_function, this, boost::placeholders::_1));
- 
- In Python:
- 
-@@ -241,15 +241,15 @@ The constructor of this block looks like this:
-  {
-    message_port_register_in(pmt::mp("print"));
-    set_msg_handler(pmt::mp("print"),
--     boost::bind(&message_debug_impl::print, this, _1));
-+     boost::bind(&message_debug_impl::print, this, boost::placeholders::_1));
-  
-    message_port_register_in(pmt::mp("store"));
-    set_msg_handler(pmt::mp("store"),
--     boost::bind(&message_debug_impl::store, this, _1));
-+     boost::bind(&message_debug_impl::store, this, boost::placeholders::_1));
-  
-    message_port_register_in(pmt::mp("print_pdu"));
-    set_msg_handler(pmt::mp("print_pdu"),
--     boost::bind(&message_debug_impl::print_pdu, this, _1));
-+     boost::bind(&message_debug_impl::print_pdu, this, boost::placeholders::_1));
-  }
- </syntaxhighlight>
- 
-diff --git a/gnuradio-runtime/lib/block.cc b/gnuradio-runtime/lib/block.cc
-index 591428390..fca4cab97 100644
---- a/gnuradio-runtime/lib/block.cc
-+++ b/gnuradio-runtime/lib/block.cc
-@@ -61,7 +61,8 @@ block::block(const std::string& name,
- {
-     global_block_registry.register_primitive(alias(), this);
-     message_port_register_in(d_system_port);
--    set_msg_handler(d_system_port, boost::bind(&block::system_handler, this, _1));
-+    set_msg_handler(d_system_port,
-+                    boost::bind(&block::system_handler, this, boost::placeholders::_1));
- 
-     configure_default_loggers(d_logger, d_debug_logger, symbol_name());
- }
-diff --git a/gr-blocks/lib/copy_impl.cc b/gr-blocks/lib/copy_impl.cc
-index c377e57b1..b55196c24 100644
---- a/gr-blocks/lib/copy_impl.cc
-+++ b/gr-blocks/lib/copy_impl.cc
-@@ -44,7 +44,9 @@ copy_impl::copy_impl(size_t itemsize)
-       d_enabled(true)
- {
-     message_port_register_in(pmt::mp("en"));
--    set_msg_handler(pmt::mp("en"), boost::bind(&copy_impl::handle_enable, this, _1));
-+    set_msg_handler(
-+        pmt::mp("en"),
-+        boost::bind(&copy_impl::handle_enable, this, boost::placeholders::_1));
- }
- 
- copy_impl::~copy_impl() {}
-diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
-index a8c84aa50..916f97ca3 100644
---- a/gr-blocks/lib/message_debug_impl.cc
-+++ b/gr-blocks/lib/message_debug_impl.cc
-@@ -90,14 +90,19 @@ message_debug_impl::message_debug_impl()
-     : block("message_debug", io_signature::make(0, 0, 0), io_signature::make(0, 0, 0))
- {
-     message_port_register_in(pmt::mp("print"));
--    set_msg_handler(pmt::mp("print"), boost::bind(&message_debug_impl::print, this, _1));
-+    set_msg_handler(
-+        pmt::mp("print"),
-+        boost::bind(&message_debug_impl::print, this, boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("store"));
--    set_msg_handler(pmt::mp("store"), boost::bind(&message_debug_impl::store, this, _1));
-+    set_msg_handler(
-+        pmt::mp("store"),
-+        boost::bind(&message_debug_impl::store, this, boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("print_pdu"));
--    set_msg_handler(pmt::mp("print_pdu"),
--                    boost::bind(&message_debug_impl::print_pdu, this, _1));
-+    set_msg_handler(
-+        pmt::mp("print_pdu"),
-+        boost::bind(&message_debug_impl::print_pdu, this, boost::placeholders::_1));
- }
- 
- message_debug_impl::~message_debug_impl() {}
-diff --git a/gr-blocks/lib/message_strobe_impl.cc b/gr-blocks/lib/message_strobe_impl.cc
-index 038eeae5a..d131b8166 100644
---- a/gr-blocks/lib/message_strobe_impl.cc
-+++ b/gr-blocks/lib/message_strobe_impl.cc
-@@ -53,8 +53,9 @@ message_strobe_impl::message_strobe_impl(pmt::pmt_t msg, long period_ms)
-     message_port_register_out(d_port);
- 
-     message_port_register_in(pmt::mp("set_msg"));
--    set_msg_handler(pmt::mp("set_msg"),
--                    boost::bind(&message_strobe_impl::set_msg, this, _1));
-+    set_msg_handler(
-+        pmt::mp("set_msg"),
-+        boost::bind(&message_strobe_impl::set_msg, this, boost::placeholders::_1));
- }
- 
- message_strobe_impl::~message_strobe_impl() {}
-diff --git a/gr-blocks/lib/message_strobe_random_impl.cc b/gr-blocks/lib/message_strobe_random_impl.cc
-index 0ab5d6adc..53e641fba 100644
---- a/gr-blocks/lib/message_strobe_random_impl.cc
-+++ b/gr-blocks/lib/message_strobe_random_impl.cc
-@@ -74,8 +74,9 @@ message_strobe_random_impl::message_strobe_random_impl(
-         new gr::thread::thread(boost::bind(&message_strobe_random_impl::run, this)));
- 
-     message_port_register_in(pmt::mp("set_msg"));
--    set_msg_handler(pmt::mp("set_msg"),
--                    boost::bind(&message_strobe_random_impl::set_msg, this, _1));
-+    set_msg_handler(
-+        pmt::mp("set_msg"),
-+        boost::bind(&message_strobe_random_impl::set_msg, this, boost::placeholders::_1));
- }
- 
- long message_strobe_random_impl::next_delay()
-diff --git a/gr-blocks/lib/multiply_matrix_impl.cc b/gr-blocks/lib/multiply_matrix_impl.cc
-index e1b9c746c..e38953bab 100644
---- a/gr-blocks/lib/multiply_matrix_impl.cc
-+++ b/gr-blocks/lib/multiply_matrix_impl.cc
-@@ -235,9 +235,10 @@ multiply_matrix_impl<gr_complex>::multiply_matrix_impl(
- 
-     pmt::pmt_t port_name = pmt::string_to_symbol("set_A");
-     message_port_register_in(port_name);
--    set_msg_handler(
--        port_name,
--        boost::bind(&multiply_matrix_impl<gr_complex>::msg_handler_A, this, _1));
-+    set_msg_handler(port_name,
-+                    boost::bind(&multiply_matrix_impl<gr_complex>::msg_handler_A,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- template <>
-@@ -257,7 +258,9 @@ multiply_matrix_impl<float>::multiply_matrix_impl(
-     pmt::pmt_t port_name = pmt::string_to_symbol("set_A");
-     message_port_register_in(port_name);
-     set_msg_handler(port_name,
--                    boost::bind(&multiply_matrix_impl<float>::msg_handler_A, this, _1));
-+                    boost::bind(&multiply_matrix_impl<float>::msg_handler_A,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- 
-diff --git a/gr-blocks/lib/mute_impl.cc b/gr-blocks/lib/mute_impl.cc
-index bd65ce207..5c732f8f4 100644
---- a/gr-blocks/lib/mute_impl.cc
-+++ b/gr-blocks/lib/mute_impl.cc
-@@ -47,8 +47,9 @@ mute_impl<T>::mute_impl(bool mute)
-       d_mute(mute)
- {
-     this->message_port_register_in(pmt::intern("set_mute"));
--    this->set_msg_handler(pmt::intern("set_mute"),
--                          boost::bind(&mute_impl<T>::set_mute_pmt, this, _1));
-+    this->set_msg_handler(
-+        pmt::intern("set_mute"),
-+        boost::bind(&mute_impl<T>::set_mute_pmt, this, boost::placeholders::_1));
- }
- 
- template <class T>
-diff --git a/gr-blocks/lib/nop_impl.cc b/gr-blocks/lib/nop_impl.cc
-index db216d97a..e9baee587 100644
---- a/gr-blocks/lib/nop_impl.cc
-+++ b/gr-blocks/lib/nop_impl.cc
-@@ -44,8 +44,9 @@ nop_impl::nop_impl(size_t sizeof_stream_item)
- {
-     // Arrange to have count_received_msgs called when messages are received.
-     message_port_register_in(pmt::mp("port"));
--    set_msg_handler(pmt::mp("port"),
--                    boost::bind(&nop_impl::count_received_msgs, this, _1));
-+    set_msg_handler(
-+        pmt::mp("port"),
-+        boost::bind(&nop_impl::count_received_msgs, this, boost::placeholders::_1));
- }
- 
- nop_impl::~nop_impl() {}
-diff --git a/gr-blocks/lib/pdu_filter_impl.cc b/gr-blocks/lib/pdu_filter_impl.cc
-index b0748eec0..63cfe47e4 100644
---- a/gr-blocks/lib/pdu_filter_impl.cc
-+++ b/gr-blocks/lib/pdu_filter_impl.cc
-@@ -44,8 +44,9 @@ pdu_filter_impl::pdu_filter_impl(pmt::pmt_t k, pmt::pmt_t v, bool invert)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(),
--                    boost::bind(&pdu_filter_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_filter_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_filter_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/pdu_remove_impl.cc b/gr-blocks/lib/pdu_remove_impl.cc
-index 19cc4dc76..2b97f827b 100644
---- a/gr-blocks/lib/pdu_remove_impl.cc
-+++ b/gr-blocks/lib/pdu_remove_impl.cc
-@@ -42,8 +42,9 @@ pdu_remove_impl::pdu_remove_impl(pmt::pmt_t k)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(),
--                    boost::bind(&pdu_remove_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_remove_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_remove_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/pdu_set_impl.cc b/gr-blocks/lib/pdu_set_impl.cc
-index 40fbc3cd8..af59ef70f 100644
---- a/gr-blocks/lib/pdu_set_impl.cc
-+++ b/gr-blocks/lib/pdu_set_impl.cc
-@@ -43,7 +43,9 @@ pdu_set_impl::pdu_set_impl(pmt::pmt_t k, pmt::pmt_t v)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(), boost::bind(&pdu_set_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_set_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_set_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/random_pdu_impl.cc b/gr-blocks/lib/random_pdu_impl.cc
-index 75d825aef..6c142c353 100644
---- a/gr-blocks/lib/random_pdu_impl.cc
-+++ b/gr-blocks/lib/random_pdu_impl.cc
-@@ -52,8 +52,9 @@ random_pdu_impl::random_pdu_impl(int min_items,
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pmt::mp("generate"));
--    set_msg_handler(pmt::mp("generate"),
--                    boost::bind(&random_pdu_impl::generate_pdu, this, _1));
-+    set_msg_handler(
-+        pmt::mp("generate"),
-+        boost::bind(&random_pdu_impl::generate_pdu, this, boost::placeholders::_1));
-     if (length_modulo < 1)
-         throw std::runtime_error("length_module must be >= 1");
-     if (max_items < length_modulo)
-diff --git a/gr-blocks/lib/repeat_impl.cc b/gr-blocks/lib/repeat_impl.cc
-index 189fbc894..d6569625d 100644
---- a/gr-blocks/lib/repeat_impl.cc
-+++ b/gr-blocks/lib/repeat_impl.cc
-@@ -44,8 +44,9 @@ repeat_impl::repeat_impl(size_t itemsize, int interp)
-       d_interp(interp)
- {
-     message_port_register_in(pmt::mp("interpolation"));
--    set_msg_handler(pmt::mp("interpolation"),
--                    boost::bind(&repeat_impl::msg_set_interpolation, this, _1));
-+    set_msg_handler(
-+        pmt::mp("interpolation"),
-+        boost::bind(&repeat_impl::msg_set_interpolation, this, boost::placeholders::_1));
- }
- 
- void repeat_impl::msg_set_interpolation(pmt::pmt_t msg)
-diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
-index df69f07ad..163eec3a6 100644
---- a/gr-blocks/lib/socket_pdu_impl.cc
-+++ b/gr-blocks/lib/socket_pdu_impl.cc
-@@ -101,7 +101,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-         start_tcp_accept();
- 
-         set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::tcp_server_send, this, _1));
-+                        boost::bind(&socket_pdu_impl::tcp_server_send,
-+                                    this,
-+                                    boost::placeholders::_1));
-     } else if (type == "TCP_CLIENT") {
-         boost::system::error_code error = boost::asio::error::host_not_found;
-         d_tcp_socket.reset(new boost::asio::ip::tcp::socket(d_io_service));
-@@ -111,7 +113,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-         d_tcp_socket->set_option(boost::asio::ip::tcp::no_delay(d_tcp_no_delay));
- 
-         set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::tcp_client_send, this, _1));
-+                        boost::bind(&socket_pdu_impl::tcp_client_send,
-+                                    this,
-+                                    boost::placeholders::_1));
- 
-         d_tcp_socket->async_read_some(
-             boost::asio::buffer(d_rxbuf),
-@@ -130,8 +134,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-                         boost::asio::placeholders::error,
-                         boost::asio::placeholders::bytes_transferred));
- 
--        set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::udp_send, this, _1));
-+        set_msg_handler(
-+            pdu::pdu_port_id(),
-+            boost::bind(&socket_pdu_impl::udp_send, this, boost::placeholders::_1));
-     } else if (type == "UDP_CLIENT") {
-         d_udp_socket.reset(
-             new boost::asio::ip::udp::socket(d_io_service, d_udp_endpoint));
-@@ -143,8 +148,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-                         boost::asio::placeholders::error,
-                         boost::asio::placeholders::bytes_transferred));
- 
--        set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::udp_send, this, _1));
-+        set_msg_handler(
-+            pdu::pdu_port_id(),
-+            boost::bind(&socket_pdu_impl::udp_send, this, boost::placeholders::_1));
-     } else
-         throw std::runtime_error("gr::blocks:socket_pdu: unknown socket type");
- 
-diff --git a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-index 30f4c46dc..34b95d647 100644
---- a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-+++ b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-@@ -49,9 +49,10 @@ tagged_stream_multiply_length_impl::tagged_stream_multiply_length_impl(
-     set_tag_propagation_policy(TPP_DONT);
-     set_relative_rate(1, 1);
-     message_port_register_in(pmt::intern("set_scalar"));
--    set_msg_handler(
--        pmt::intern("set_scalar"),
--        boost::bind(&tagged_stream_multiply_length_impl::set_scalar_pmt, this, _1));
-+    set_msg_handler(pmt::intern("set_scalar"),
-+                    boost::bind(&tagged_stream_multiply_length_impl::set_scalar_pmt,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- tagged_stream_multiply_length_impl::~tagged_stream_multiply_length_impl() {}
-diff --git a/gr-blocks/lib/tuntap_pdu_impl.cc b/gr-blocks/lib/tuntap_pdu_impl.cc
-index 4343ae1dc..0d9d7e28c 100644
---- a/gr-blocks/lib/tuntap_pdu_impl.cc
-+++ b/gr-blocks/lib/tuntap_pdu_impl.cc
-@@ -96,7 +96,8 @@ tuntap_pdu_impl::tuntap_pdu_impl(std::string dev, int MTU, bool istunflag)
- 
-     // set up input message port
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(), boost::bind(&tuntap_pdu_impl::send, this, _1));
-+    set_msg_handler(pdu::pdu_port_id(),
-+                    boost::bind(&tuntap_pdu_impl::send, this, boost::placeholders::_1));
- }
- 
- int tuntap_pdu_impl::tun_alloc(char* dev, int flags)
-diff --git a/gr-digital/lib/chunks_to_symbols_impl.cc b/gr-digital/lib/chunks_to_symbols_impl.cc
-index 26d590a66..a6810a69e 100644
---- a/gr-digital/lib/chunks_to_symbols_impl.cc
-+++ b/gr-digital/lib/chunks_to_symbols_impl.cc
-@@ -53,8 +53,9 @@ chunks_to_symbols_impl<IN_T, OUT_T>::chunks_to_symbols_impl(
-     this->message_port_register_in(pmt::mp("set_symbol_table"));
-     this->set_msg_handler(
-         pmt::mp("set_symbol_table"),
--        boost::bind(
--            &chunks_to_symbols_impl<IN_T, OUT_T>::handle_set_symbol_table, this, _1));
-+        boost::bind(&chunks_to_symbols_impl<IN_T, OUT_T>::handle_set_symbol_table,
-+                    this,
-+                    boost::placeholders::_1));
- }
- 
- template <class IN_T, class OUT_T>
-diff --git a/gr-digital/lib/constellation_receiver_cb_impl.cc b/gr-digital/lib/constellation_receiver_cb_impl.cc
-index 7fb7559d5..7e216ece5 100644
---- a/gr-digital/lib/constellation_receiver_cb_impl.cc
-+++ b/gr-digital/lib/constellation_receiver_cb_impl.cc
-@@ -61,14 +61,16 @@ constellation_receiver_cb_impl::constellation_receiver_cb_impl(
-             "This receiver only works with constellations of dimension 1.");
- 
-     message_port_register_in(pmt::mp("set_constellation"));
--    set_msg_handler(
--        pmt::mp("set_constellation"),
--        boost::bind(&constellation_receiver_cb_impl::handle_set_constellation, this, _1));
-+    set_msg_handler(pmt::mp("set_constellation"),
-+                    boost::bind(&constellation_receiver_cb_impl::handle_set_constellation,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("rotate_phase"));
--    set_msg_handler(
--        pmt::mp("rotate_phase"),
--        boost::bind(&constellation_receiver_cb_impl::handle_rotate_phase, this, _1));
-+    set_msg_handler(pmt::mp("rotate_phase"),
-+                    boost::bind(&constellation_receiver_cb_impl::handle_rotate_phase,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- constellation_receiver_cb_impl::~constellation_receiver_cb_impl() {}
-diff --git a/gr-digital/lib/costas_loop_cc_impl.cc b/gr-digital/lib/costas_loop_cc_impl.cc
-index c3b30834e..e1229e6f4 100644
---- a/gr-digital/lib/costas_loop_cc_impl.cc
-+++ b/gr-digital/lib/costas_loop_cc_impl.cc
-@@ -82,7 +82,9 @@ costas_loop_cc_impl::costas_loop_cc_impl(float loop_bw, int order, bool use_snr)
- 
-     message_port_register_in(pmt::mp("noise"));
-     set_msg_handler(pmt::mp("noise"),
--                    boost::bind(&costas_loop_cc_impl::handle_set_noise, this, _1));
-+                    boost::bind(&costas_loop_cc_impl::handle_set_noise,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- costas_loop_cc_impl::~costas_loop_cc_impl() {}
-diff --git a/gr-digital/lib/crc32_async_bb_impl.cc b/gr-digital/lib/crc32_async_bb_impl.cc
-index bffbb2a73..66143866c 100644
---- a/gr-digital/lib/crc32_async_bb_impl.cc
-+++ b/gr-digital/lib/crc32_async_bb_impl.cc
-@@ -48,9 +48,13 @@ crc32_async_bb_impl::crc32_async_bb_impl(bool check)
-     message_port_register_out(d_out_port);
- 
-     if (check)
--        set_msg_handler(d_in_port, boost::bind(&crc32_async_bb_impl::check, this, _1));
-+        set_msg_handler(
-+            d_in_port,
-+            boost::bind(&crc32_async_bb_impl::check, this, boost::placeholders::_1));
-     else
--        set_msg_handler(d_in_port, boost::bind(&crc32_async_bb_impl::calc, this, _1));
-+        set_msg_handler(
-+            d_in_port,
-+            boost::bind(&crc32_async_bb_impl::calc, this, boost::placeholders::_1));
- }
- 
- crc32_async_bb_impl::~crc32_async_bb_impl() {}
-diff --git a/gr-digital/lib/header_payload_demux_impl.cc b/gr-digital/lib/header_payload_demux_impl.cc
-index 98c805fb2..7cc1e0a4e 100644
---- a/gr-digital/lib/header_payload_demux_impl.cc
-+++ b/gr-digital/lib/header_payload_demux_impl.cc
-@@ -150,9 +150,10 @@ header_payload_demux_impl::header_payload_demux_impl(
-     }
-     set_tag_propagation_policy(TPP_DONT);
-     message_port_register_in(msg_port_id());
--    set_msg_handler(
--        msg_port_id(),
--        boost::bind(&header_payload_demux_impl::parse_header_data_msg, this, _1));
-+    set_msg_handler(msg_port_id(),
-+                    boost::bind(&header_payload_demux_impl::parse_header_data_msg,
-+                                this,
-+                                boost::placeholders::_1));
-     for (size_t i = 0; i < special_tags.size(); i++) {
-         d_special_tags.push_back(pmt::string_to_symbol(special_tags[i]));
-         d_special_tags_last_value.push_back(pmt::PMT_NIL);
-diff --git a/gr-digital/lib/protocol_formatter_async_impl.cc b/gr-digital/lib/protocol_formatter_async_impl.cc
-index 84b693745..c08bbb9ae 100644
---- a/gr-digital/lib/protocol_formatter_async_impl.cc
-+++ b/gr-digital/lib/protocol_formatter_async_impl.cc
-@@ -55,7 +55,9 @@ protocol_formatter_async_impl::protocol_formatter_async_impl(
-     message_port_register_out(d_pld_port);
- 
-     set_msg_handler(d_in_port,
--                    boost::bind(&protocol_formatter_async_impl::append, this, _1));
-+                    boost::bind(&protocol_formatter_async_impl::append,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- protocol_formatter_async_impl::~protocol_formatter_async_impl() {}
-diff --git a/gr-fec/lib/async_decoder_impl.cc b/gr-fec/lib/async_decoder_impl.cc
-index e7a668c83..5d68d13ae 100644
---- a/gr-fec/lib/async_decoder_impl.cc
-+++ b/gr-fec/lib/async_decoder_impl.cc
-@@ -65,10 +65,14 @@ async_decoder_impl::async_decoder_impl(generic_decoder::sptr my_decoder,
-     if (d_packed) {
-         d_pack = new blocks::kernel::pack_k_bits(8);
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_decoder_impl::decode_packed, this, _1));
-+                        boost::bind(&async_decoder_impl::decode_packed,
-+                                    this,
-+                                    boost::placeholders::_1));
-     } else {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_decoder_impl::decode_unpacked, this, _1));
-+                        boost::bind(&async_decoder_impl::decode_unpacked,
-+                                    this,
-+                                    boost::placeholders::_1));
-     }
- 
-     // The maximum frame size is set by the initial frame size of the decoder.
-diff --git a/gr-fec/lib/async_encoder_impl.cc b/gr-fec/lib/async_encoder_impl.cc
-index 811d55601..506ae5c7e 100644
---- a/gr-fec/lib/async_encoder_impl.cc
-+++ b/gr-fec/lib/async_encoder_impl.cc
-@@ -64,7 +64,9 @@ async_encoder_impl::async_encoder_impl(generic_encoder::sptr my_encoder,
- 
-     if (d_packed) {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_encoder_impl::encode_packed, this, _1));
-+                        boost::bind(&async_encoder_impl::encode_packed,
-+                                    this,
-+                                    boost::placeholders::_1));
- 
-         d_unpack = new blocks::kernel::unpack_k_bits(8);
- 
-@@ -74,7 +76,9 @@ async_encoder_impl::async_encoder_impl(generic_encoder::sptr my_encoder,
- 
-     } else {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_encoder_impl::encode_unpacked, this, _1));
-+                        boost::bind(&async_encoder_impl::encode_unpacked,
-+                                    this,
-+                                    boost::placeholders::_1));
-     }
- 
-     if (d_packed || (strncmp(d_encoder->get_input_conversion(), "pack", 4) == 0)) {
-diff --git a/gr-fec/lib/depuncture_bb_impl.cc b/gr-fec/lib/depuncture_bb_impl.cc
-index 27d00bb5b..f64dad45f 100644
---- a/gr-fec/lib/depuncture_bb_impl.cc
-+++ b/gr-fec/lib/depuncture_bb_impl.cc
-@@ -74,7 +74,9 @@ depuncture_bb_impl::depuncture_bb_impl(int puncsize, int puncpat, int delay, cha
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)d_puncsize, (uint64_t)(d_puncsize - d_puncholes));
-     set_output_multiple(d_puncsize);
--    // set_msg_handler(boost::bind(&depuncture_bb_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&depuncture_bb_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- depuncture_bb_impl::~depuncture_bb_impl() {}
-diff --git a/gr-fec/lib/puncture_bb_impl.cc b/gr-fec/lib/puncture_bb_impl.cc
-index a365d6a69..f2078d8c5 100644
---- a/gr-fec/lib/puncture_bb_impl.cc
-+++ b/gr-fec/lib/puncture_bb_impl.cc
-@@ -72,7 +72,9 @@ puncture_bb_impl::puncture_bb_impl(int puncsize, int puncpat, int delay)
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)(d_puncsize - d_puncholes), (uint64_t)d_puncsize);
-     set_output_multiple(d_puncsize - d_puncholes);
--    // set_msg_handler(boost::bind(&puncture_bb_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&puncture_bb_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- puncture_bb_impl::~puncture_bb_impl() {}
-diff --git a/gr-fec/lib/puncture_ff_impl.cc b/gr-fec/lib/puncture_ff_impl.cc
-index c95288d69..95fb649a8 100644
---- a/gr-fec/lib/puncture_ff_impl.cc
-+++ b/gr-fec/lib/puncture_ff_impl.cc
-@@ -72,7 +72,9 @@ puncture_ff_impl::puncture_ff_impl(int puncsize, int puncpat, int delay)
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)(d_puncsize - d_puncholes), (uint64_t)d_puncsize);
-     set_output_multiple(d_puncsize - d_puncholes);
--    // set_msg_handler(boost::bind(&puncture_ff_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&puncture_ff_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- puncture_ff_impl::~puncture_ff_impl() {}
-diff --git a/gr-filter/lib/freq_xlating_fir_filter_impl.cc b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-index 8ddc967ba..50ec58947 100644
---- a/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-+++ b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-@@ -72,7 +72,7 @@ freq_xlating_fir_filter_impl<IN_T, OUT_T, TAP_T>::freq_xlating_fir_filter_impl(
-         boost::bind(
-             &freq_xlating_fir_filter_impl<IN_T, OUT_T, TAP_T>::handle_set_center_freq,
-             this,
--            _1));
-+            boost::placeholders::_1));
- }
- 
- template <class IN_T, class OUT_T, class TAP_T>
-diff --git a/gr-filter/lib/mmse_resampler_cc_impl.cc b/gr-filter/lib/mmse_resampler_cc_impl.cc
-index 59f9eacfa..bdce51716 100644
---- a/gr-filter/lib/mmse_resampler_cc_impl.cc
-+++ b/gr-filter/lib/mmse_resampler_cc_impl.cc
-@@ -52,8 +52,9 @@ mmse_resampler_cc_impl::mmse_resampler_cc_impl(float phase_shift, float resamp_r
- 
-     set_inverse_relative_rate(d_mu_inc);
-     message_port_register_in(pmt::intern("msg_in"));
--    set_msg_handler(pmt::intern("msg_in"),
--                    boost::bind(&mmse_resampler_cc_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pmt::intern("msg_in"),
-+        boost::bind(&mmse_resampler_cc_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- mmse_resampler_cc_impl::~mmse_resampler_cc_impl() { delete d_resamp; }
-diff --git a/gr-filter/lib/mmse_resampler_ff_impl.cc b/gr-filter/lib/mmse_resampler_ff_impl.cc
-index 342d9f767..3d7272711 100644
---- a/gr-filter/lib/mmse_resampler_ff_impl.cc
-+++ b/gr-filter/lib/mmse_resampler_ff_impl.cc
-@@ -53,8 +53,9 @@ mmse_resampler_ff_impl::mmse_resampler_ff_impl(float phase_shift, float resamp_r
-     set_inverse_relative_rate(d_mu_inc);
- 
-     message_port_register_in(pmt::intern("msg_in"));
--    set_msg_handler(pmt::intern("msg_in"),
--                    boost::bind(&mmse_resampler_ff_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pmt::intern("msg_in"),
-+        boost::bind(&mmse_resampler_ff_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- mmse_resampler_ff_impl::~mmse_resampler_ff_impl() { delete d_resamp; }
-diff --git a/gr-qtgui/lib/const_sink_c_impl.cc b/gr-qtgui/lib/const_sink_c_impl.cc
-index 852f6ee10..04d421d03 100644
---- a/gr-qtgui/lib/const_sink_c_impl.cc
-+++ b/gr-qtgui/lib/const_sink_c_impl.cc
-@@ -69,8 +69,9 @@ const_sink_c_impl::const_sink_c_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&const_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&const_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     for (int i = 0; i < d_nconnections; i++) {
-         d_residbufs_real.push_back(
-diff --git a/gr-qtgui/lib/edit_box_msg_impl.cc b/gr-qtgui/lib/edit_box_msg_impl.cc
-index 8713aa820..39546cbf3 100644
---- a/gr-qtgui/lib/edit_box_msg_impl.cc
-+++ b/gr-qtgui/lib/edit_box_msg_impl.cc
-@@ -158,7 +158,9 @@ edit_box_msg_impl::edit_box_msg_impl(data_type_t type,
-     message_port_register_out(d_port);
-     message_port_register_in(pmt::mp("val"));
- 
--    set_msg_handler(pmt::mp("val"), boost::bind(&edit_box_msg_impl::set_value, this, _1));
-+    set_msg_handler(
-+        pmt::mp("val"),
-+        boost::bind(&edit_box_msg_impl::set_value, this, boost::placeholders::_1));
- }
- 
- edit_box_msg_impl::~edit_box_msg_impl()
-diff --git a/gr-qtgui/lib/freq_sink_c_impl.cc b/gr-qtgui/lib/freq_sink_c_impl.cc
-index 3a34df6ec..fe231699f 100644
---- a/gr-qtgui/lib/freq_sink_c_impl.cc
-+++ b/gr-qtgui/lib/freq_sink_c_impl.cc
-@@ -82,17 +82,23 @@ freq_sink_c_impl::freq_sink_c_impl(int fftsize,
- 
-     // setup bw input port
-     message_port_register_in(d_port_bw);
--    set_msg_handler(d_port_bw, boost::bind(&freq_sink_c_impl::handle_set_bw, this, _1));
-+    set_msg_handler(
-+        d_port_bw,
-+        boost::bind(&freq_sink_c_impl::handle_set_bw, this, boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&freq_sink_c_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&freq_sink_c_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&freq_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&freq_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/freq_sink_f_impl.cc b/gr-qtgui/lib/freq_sink_f_impl.cc
-index c14bfc31f..7090d8699 100644
---- a/gr-qtgui/lib/freq_sink_f_impl.cc
-+++ b/gr-qtgui/lib/freq_sink_f_impl.cc
-@@ -82,17 +82,23 @@ freq_sink_f_impl::freq_sink_f_impl(int fftsize,
- 
-     // setup bw input port
-     message_port_register_in(d_port_bw);
--    set_msg_handler(d_port_bw, boost::bind(&freq_sink_f_impl::handle_set_bw, this, _1));
-+    set_msg_handler(
-+        d_port_bw,
-+        boost::bind(&freq_sink_f_impl::handle_set_bw, this, boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&freq_sink_f_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&freq_sink_f_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&freq_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&freq_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/histogram_sink_f_impl.cc b/gr-qtgui/lib/histogram_sink_f_impl.cc
-index d16de932c..1602d1896 100644
---- a/gr-qtgui/lib/histogram_sink_f_impl.cc
-+++ b/gr-qtgui/lib/histogram_sink_f_impl.cc
-@@ -81,8 +81,9 @@ histogram_sink_f_impl::histogram_sink_f_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&histogram_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&histogram_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +1 for the PDU buffer
-     for (int i = 0; i < d_nconnections + 1; i++) {
-diff --git a/gr-qtgui/lib/sink_c_impl.cc b/gr-qtgui/lib/sink_c_impl.cc
-index d3feb9d16..73136e789 100644
---- a/gr-qtgui/lib/sink_c_impl.cc
-+++ b/gr-qtgui/lib/sink_c_impl.cc
-@@ -96,7 +96,9 @@ sink_c_impl::sink_c_impl(int fftsize,
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&sink_c_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&sink_c_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/sink_f_impl.cc b/gr-qtgui/lib/sink_f_impl.cc
-index 418b630b7..d31023a51 100644
---- a/gr-qtgui/lib/sink_f_impl.cc
-+++ b/gr-qtgui/lib/sink_f_impl.cc
-@@ -95,7 +95,9 @@ sink_f_impl::sink_f_impl(int fftsize,
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&sink_f_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&sink_f_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/time_raster_sink_b_impl.cc b/gr-qtgui/lib/time_raster_sink_b_impl.cc
-index 045c216b0..3aa503ccf 100644
---- a/gr-qtgui/lib/time_raster_sink_b_impl.cc
-+++ b/gr-qtgui/lib/time_raster_sink_b_impl.cc
-@@ -84,7 +84,9 @@ time_raster_sink_b_impl::time_raster_sink_b_impl(double samp_rate,
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
-     set_msg_handler(pmt::mp("in"),
--                    boost::bind(&time_raster_sink_b_impl::handle_pdus, this, _1));
-+                    boost::bind(&time_raster_sink_b_impl::handle_pdus,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     d_scale = 1.0f;
- 
-diff --git a/gr-qtgui/lib/time_raster_sink_f_impl.cc b/gr-qtgui/lib/time_raster_sink_f_impl.cc
-index d186f319d..b3516e5be 100644
---- a/gr-qtgui/lib/time_raster_sink_f_impl.cc
-+++ b/gr-qtgui/lib/time_raster_sink_f_impl.cc
-@@ -84,7 +84,9 @@ time_raster_sink_f_impl::time_raster_sink_f_impl(double samp_rate,
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
-     set_msg_handler(pmt::mp("in"),
--                    boost::bind(&time_raster_sink_f_impl::handle_pdus, this, _1));
-+                    boost::bind(&time_raster_sink_f_impl::handle_pdus,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     d_icols = static_cast<int>(ceil(d_cols));
-     d_tmpflt = (float*)volk_malloc(d_icols * sizeof(float), volk_get_alignment());
-diff --git a/gr-qtgui/lib/time_sink_c_impl.cc b/gr-qtgui/lib/time_sink_c_impl.cc
-index b73a1c1ad..83fbda298 100644
---- a/gr-qtgui/lib/time_sink_c_impl.cc
-+++ b/gr-qtgui/lib/time_sink_c_impl.cc
-@@ -80,7 +80,9 @@ time_sink_c_impl::time_sink_c_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&time_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&time_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +2 for the PDU message buffers
-     for (unsigned int n = 0; n < d_nconnections + 2; n++) {
-diff --git a/gr-qtgui/lib/time_sink_f_impl.cc b/gr-qtgui/lib/time_sink_f_impl.cc
-index df13998d7..dd5ed12c8 100644
---- a/gr-qtgui/lib/time_sink_f_impl.cc
-+++ b/gr-qtgui/lib/time_sink_f_impl.cc
-@@ -80,7 +80,9 @@ time_sink_f_impl::time_sink_f_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&time_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&time_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +1 for the PDU buffer
-     for (unsigned int n = 0; n < d_nconnections + 1; n++) {
-diff --git a/gr-qtgui/lib/waterfall_sink_c_impl.cc b/gr-qtgui/lib/waterfall_sink_c_impl.cc
-index fcf2ed98b..da38d32ba 100644
---- a/gr-qtgui/lib/waterfall_sink_c_impl.cc
-+++ b/gr-qtgui/lib/waterfall_sink_c_impl.cc
-@@ -118,19 +118,24 @@ waterfall_sink_c_impl::waterfall_sink_c_impl(int fftsize,
-     // setup bw input port
-     message_port_register_in(d_port_bw);
-     set_msg_handler(d_port_bw,
--                    boost::bind(&waterfall_sink_c_impl::handle_set_bw, this, _1));
-+                    boost::bind(&waterfall_sink_c_impl::handle_set_bw,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
-     set_msg_handler(d_port,
--                    boost::bind(&waterfall_sink_c_impl::handle_set_freq, this, _1));
-+                    boost::bind(&waterfall_sink_c_impl::handle_set_freq,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&waterfall_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&waterfall_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- }
- 
- waterfall_sink_c_impl::~waterfall_sink_c_impl()
-diff --git a/gr-qtgui/lib/waterfall_sink_f_impl.cc b/gr-qtgui/lib/waterfall_sink_f_impl.cc
-index aa1037a47..d4231a564 100644
---- a/gr-qtgui/lib/waterfall_sink_f_impl.cc
-+++ b/gr-qtgui/lib/waterfall_sink_f_impl.cc
-@@ -116,19 +116,24 @@ waterfall_sink_f_impl::waterfall_sink_f_impl(int fftsize,
-     // setup bw input port
-     message_port_register_in(d_port_bw);
-     set_msg_handler(d_port_bw,
--                    boost::bind(&waterfall_sink_f_impl::handle_set_bw, this, _1));
-+                    boost::bind(&waterfall_sink_f_impl::handle_set_bw,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
-     set_msg_handler(d_port,
--                    boost::bind(&waterfall_sink_f_impl::handle_set_freq, this, _1));
-+                    boost::bind(&waterfall_sink_f_impl::handle_set_freq,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&waterfall_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&waterfall_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- }
- 
- waterfall_sink_f_impl::~waterfall_sink_f_impl()
-diff --git a/gr-uhd/lib/usrp_block_impl.cc b/gr-uhd/lib/usrp_block_impl.cc
-index 4f030159f..697d633c1 100644
---- a/gr-uhd/lib/usrp_block_impl.cc
-+++ b/gr-uhd/lib/usrp_block_impl.cc
-@@ -137,12 +137,18 @@ usrp_block_impl::usrp_block_impl(const ::uhd::device_addr_t& device_addr,
-     // Set up message ports:
-     message_port_register_in(pmt::mp("command"));
-     set_msg_handler(pmt::mp("command"),
--                    boost::bind(&usrp_block_impl::msg_handler_command, this, _1));
-+                    boost::bind(&usrp_block_impl::msg_handler_command,
-+                                this,
-+                                boost::placeholders::_1));
- 
- // cuz we lazy:
--#define REGISTER_CMD_HANDLER(key, _handler) \
--    register_msg_cmd_handler(key,           \
--                             boost::bind(&usrp_block_impl::_handler, this, _1, _2, _3))
-+#define REGISTER_CMD_HANDLER(key, _handler)                          \
-+    register_msg_cmd_handler(key,                                    \
-+                             boost::bind(&usrp_block_impl::_handler, \
-+                                         this,                       \
-+                                         boost::placeholders::_1,    \
-+                                         boost::placeholders::_2,    \
-+                                         boost::placeholders::_3))
-     // Register default command handlers:
-     REGISTER_CMD_HANDLER(cmd_freq_key(), _cmd_handler_freq);
-     REGISTER_CMD_HANDLER(cmd_gain_key(), _cmd_handler_gain);
-@@ -257,11 +263,12 @@ bool usrp_block_impl::_check_mboard_sensors_locked()
-         } else if (_dev->get_clock_source(mboard_index) == "mimo") {
-             sensor_name = "mimo_locked";
-         }
--        if (not _wait_for_locked_sensor(
--                get_mboard_sensor_names(mboard_index),
--                sensor_name,
--                boost::bind(
--                    &usrp_block_impl::get_mboard_sensor, this, _1, mboard_index))) {
-+        if (not _wait_for_locked_sensor(get_mboard_sensor_names(mboard_index),
-+                                        sensor_name,
-+                                        boost::bind(&usrp_block_impl::get_mboard_sensor,
-+                                                    this,
-+                                                    boost::placeholders::_1,
-+                                                    mboard_index))) {
-             GR_LOG_WARN(
-                 d_logger,
-                 boost::format(
-diff --git a/gr-uhd/lib/usrp_source_impl.cc b/gr-uhd/lib/usrp_source_impl.cc
-index a2ff0821b..5e6bd4328 100644
---- a/gr-uhd/lib/usrp_source_impl.cc
-+++ b/gr-uhd/lib/usrp_source_impl.cc
-@@ -57,8 +57,9 @@ usrp_source_impl::usrp_source_impl(const ::uhd::device_addr_t& device_addr,
- 
-     _samp_rate = this->get_samp_rate();
-     _samps_per_packet = 1;
--    register_msg_cmd_handler(cmd_tag_key(),
--                             boost::bind(&usrp_source_impl::_cmd_handler_tag, this, _1));
-+    register_msg_cmd_handler(
-+        cmd_tag_key(),
-+        boost::bind(&usrp_source_impl::_cmd_handler_tag, this, boost::placeholders::_1));
- }
- 
- usrp_source_impl::~usrp_source_impl() {}
-diff --git a/gr-zeromq/lib/pub_msg_sink_impl.cc b/gr-zeromq/lib/pub_msg_sink_impl.cc
-index b5da7421e..957cfa411 100644
---- a/gr-zeromq/lib/pub_msg_sink_impl.cc
-+++ b/gr-zeromq/lib/pub_msg_sink_impl.cc
-@@ -62,7 +62,9 @@ pub_msg_sink_impl::pub_msg_sink_impl(char* address, int timeout, bool bind)
-     }
- 
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&pub_msg_sink_impl::handler, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&pub_msg_sink_impl::handler, this, boost::placeholders::_1));
- }
- 
- pub_msg_sink_impl::~pub_msg_sink_impl()
-diff --git a/gr-zeromq/lib/push_msg_sink_impl.cc b/gr-zeromq/lib/push_msg_sink_impl.cc
-index 4140781ab..7d07d3a30 100644
---- a/gr-zeromq/lib/push_msg_sink_impl.cc
-+++ b/gr-zeromq/lib/push_msg_sink_impl.cc
-@@ -62,7 +62,9 @@ push_msg_sink_impl::push_msg_sink_impl(char* address, int timeout, bool bind)
-     }
- 
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&push_msg_sink_impl::handler, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&push_msg_sink_impl::handler, this, boost::placeholders::_1));
- }
- 
- push_msg_sink_impl::~push_msg_sink_impl()
--- 
-2.26.2
-
diff --git a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
deleted file mode 100644
index 6b8987fa5f..0000000000
--- a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 84dea8284c521f08508bb2dcbc99db3b5d3438fd Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Thu, 27 Aug 2020 17:32:09 +0200
-Subject: [PATCH] gnuradio-runtime_pmt: dont hardcode
- INTERFACE_INCLUDE_DIRECTORIES
-
-gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
-using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.
-
-Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
-path to host system.
-
-With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
-arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
-
-By simply providing 'include', produced .cmake contains:
-INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
-instead of
-INTERFACE_INCLUDE_DIRECTORIES "/usr/include"
-
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gnuradio-runtime/lib/CMakeLists.txt     | 2 +-
- gnuradio-runtime/lib/pmt/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gnuradio-runtime/lib/CMakeLists.txt b/gnuradio-runtime/lib/CMakeLists.txt
-index 5aa90a5e1..fc32f473b 100644
---- a/gnuradio-runtime/lib/CMakeLists.txt
-+++ b/gnuradio-runtime/lib/CMakeLists.txt
-@@ -214,7 +214,7 @@ target_link_libraries(gnuradio-runtime PUBLIC
- 
- target_include_directories(gnuradio-runtime
-   PUBLIC
--    $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
-+    $<INSTALL_INTERFACE:include>
-     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
-     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/../include>
-   PRIVATE
-diff --git a/gnuradio-runtime/lib/pmt/CMakeLists.txt b/gnuradio-runtime/lib/pmt/CMakeLists.txt
-index 9fb98d0fc..6dfcd945c 100644
---- a/gnuradio-runtime/lib/pmt/CMakeLists.txt
-+++ b/gnuradio-runtime/lib/pmt/CMakeLists.txt
-@@ -33,7 +33,7 @@ target_link_libraries(gnuradio-pmt
- 
- target_include_directories(gnuradio-pmt
-   PUBLIC
--  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
-+  $<INSTALL_INTERFACE:include>
-   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../include>
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/
-   )
--- 
-2.26.2
-
diff --git a/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch b/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
deleted file mode 100644
index 034c10c5cc..0000000000
--- a/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 268b1a599304f58bd56c86ff09041b5912c24a0c Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Sun, 1 Nov 2020 17:24:36 +0100
-Subject: [PATCH] gr-qtgui: dont't add examples/c++ subdirectory when gr-analog
- is disabled
-
-gr-qtgui examples needs to have gr-analog enabled, without this dependency
-compile crash with:
-
-In file included from
-/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.cc:22:
-/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.h:24:10:
-fatal error: gnuradio/analog/noise_source.h: No such file or directory
-24 | #include <gnuradio/analog/noise_source.h>
-| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-compilation terminated.
-make[3]: *** [gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/build.make:67:
-gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/display_qt.cc.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-In file included from
-/somewhere/gnuradio/build/gr-qtgui/examples/c++/moc_display_qt.cpp:10:
-/somewhere/gnuradio/build/gr-qtgui/examples/c++/../../../../gr-qtgui/examples/c++/display_qt.h:24:10:
-fatal error: gnuradio/analog/noise_source.h: No such file or directory
-24 | #include <gnuradio/analog/noise_source.h>
-| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-compilation terminated.
-
-GR_ANALOG is not an explicit dependency of GR_QTGUI, so disable c++ examples if
-user has not selected this option.
-
-[backported from 7470a7a3771dd90defb826b464dfe62977cb1eb6]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-qtgui/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/gr-qtgui/CMakeLists.txt b/gr-qtgui/CMakeLists.txt
-index 8831f3ad9..561186fbd 100644
---- a/gr-qtgui/CMakeLists.txt
-+++ b/gr-qtgui/CMakeLists.txt
-@@ -68,7 +68,9 @@ if(ENABLE_GR_QTGUI)
- add_subdirectory(include/gnuradio/qtgui)
- add_subdirectory(lib)
- add_subdirectory(docs)
--add_subdirectory(examples/c++)
-+if (ENABLE_GR_ANALOG)
-+	add_subdirectory(examples/c++)
-+endif(ENABLE_GR_ANALOG)
- if(ENABLE_PYTHON)
-     add_subdirectory(swig)
-     add_subdirectory(python/qtgui)
--- 
-2.26.2
-
diff --git a/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch b/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
deleted file mode 100644
index 0c282b7322..0000000000
--- a/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 2c767bb260a25b415e8c9c4b3ea37280b2127cec Mon Sep 17 00:00:00 2001
-From: japm48 <japm48@users.noreply.github.com>
-Date: Fri, 10 Apr 2020 23:35:30 +0200
-Subject: [PATCH] boost: remove deprecated math/common_factor.hpp
-
-Remove deprecation warning and prefer using std::{lcm,gcd} to Boost.
-Fixes #2712.
-
-[Retrieved from:
-https://github.com/gnuradio/gnuradio/commit/2c767bb260a25b415e8c9c4b3ea37280b2127cec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .../include/gnuradio/CMakeLists.txt           |  1 +
- .../include/gnuradio/integer_math.h           | 35 +++++++++++++++++++
- gnuradio-runtime/lib/buffer.cc                | 19 ++--------
- gr-digital/lib/symbol_sync_cc_impl.cc         |  4 +--
- gr-digital/lib/symbol_sync_ff_impl.cc         |  4 +--
- 5 files changed, 43 insertions(+), 20 deletions(-)
- create mode 100644 gnuradio-runtime/include/gnuradio/integer_math.h
-
-diff --git a/gnuradio-runtime/include/gnuradio/CMakeLists.txt b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-index 8d718e87b5b..056af5d6f48 100644
---- a/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-+++ b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-@@ -31,6 +31,7 @@ install(FILES
-   gr_complex.h
-   hier_block2.h
-   high_res_timer.h
-+  integer_math.h
-   io_signature.h
-   logger.h
-   math.h
-diff --git a/gnuradio-runtime/include/gnuradio/integer_math.h b/gnuradio-runtime/include/gnuradio/integer_math.h
-new file mode 100644
-index 00000000000..15141049fa4
---- /dev/null
-+++ b/gnuradio-runtime/include/gnuradio/integer_math.h
-@@ -0,0 +1,35 @@
-+/* -*- c++ -*- */
-+/*
-+ * Copyright 2020 Free Software Foundation, Inc.
-+ *
-+ * This file is part of GNU Radio
-+ *
-+ * SPDX-License-Identifier: GPL-3.0-or-later
-+ *
-+ */
-+#ifndef INCLUDED_GR_INTEGER_MATH_H
-+#define INCLUDED_GR_INTEGER_MATH_H
-+
-+#if (__cplusplus >= 201703L)
-+
-+// Prefer C++17 goodness.
-+#include <numeric>
-+#define GR_GCD std::gcd
-+#define GR_LCM std::lcm
-+
-+#elif (BOOST_VERSION >= 105800)
-+
-+// Fallback: newer boost API (introduced in Boost 1.58.0).
-+#include <boost/integer/common_factor_rt.hpp>
-+#define GR_GCD boost::integer::gcd
-+#define GR_LCM boost::integer::lcm
-+
-+#else
-+
-+// Last resort: old deprecated boost API.
-+#include <boost/math/common_factor_rt.hpp>
-+#define GR_GCD boost::math::gcd
-+#define GR_LCM boost::math::lcm
-+
-+#endif /* __cplusplus >= 201703L */
-+#endif /* INCLUDED_GR_INTEGER_MATH_H */
-diff --git a/gnuradio-runtime/lib/buffer.cc b/gnuradio-runtime/lib/buffer.cc
-index 720c72c4ee8..46d704542b1 100644
---- a/gnuradio-runtime/lib/buffer.cc
-+++ b/gnuradio-runtime/lib/buffer.cc
-@@ -13,22 +13,13 @@
- #endif
- #include "vmcircbuf.h"
- #include <gnuradio/buffer.h>
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/math.h>
- #include <assert.h>
- #include <algorithm>
- #include <iostream>
- #include <stdexcept>
- 
--// the following header is deprecated as of Boost 1.66.0, and the
--// other API was introduced in Boost 1.58.0. Since we still support
--// Boost back to 1.54.0, use the older API if pre-1.5.80 and otherwise
--// use the newer API.
--#if (BOOST_VERSION < 105800)
--#include <boost/math/common_factor_rt.hpp>
--#else
--#include <boost/integer/common_factor_rt.hpp>
--#endif
--
- namespace gr {
- 
- static long s_buffer_count = 0; // counts for debugging storage mgmt
-@@ -68,13 +59,9 @@ static long s_buffer_reader_count = 0;
-  *
-  *     type_size * nitems == k * page_size
-  */
--static long minimum_buffer_items(long type_size, long page_size)
-+static inline long minimum_buffer_items(long type_size, long page_size)
- {
--#if (BOOST_VERSION < 105800)
--    return page_size / boost::math::gcd(type_size, page_size);
--#else
--    return page_size / boost::integer::gcd(type_size, page_size);
--#endif
-+    return page_size / GR_GCD(type_size, page_size);
- }
- 
- 
-diff --git a/gr-digital/lib/symbol_sync_cc_impl.cc b/gr-digital/lib/symbol_sync_cc_impl.cc
-index 55f85e7c6a7..55f162dc727 100644
---- a/gr-digital/lib/symbol_sync_cc_impl.cc
-+++ b/gr-digital/lib/symbol_sync_cc_impl.cc
-@@ -13,9 +13,9 @@
- #endif
- 
- #include "symbol_sync_cc_impl.h"
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/io_signature.h>
- #include <gnuradio/math.h>
--#include <boost/math/common_factor.hpp>
- #include <stdexcept>
- 
- namespace gr {
-@@ -95,7 +95,7 @@ symbol_sync_cc_impl::symbol_sync_cc_impl(enum ted_type detector_type,
-         throw std::runtime_error("unable to create interpolating_resampler_ccf");
- 
-     // Block Internal Clocks
--    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
-+    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
-     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
-     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
- 
-diff --git a/gr-digital/lib/symbol_sync_ff_impl.cc b/gr-digital/lib/symbol_sync_ff_impl.cc
-index d0ec32ab192..1172c1b4f8a 100644
---- a/gr-digital/lib/symbol_sync_ff_impl.cc
-+++ b/gr-digital/lib/symbol_sync_ff_impl.cc
-@@ -13,9 +13,9 @@
- #endif
- 
- #include "symbol_sync_ff_impl.h"
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/io_signature.h>
- #include <gnuradio/math.h>
--#include <boost/math/common_factor.hpp>
- #include <stdexcept>
- 
- namespace gr {
-@@ -97,7 +97,7 @@ symbol_sync_ff_impl::symbol_sync_ff_impl(enum ted_type detector_type,
-         throw std::runtime_error("unable to create interpolating_resampler_fff");
- 
-     // Block Internal Clocks
--    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
-+    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
-     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
-     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
- 
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 103175946c..fd693c1851 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -15,19 +15,19 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LOG4CPP
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_VOLK
 	help
 	  GNU Radio is a free & open-source software development
@@ -80,7 +80,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
-	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_PYBIND
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Enable python component
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 90343cf385..21ca6864e4 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624  gnuradio-3.8.2.0.tar.gz
+sha256  957108a67ec75d99adaad8f3b10be8ae08760a9cef0b659a5c815a4e33898a75  gnuradio-3.10.3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index e36dce081c..7768a811ef 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.8.2.0
-GNURADIO_SITE = https://github.com/gnuradio/gnuradio/releases/download/v$(GNURADIO_VERSION)
+GNURADIO_VERSION = 3.10.3.0
+GNURADIO_SITE = $(call github,gnuradio,gnuradio,v$(GNURADIO_VERSION))
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
-	host-python-mako \
-	host-python-six \
-	host-swig \
 	boost \
 	log4cpp \
 	gmp \
+	spdlog \
 	volk
 
 GNURADIO_CONF_OPTS = \
@@ -115,7 +112,8 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python3
+GNURADIO_DEPENDENCIES += python3 python-pybind \
+	host-python-numpy host-python-packaging
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
