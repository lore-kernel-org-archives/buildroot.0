Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15DAC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E949406F6;
	Wed,  4 Jun 2025 18:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FVTBaPqunoX; Wed,  4 Jun 2025 18:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730EF406F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730EF406F7;
	Wed,  4 Jun 2025 18:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E57FDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 700E4809B9
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCLcaMA2njCt for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1360E80D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1360E80D35
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1360E80D35
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:26:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6FDD1C010A; Wed,  4 Jun 2025 20:26:16 +0200 (CEST)
Message-ID: <0ce022f4-6c61-4842-b6f6-d4d37aaa2716@rnout.be>
Date: Wed, 4 Jun 2025 20:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be
References: <20250519150314.4117224-1-titouan.christophe@mind.be>
 <20250521221047.1297537-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250521221047.1297537-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MABJzHm5S0eMQm+VRqsCwqoSRxEukY1u+6mGHx+kpow=;
 b=PlERWWoGqw7Nm4g9UxFFiP+Ua5nTFDtmxpwuDNirZCf5H9AGKy+XRXrae7H7lDvtOctVvY
 42dHQJvED0SIJEzwHSLU2liejiJRr0YzX1pN+ds3ZjDaxU3p1LgroSWir0pP4pK2Kw68xS
 8DNBnQWOAfxe6pZQ7hcf0oCqxmMYr71I0nB7SNPecogOk2dQV+IA1R704MX4L6b4tPt2Mv
 F7mBxApNFGYL/Abnw6y5kN5q3YpOp3TdkrdLdbHTX8hZ42Au2B3psyyqxp4i2+FVyz5UaN
 aCpVXgCefxpDAToFjUIv6WePCsNzEdkmu7nL7Gxrqs1gldmsJP50doCSt84svw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PlERWWoG
