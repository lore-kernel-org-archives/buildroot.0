Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A9ECD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A91B8528C;
	Sat, 30 May 2026 15:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjnR2zrX2aaJ; Sat, 30 May 2026 15:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876318539A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780155463;
	bh=Lv05B68oPDL+A7p49ibSLM3fb2NAh+ACtT9riE0d19A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eXEaZSFI6Dq4pzPaLMaqkUi74WsKIBVF2HJ+dHu0ML8g4Z2+rbViFfno1uBjITeyn
	 QXLM9hP7bDqXMR+sllSWWHCl7OgVv3H9wGnORrFvRAzahA/kXpoi+j6S7eS8LEJenB
	 7oskJip7B0QEiZN3BBl78GbX9vrYO9CILJvuJwwt0KgcKyTEWxPr/akNiXR7EEzAcK
	 untwZhEz6zr49tasCgsZj0j8CMsom8InL94/IjYSJ5k+BZBCJkb1hmkLVsK3fCLPVj
	 TJVzXWkGahJIi2gyPKuXaHgmprI5xH7BA6COsiLtIWCad+v25UxQFaljPNIkIs5wFs
	 mENejuWedEd2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876318539A;
	Sat, 30 May 2026 15:37:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 023BC218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83DA6F5A6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2z0C4Xybh_9 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 099656F5A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099656F5A1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01AAD87529; Sat, 30 May 2026 15:37:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28f9f29b5e4b79e9a7061066b3d22656bfd9bbc3
X-Git-Newrev: 17c9deb115cd216aa2c6a6f625327c7ac9dfb83a
X-Patchwork-Hint: ignore
Message-Id: <20260530153726.01AAD87529@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: hint at missing
 Buildroot host package on a specific error
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17c9deb115cd216aa2c6a6f625327c7ac9dfb83a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
