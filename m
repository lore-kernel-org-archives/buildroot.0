Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE557CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C728470B;
	Fri, 15 May 2026 17:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5-_rt4twSjY; Fri, 15 May 2026 17:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3528D84692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867233;
	bh=ashpoC7u224/7Yx1sQmGQ2KWiOgNw5mYfH35LR+TmSw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=am9ovWNJOciEyP4rEDu4kcs/+KBFvAVrCjySY6pTX8HmUgLmVFO3JMOtd9+ZyY/0Z
	 BTHHx1hsy7LmOZEGn/u8InMSvfLxf2+V06KuC3V9X6mR1Njd3GHuBJ5fs+v8LBpgwu
	 /0HVOmkj5suIiSoRF2oMbIfzi9X+f8XOLvpk54d5qnSN+QFR3ZbtkgOsMe7Uu7YRk+
	 8fbu18LElklVwacCdYPS4+w0P1i7hq88/03EzyS+C0l35TvxuR4S6ReDGNp3FiMW1B
	 kwesF4LYUF6sbI+RMvAFWbzCCC9lTE830rbato/aPSks4ADAi1KWclQsie8YSiW7a9
	 urvl5ojhB5fdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3528D84692;
	Fri, 15 May 2026 17:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E543623F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D60E461623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5aW2w9Y3111 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48BF961544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48BF961544
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48BF961544
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so192565e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867207; x=1779472007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z/sudlEeisy5s20HyvcCUAOHXC5+nfI/A2usTAWAXyM=;
 b=dhiB97H51L3Tn9iCoiplcYPS5c8PdUNFV4kDTfTHkiZrcU4bp49pTfCI6Tu66/ZqMq
 JEUbbWu80QSMq8W91l/G/ypBMt/lZURxbSmgCXOhL2f1Js37FJv9GpJdSfSdlDQ9PBAP
 lH3hxVfMtX00iEZ8mELHDqG4MoxiILmjJVr5DLR5dufs6zzye8UBAZ0wYbA5W2DTK0ez
 EfjWzQ/y9nZLkWbWOCKa8u5op/Np+g3JjQNdFcTcUsicIzx40wLmzZ5RDi24Vmwmjeez
 mBJLJq7sAKCg5iioYi6K9CcY6OJ848QwGx20UfPtxn3/3IUpmWhf7FnkrhsKFeTL1DZY
 9hXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oPghIvpcKAX1zCa8JTq/25kKu8+abPBX0GMAR81aPx6BmjcTeWN5c8lQAnXQKNTRLuMP3ULQRZAA=@buildroot.org
X-Gm-Message-State: AOJu0YyQikmhGiP1bXbeCIaQInEiUlDQgOaQOkbOQkW3YIuMi7eNZ8Dk
 Pj//zv9KkY17Usz9BshNYphnqNFhsjxjVDr7Db3vTF3IWykzJiE/sp9bmioff2G5uyzQX/XVNsB
 1BYiM
X-Gm-Gg: Acq92OEnUP5rF3y/PJiSxrSpLMWGvS/JwnGpwx3SXDkg4uXf2shkUhMrzdPDaS1Ud+j
 uJheIg8EP1oPiTfL+FeRcmGA4PdPybuS/9VTJy45zRPXZq7vKbzWZRvx6FJ9D7EiJNZgPZR4IeH
 vWrNm86XhudnComfSoML0AX+ngyXBBoEljNJL0Y2qdadSN7Jk3K0r1r7SSepqix8w3NQBD9a3XH
 J5lo8+RSfFujf7netwPcNu4uXuobM03ItTiYfS1J+CVAr0ovvwrd/Gi371XGb1rzCbCVdbEwfiC
 Z/dAn4gixANa0x6xIhxDW6V9ffKvlNyWN3tkh55ZKie6cf0hKGrByzjd71EOpPy2BzCLXCid435
 b3xCDiextC9y/M9M+O2vtxA2TtBMQdKgaPwIJ7Q7BTi5HBNuF+hjHHybpb51uBmGYzGN9r5B9/8
 h8pgDo0hdZPUM/tdoa3+hMCBTRaeTxltWerJ3SqBohdwFI
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id
 5b1f17b1804b1-48fe4dac5efmr69028685e9.4.1778867207036; 
 Fri, 15 May 2026 10:46:47 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feab26ed9sm30203075e9.2.2026.05.15.10.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:46 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:46 +0200
