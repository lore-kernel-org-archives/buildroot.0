Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6740CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22B560A83;
	Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMU7z9U2eJ0r; Fri,  5 Jun 2026 12:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A540060E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663214;
	bh=59v6T+DBDJ0Kuemns3E4+L9+E1nFygh5Vam1IPoMPbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IMvg6DC/VZbNHvg5juiNNJVzcCu2244G28uQG71O3S+CUsoWvr05uEvlqTEJATyDZ
	 xejdAi9NicVgKOzLX6naZLfDvR4emov6+nS9ZEaX/e44+FmmZt9tj4lBZErzJKaTq2
	 MobMnzZ/8XqDkJ12551B7RH5JrOUY9IznsXP/jwuL9BL6IYCYYSbOwBJNShzW/Sxye
	 GXlK5k03nYYN1yeqp8cq4YBzAZSm1A+KlXAuxXGewrE/knGJD+OnDKkBlw9XGdh6dI
	 2OpNBtDDImBfXtncnL7prDM9MnKrRvt7YJ4wCO4RZL2fzVwtgI4u86CgLX3d6okE+J
	 J0sM+4bTR76Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A540060E45;
	Fri,  5 Jun 2026 12:40:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3C53B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B5FD41051
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgOvAXLxZBh0 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44F464106D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44F464106D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F3DA87B03; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:07:55 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ce4a8e5d075937cd59f161d718ee3f1001e18222
X-Git-Newrev: 5b4f9325eb418580f58bea56ec0d3980355872af
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.6F3DA87B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
 hint at missing Buildroot host package on a specific error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b4f9325eb418580f58bea56ec0d3980355872af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Since last commit, utils/generate-cyclonedx can now be used with
Buildroot host tools, provided the user either externally install the
SPDX schema in the DL_DIR themselves or have
BR2_PACKAGE_HOST_PYTHON3_SSL and BR2_PACKAGE_HOST_CA_CERTIFICATES both
enabled. If the latter is missing, Python will complain with:

Traceback (most recent call last):
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1321, in do_open
    h.request(req.get_method(), req.selector, req.data, headers,
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
              encode_chunked=req.has_header('Transfer-encoding'))
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1358, in request
    self._send_request(method, url, body, headers, encode_chunked)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1404, in _send_request
    self.endheaders(body, encode_chunked=encode_chunked)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1353, in endheaders
    self._send_output(message_body, encode_chunked=encode_chunked)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1113, in _send_output
    self.send(msg)
    ~~~~~~~~~^^^^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1057, in send
    self.connect()
    ~~~~~~~~~~~~^^
  File "/buildroot/build/host/lib/python3.14/http/client.py", line 1499, in connect
    self.sock = self._context.wrap_socket(self.sock,
                ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
                                          server_hostname=server_hostname)
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/ssl.py", line 455, in wrap_socket
    return self.sslsocket_class._create(
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
        sock=sock,
        ^^^^^^^^^^
    ...<5 lines>...
        session=session
        ^^^^^^^^^^^^^^^
    )
    ^
  File "/buildroot/build/host/lib/python3.14/ssl.py", line 1076, in _create
    self.do_handshake()
    ~~~~~~~~~~~~~~~~~^^
  File "/buildroot/build/host/lib/python3.14/ssl.py", line 1372, in do_handshake
    self._sslobj.do_handshake()
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^
ssl.SSLCertVerificationError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1081)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/buildroot/utils/generate-cyclonedx", line 53, in <module>
    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 212, in urlretrieve
    with contextlib.closing(urlopen(url, data)) as fp:
                            ~~~~~~~^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 187, in urlopen
    return opener.open(url, data, timeout)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 487, in open
    response = self._open(req, data)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 504, in _open
    result = self._call_chain(self.handle_open, protocol, protocol +
                              '_open', req)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 464, in _call_chain
    result = func(*args)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1369, in https_open
    return self.do_open(http.client.HTTPSConnection, req,
           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                        context=self._context)
                        ^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1324, in do_open
    raise URLError(err)
urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1081)>

Provide some hint as to what could be missing from Buildroot host.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 17c9deb115cd216aa2c6a6f625327c7ac9dfb83a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 7cfeefbc5b..11edc05d80 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -52,7 +52,12 @@ if not SPDX_SCHEMA_PATH.exists():
 
     # Download the CycloneDX SPDX schema JSON, and cache it locally
     cyclonedxpath.mkdir(parents=True, exist_ok=True)
-    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
+    try:
+        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
+    except urllib.error.URLError as e:
+        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
+            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
+        raise e
 
 try:
     with SPDX_SCHEMA_PATH.open() as f:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