Subject: Re: [Buildroot] [PATCH v2 for 2025.02.x] package/python-tornado:
 apply security patch for CVE-2025-47287
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2025 00:10, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> - CVE-2025-47287: When Tornado's ``multipart/form-data`` parser encounters
>                    certain errors, it logs a warning but continues trying to
>                    parse the remainder of the data. This allows remote
>                    attackers to generate an extremely high volume of logs,
>                    constituting a DoS attack.
> 
> This is an alternative to the version bump (6.4.2 -> 6.5), if we don't want
> to include a minor version bump into Buildroot LTS 2025.02.x.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> - Fix patch not applying correctly
> ---
>   ...l-raise-errors-instead-of-logging-in.patch | 234 ++++++++++++++++++
>   package/python-tornado/python-tornado.mk      |   3 +
>   2 files changed, 237 insertions(+)
>   create mode 100644 package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> 
> diff --git a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> new file mode 100644
> index 0000000000..85f5852bf7
> --- /dev/null
> +++ b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> @@ -0,0 +1,234 @@
> +From cc61050e8f26697463142d99864b562e8470b41d Mon Sep 17 00:00:00 2001
> +From: Ben Darnell <ben@bendarnell.com>
> +Date: Thu, 8 May 2025 13:29:43 -0400
> +Subject: [PATCH] httputil: Raise errors instead of logging in
> + multipart/form-data parsing
> +
> +We used to continue after logging an error, which allowed repeated
> +errors to spam the logs. The error raised here will still be logged,
> +but only once per request, consistent with other error handling in
> +Tornado.
> +
> +Upstream: https://github.com/tornadoweb/tornado/commit/b39b892bf78fe8fea01dd45199aa88307e7162f3
> +
> +CVE: CVE-2025-47287
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + tornado/httputil.py             | 30 +++++++++++-------------------
> + tornado/test/httpserver_test.py |  4 ++--
> + tornado/test/httputil_test.py   | 13 ++++++++-----
> + tornado/web.py                  | 17 +++++++++++++----
> + 4 files changed, 34 insertions(+), 30 deletions(-)
> +
> +diff --git a/tornado/httputil.py b/tornado/httputil.py
> +index 7044aca02..ef460985e 100644
> +--- a/tornado/httputil.py
> ++++ b/tornado/httputil.py
> +@@ -34,7 +34,6 @@
> + from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
> +
> + from tornado.escape import native_str, parse_qs_bytes, utf8
> +-from tornado.log import gen_log
> + from tornado.util import ObjectDict, unicode_type
> +
> +
> +@@ -884,25 +883,22 @@ def parse_body_arguments(
> +     """
> +     if content_type.startswith("application/x-www-form-urlencoded"):
> +         if headers and "Content-Encoding" in headers:
> +-            gen_log.warning(
> +-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
> ++            raise HTTPInputError(
> ++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
> +             )
> +-            return
> +         try:
> +             # real charset decoding will happen in RequestHandler.decode_argument()
> +             uri_arguments = parse_qs_bytes(body, keep_blank_values=True)
> +         except Exception as e:
> +-            gen_log.warning("Invalid x-www-form-urlencoded body: %s", e)
> +-            uri_arguments = {}
> ++            raise HTTPInputError("Invalid x-www-form-urlencoded body: %s" % e) from e
> +         for name, values in uri_arguments.items():
> +             if values:
> +                 arguments.setdefault(name, []).extend(values)
> +     elif content_type.startswith("multipart/form-data"):
> +         if headers and "Content-Encoding" in headers:
> +-            gen_log.warning(
> +-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
> ++            raise HTTPInputError(
> ++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
> +             )
> +-            return
> +         try:
> +             fields = content_type.split(";")
> +             for field in fields:
> +@@ -911,9 +907,9 @@ def parse_body_arguments(
> +                     parse_multipart_form_data(utf8(v), body, arguments, files)
> +                     break
> +             else:
> +-                raise ValueError("multipart boundary not found")
> ++                raise HTTPInputError("multipart boundary not found")
> +         except Exception as e:
> +-            gen_log.warning("Invalid multipart/form-data: %s", e)
> ++            raise HTTPInputError("Invalid multipart/form-data: %s" % e) from e
> +
> +
> + def parse_multipart_form_data(
> +@@ -942,26 +938,22 @@ def parse_multipart_form_data(
> +         boundary = boundary[1:-1]
> +     final_boundary_index = data.rfind(b"--" + boundary + b"--")
> +     if final_boundary_index == -1:
> +-        gen_log.warning("Invalid multipart/form-data: no final boundary")
> +-        return
> ++        raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
> +     parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
> +     for part in parts:
> +         if not part:
> +             continue
> +         eoh = part.find(b"\r\n\r\n")
> +         if eoh == -1:
> +-            gen_log.warning("multipart/form-data missing headers")
> +-            continue
> ++            raise HTTPInputError("multipart/form-data missing headers")
> +         headers = HTTPHeaders.parse(part[:eoh].decode("utf-8"))
> +         disp_header = headers.get("Content-Disposition", "")
> +         disposition, disp_params = _parse_header(disp_header)
> +         if disposition != "form-data" or not part.endswith(b"\r\n"):
> +-            gen_log.warning("Invalid multipart/form-data")
> +-            continue
> ++            raise HTTPInputError("Invalid multipart/form-data")
> +         value = part[eoh + 4 : -2]
> +         if not disp_params.get("name"):
> +-            gen_log.warning("multipart/form-data value missing name")
> +-            continue
> ++            raise HTTPInputError("multipart/form-data missing name")
> +         name = disp_params["name"]
> +         if disp_params.get("filename"):
> +             ctype = headers.get("Content-Type", "application/unknown")
> +diff --git a/tornado/test/httpserver_test.py b/tornado/test/httpserver_test.py
> +index 570cb64ca..f197cfef8 100644
> +--- a/tornado/test/httpserver_test.py
> ++++ b/tornado/test/httpserver_test.py
> +@@ -1148,9 +1148,9 @@ def test_gzip_unsupported(self):
> +         # Gzip support is opt-in; without it the server fails to parse
> +         # the body (but parsing form bodies is currently just a log message,
> +         # not a fatal error).
> +-        with ExpectLog(gen_log, "Unsupported Content-Encoding"):
> ++        with ExpectLog(gen_log, ".*Unsupported Content-Encoding"):
> +             response = self.post_gzip("foo=bar")
> +-        self.assertEqual(json_decode(response.body), {})
> ++        self.assertEqual(response.code, 400)
> +
> +
> + class StreamingChunkSizeTest(AsyncHTTPTestCase):
> +diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
> +index 30fbec4d7..7a09beaa3 100644
> +--- a/tornado/test/httputil_test.py
> ++++ b/tornado/test/httputil_test.py
> +@@ -12,7 +12,6 @@
> + )
> + from tornado.escape import utf8, native_str
> + from tornado.log import gen_log
> +-from tornado.testing import ExpectLog
> + from tornado.test.util import ignore_deprecation
> +
> + import copy
> +@@ -195,7 +194,9 @@ def test_missing_headers(self):
> +             b"\n", b"\r\n"
> +         )
> +         args, files = form_data_args()
> +-        with ExpectLog(gen_log, "multipart/form-data missing headers"):
> ++        with self.assertRaises(
> ++            HTTPInputError, msg="multipart/form-data missing headers"
> ++        ):
> +             parse_multipart_form_data(b"1234", data, args, files)
> +         self.assertEqual(files, {})
> +
> +@@ -209,7 +210,7 @@ def test_invalid_content_disposition(self):
> +             b"\n", b"\r\n"
> +         )
> +         args, files = form_data_args()
> +-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
> ++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
> +             parse_multipart_form_data(b"1234", data, args, files)
> +         self.assertEqual(files, {})
> +
> +@@ -222,7 +223,7 @@ def test_line_does_not_end_with_correct_line_break(self):
> +             b"\n", b"\r\n"
> +         )
> +         args, files = form_data_args()
> +-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
> ++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
> +             parse_multipart_form_data(b"1234", data, args, files)
> +         self.assertEqual(files, {})
> +
> +@@ -236,7 +237,9 @@ def test_content_disposition_header_without_name_parameter(self):
> +             b"\n", b"\r\n"
> +         )
> +         args, files = form_data_args()
> +-        with ExpectLog(gen_log, "multipart/form-data value missing name"):
> ++        with self.assertRaises(
> ++            HTTPInputError, msg="multipart/form-data value missing name"
> ++        ):
> +             parse_multipart_form_data(b"1234", data, args, files)
> +         self.assertEqual(files, {})
> +
> +diff --git a/tornado/web.py b/tornado/web.py
> +index 0303f547e..2f702d648 100644
> +--- a/tornado/web.py
> ++++ b/tornado/web.py
> +@@ -1801,6 +1801,14 @@ async def _execute(
> +         try:
> +             if self.request.method not in self.SUPPORTED_METHODS:
> +                 raise HTTPError(405)
> ++
> ++            # If we're not in stream_request_body mode, this is the place where we parse the body.
> ++            if not _has_stream_request_body(self.__class__):
> ++                try:
> ++                    self.request._parse_body()
> ++                except httputil.HTTPInputError as e:
> ++                    raise HTTPError(400, "Invalid body: %s" % e) from e
> ++
> +             self.path_args = [self.decode_argument(arg) for arg in args]
> +             self.path_kwargs = dict(
> +                 (k, self.decode_argument(v, name=k)) for (k, v) in kwargs.items()
> +@@ -1992,7 +2000,7 @@ def _has_stream_request_body(cls: Type[RequestHandler]) -> bool:
> +
> +
> + def removeslash(
> +-    method: Callable[..., Optional[Awaitable[None]]]
> ++    method: Callable[..., Optional[Awaitable[None]]],
> + ) -> Callable[..., Optional[Awaitable[None]]]:
> +     """Use this decorator to remove trailing slashes from the request path.
> +
> +@@ -2021,7 +2029,7 @@ def wrapper(  # type: ignore
> +
> +
> + def addslash(
> +-    method: Callable[..., Optional[Awaitable[None]]]
> ++    method: Callable[..., Optional[Awaitable[None]]],
> + ) -> Callable[..., Optional[Awaitable[None]]]:
> +     """Use this decorator to add a missing trailing slash to the request path.
> +
> +@@ -2445,8 +2453,9 @@ def finish(self) -> None:
> +         if self.stream_request_body:
> +             future_set_result_unless_cancelled(self.request._body_future, None)
> +         else:
> ++            # Note that the body gets parsed in RequestHandler._execute so it can be in
> ++            # the right exception handler scope.
> +             self.request.body = b"".join(self.chunks)
> +-            self.request._parse_body()
> +             self.execute()
> +
> +     def on_connection_close(self) -> None:
> +@@ -3332,7 +3341,7 @@ def transform_chunk(self, chunk: bytes, finishing: bool) -> bytes:
> +
> +
> + def authenticated(
> +-    method: Callable[..., Optional[Awaitable[None]]]
> ++    method: Callable[..., Optional[Awaitable[None]]],
> + ) -> Callable[..., Optional[Awaitable[None]]]:
> +     """Decorate methods with this to require that the user be logged in.
> +
> diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
> index 45883b844d..0a33a57ed4 100644
> --- a/package/python-tornado/python-tornado.mk
> +++ b/package/python-tornado/python-tornado.mk
> @@ -13,4 +13,7 @@ PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
>   PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
>   PYTHON_TORNADO_SETUP_TYPE = setuptools
>   
> +# 0001-httputil-raise-errors-instead-of-logging-in.patch
> +PYTHON_TORNADO_IGNORE_CVES += CVE-2025-47287
> +
>   $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