Message-ID: <20260515174646.530698-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506083350.3959360-3-buildroot@bubu1.eu>
References: <20260506083350.3959360-3-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867207; x=1779472007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/sudlEeisy5s20HyvcCUAOHXC5+nfI/A2usTAWAXyM=;
 b=S3AIPAC9KNqyMMocvDKfJMtvfwiANduW6lHtC0T6eb/B1068LB97DBW/lcC2WgQ+8p
 M9VhHqx0YKNT65puVvujBtm96mZBohl5OZnG9mmzvcY5M30CQ0O9mwD+kaiVIkXQZmtG
 /TQFIZW0apygwd3v6EVo/sj9SSbv8+88MkzJOXXt4QAXLonZlFx2iETsCrC5Sh7k2qg5
 uWdunQOcj+0O2VQEbj6uq99t/FohZ6wK72KrJYblrMYrkI+BuINmUTKVWwiwQB+WFx5h
 ZsYhlvyicZ6u9XjHL5jR3NA0bSdW0tTQvxftFeJXgF6zduiO+Vo86TS7V7BD+xxCWXrS
 igVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S3AIPAC9
Subject: Re: [Buildroot] [PATCH 3/3] package/gcc: fix gcc-13 build with host
 gcc 16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backport 2 patches from upstream maintenance branch. Same fixes as
> required for gcc-14.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 261 ++++++++++++++++++
>  ...am-and-memory-include-above-safe-cty.patch |  79 ++++++
>  2 files changed, 340 insertions(+)
>  create mode 100644 package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
>  create mode 100644 package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> 
> diff --git a/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
> new file mode 100644
> index 0000000000..e1d6b5eb32
> --- /dev/null
> +++ b/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
> @@ -0,0 +1,261 @@
> +From 51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelinek <jakub@redhat.com>
> +Date: Fri, 21 Nov 2025 16:25:58 +0100
> +Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> +
> +The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
> +and c++26.
> +
> +I see the u8 string literals are mixed e.g. with strerror, so in
> +-fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
> +the u8 literals everywhere are worth it either.
> +
> +2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> +
> +	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
> +	char in argument type.
> +	(MessageBuffer::Space): Revert 2025-11-15 change.
> +	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
> +	with char8_t const * type of first argument.
> +	(Packet::Packet): Similarly for first argument.
> +	* client.cc (CommunicationError, Client::ProcessResponse,
> +	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> +	IncludeTranslateResponse): Cast u8 string literals to (const char *)
> +	where needed.
> +	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> +
> +(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> +Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54
> +---
> + libcody/client.cc | 36 +++++++++++++++++++-----------------
> + libcody/cody.hh   | 22 ++++++++++++++++++++++
> + libcody/server.cc | 28 ++++++++++++++--------------
> + 3 files changed, 55 insertions(+), 31 deletions(-)
> +
> +diff --git a/libcody/client.cc b/libcody/client.cc
> +index ae69d190cb7..147fecdbe50 100644
> +--- a/libcody/client.cc
> ++++ b/libcody/client.cc
> +@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> + 
> + static Packet CommunicationError (int err)
> + {
> +-  std::string e {u8"communication error:"};
> ++  std::string e {(const char *) u8"communication error:"};
> +   e.append (strerror (err));
> + 
> +   return Packet (Client::PC_ERROR, std::move (e));
> +@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
> +     {
> +       if (e == EINVAL)
> + 	{
> +-	  std::string msg (u8"malformed string '");
> ++	  std::string msg ((const char *) u8"malformed string '");
> + 	  msg.append (words[0]);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  return Packet (Client::PC_ERROR, std::move (msg));
> + 	}
> +       else
> +-	return Packet (Client::PC_ERROR, u8"missing response");
> ++	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
> +     }
> + 
> +   Assert (!words.empty ());
> +-  if (words[0] == u8"ERROR")
> ++  if (words[0] == (const char *) u8"ERROR")
> +     return Packet (Client::PC_ERROR,
> +-		   words.size () == 2 ? words[1]: u8"malformed error response");
> ++		   words.size () == 2 ? words[1]
> ++		   : (const char *) u8"malformed error response");
> + 
> +   if (isLast && !read.IsAtEnd ())
> +     return Packet (Client::PC_ERROR,
> +-		   std::string (u8"unexpected extra response"));
> ++		   std::string ((const char *) u8"unexpected extra response"));
> + 
> +   Assert (code < Detail::RC_HWM);
> +   Packet result (responseTable[code] (words));
> +   result.SetRequest (code);
> +   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
> +     {
> +-      std::string msg {u8"malformed response '"};
> ++      std::string msg {(const char *) u8"malformed response '"};
> + 
> +       read.LexedLine (msg);
> +-      msg.append (u8"'");
> ++      msg.append ((const char *) u8"'");
> +       result.GetString () = std::move (msg);
> +     }
> +   else if (result.GetCode () == Client::PC_CONNECT)
> +@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
> + 			  size_t alen, size_t ilen)
> + {
> +   write.BeginLine ();
> +-  write.AppendWord (u8"HELLO");
> ++  write.AppendWord ((const char *) u8"HELLO");
> +   write.AppendInteger (Version);
> +   write.AppendWord (agent, true, alen);
> +   write.AppendWord (ident, true, ilen);
> +@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
> + // HELLO $version $agent [$flags]
> + Packet ConnectResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
> ++  if (words[0] == (const char *) u8"HELLO"
> ++      && (words.size () == 3 || words.size () == 4))
> +     {
> +       char *eptr;
> +       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
> +@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> + // PATHNAME $dir | ERROR
> + Packet PathnameResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"PATHNAME" && words.size () == 2)
> ++  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
> +     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> + 
> +   return Packet (Client::PC_ERROR, u8"");
> +@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
> + // OK or ERROR
> + Packet OKResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"OK")
> ++  if (words[0] == (const char *) u8"OK")
> +     return Packet (Client::PC_OK);
> +   else
> +     return Packet (Client::PC_ERROR,
> +@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
> + // PATHNAME $cmifile
> + Packet IncludeTranslateResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"BOOL" && words.size () == 2)
> ++  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
> +     {
> +-      if (words[1] == u8"FALSE")
> +-	return Packet (Client::PC_BOOL, 0);
> +-      else if (words[1] == u8"TRUE")
> ++      if (words[1] == (const char *) u8"FALSE")
> ++	return Packet (Client::PC_BOOL);
> ++      else if (words[1] == (const char *) u8"TRUE")
> + 	return Packet (Client::PC_BOOL, 1);
> +       else
> + 	return Packet (Client::PC_ERROR, u8"");
> +diff --git a/libcody/cody.hh b/libcody/cody.hh
> +index 789ce9e70b7..93bce93aa94 100644
> +--- a/libcody/cody.hh
> ++++ b/libcody/cody.hh
> +@@ -47,12 +47,21 @@ namespace Detail  {
> + 
> + // C++11 doesn't have utf8 character literals :(
> + 
> ++#if __cpp_char8_t >= 201811
> ++template<unsigned I>
> ++constexpr char S2C (char8_t const (&s)[I])
> ++{
> ++  static_assert (I == 2, "only single octet strings may be converted");
> ++  return s[0];
> ++}
> ++#else
> + template<unsigned I>
> + constexpr char S2C (char const (&s)[I])
> + {
> +   static_assert (I == 2, "only single octet strings may be converted");
> +   return s[0];
> + }
> ++#endif
> + 
> + /// Internal buffering class.  Used to concatenate outgoing messages
> + /// and Lex incoming ones.
> +@@ -123,6 +132,13 @@ public:
> +       Space ();
> +     Append (str, maybe_quote, len);
> +   }
> ++#if __cpp_char8_t >= 201811
> ++  void AppendWord (char8_t const *str, bool maybe_quote = false,
> ++		   size_t len = ~size_t (0))
> ++  {
> ++    AppendWord ((const char *) str, maybe_quote, len);
> ++  }
> ++#endif
> +   /// Add a word as with AppendWord
> +   /// @param str the string to append
> +   /// @param maybe_quote string might need quoting, as for Append
> +@@ -264,6 +280,12 @@ public:
> +     : string (s), cat (STRING), code (c)
> +   {
> +   }
> ++#if __cpp_char8_t >= 201811
> ++  Packet (unsigned c, const char8_t *s)
> ++    : string ((const char *) s), cat (STRING), code (c)
> ++  {
> ++  }
> ++#endif
> +   Packet (unsigned c, std::vector<std::string> &&v)
> +     : vector (std::move (v)), cat (VECTOR), code (c)
> +   {
> +diff --git a/libcody/server.cc b/libcody/server.cc
> +index e2fa069bb93..c18469fae84 100644
> +--- a/libcody/server.cc
> ++++ b/libcody/server.cc
> +@@ -36,12 +36,12 @@ static RequestPair
> +   const requestTable[Detail::RC_HWM] =
> +   {
> +     // Same order as enum RequestCode
> +-    RequestPair {u8"HELLO", nullptr},
> +-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> +-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> +-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> +-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> +-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> ++    RequestPair {(const char *) u8"HELLO", nullptr},
> ++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> ++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
> ++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
> ++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
> ++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> +   };
> + }
> + 
> +@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> + 	  std::string msg;
> + 
> + 	  if (err > 0)
> +-	    msg = u8"error processing '";
> ++	    msg = (const char *) u8"error processing '";
> + 	  else if (ix >= Detail::RC_HWM)
> +-	    msg = u8"unrecognized '";
> ++	    msg = (const char *) u8"unrecognized '";
> + 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
> +-	    msg = u8"already connected '";
> ++	    msg = (const char *) u8"already connected '";
> + 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
> +-	    msg = u8"not connected '";
> ++	    msg = (const char *) u8"not connected '";
> + 	  else
> +-	    msg = u8"malformed '";
> ++	    msg = (const char *) u8"malformed '";
> + 
> + 	  read.LexedLine (msg);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  if (err > 0)
> + 	    {
> +-	      msg.append (u8" ");
> ++	      msg.append ((const char *) u8" ");
> + 	      msg.append (strerror (err));
> + 	    }
> + 	  resolver->ErrorResponse (this, std::move (msg));
> +@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> +     return nullptr;
> + 
> +   if (words.size () == 3)
> +-    words.emplace_back (u8"");
> ++    words.emplace_back ((const char *) u8"");
> +   unsigned version = ParseUnsigned (words[1]);
> +   if (version == ~0u)
> +     return nullptr;
> +-- 
> +2.54.0
> +
> diff --git a/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> new file mode 100644
> index 0000000000..3b12747d68
> --- /dev/null
> +++ b/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> @@ -0,0 +1,79 @@
> +From 9239757a9c6e3a6e8d94d56803329d556ec914d7 Mon Sep 17 00:00:00 2001
> +From: Andrew Pinski <quic_apinski@quicinc.com>
> +Date: Mon, 25 Nov 2024 14:03:27 -0800
> +Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
> + [PR124830]
> +
> +This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
> +the <memory> include to fix build issues with a C++20 host compiler.
> +
> +sstream in some versions of libstdc++ include locale which might not have been
> +included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
> +c++ header files needed to be included before hand as comment in system.h says:
> +/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
> +   poisoning the ctype macros through safe-ctype.h */
> +
> +I don't understand how it was working before when memory was included after
> +safe-ctype.h rather than before. But this makes sstream consistent with the
> +other C++ headers.
> +
> +gcc/ChangeLog:
> +
> +	PR target/117771
> +	PR c/124830
> +	* system.h: Move the include of sstream and memory above safe-ctype.h.
> +
> +Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
> +(cherry picked from commit 046776dac7cc74bdbab36f450af80644a045858a)
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> +Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=9239757a9c6e3a6e8d94d56803329d556ec914d7
> +---
> + gcc/system.h | 21 +++++++++------------
> + 1 file changed, 9 insertions(+), 12 deletions(-)
> +
> +diff --git a/gcc/system.h b/gcc/system.h
> +index 0354883ed3f..1f013d3ac7a 100644
> +--- a/gcc/system.h
> ++++ b/gcc/system.h
> +@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
> + #ifdef INCLUDE_FUNCTIONAL
> + # include <functional>
> + #endif
> ++#ifdef INCLUDE_SSTREAM
> ++# include <sstream>
> ++#endif
> ++/* Some of the headers included by <memory> can use "abort" within a
> ++   namespace, e.g. "_VSTD::abort();", which fails after we use the
> ++   preprocessor to redefine "abort" as "fancy_abort" below.  */
> ++#ifdef INCLUDE_MEMORY
> ++# include <memory>
> ++#endif
> + # include <cstring>
> + # include <initializer_list>
> + # include <new>
> +@@ -736,22 +745,10 @@ extern int vsnprintf (char *, size_t, const char *, va_list);
> + #define LIKELY(x) (__builtin_expect ((x), 1))
> + #define UNLIKELY(x) (__builtin_expect ((x), 0))
> + 
> +-/* Some of the headers included by <memory> can use "abort" within a
> +-   namespace, e.g. "_VSTD::abort();", which fails after we use the
> +-   preprocessor to redefine "abort" as "fancy_abort" below.  */
> +-
> +-#ifdef INCLUDE_MEMORY
> +-# include <memory>
> +-#endif
> +-
> + #ifdef INCLUDE_MUTEX
> + # include <mutex>
> + #endif
> + 
> +-#ifdef INCLUDE_SSTREAM
> +-# include <sstream>
> +-#endif
> +-
> + #ifdef INCLUDE_MALLOC_H
> + #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
> + #include <malloc.h>
> +-- 
> +2.54.0
> +
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
