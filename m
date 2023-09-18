Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3554CCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C473940169;
	Mon, 18 Sep 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C473940169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgaNgaGqUajy; Mon, 18 Sep 2023 20:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D22CF41586;
	Mon, 18 Sep 2023 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22CF41586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 755F11BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50AB341586
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50AB341586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pjsg84uhV8zk for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:11:17 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF53040169
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF53040169
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1d6a7354533so1479209fac.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695067876; x=1695672676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+AXMGJTYi9ArWgROtJosrWY3wi0A78MqHN12yqXoPaA=;
 b=faWAhBU2041JgVaFaYq7kEUvcZyHS9Xot7DUu6vBkZE0TdYAwIylK+A/90w5Or42YD
 rhHmSAbshl0LtXQLdEytKAAHxrcro5r0TdL0/kQseaXBVT69Y50JwfStHkEziGwQgZph
 KqPBxTaFrBd9E9wqZLbfg3XJNz8Fe2+lXDT6xOwNsUu7D4Owoj7ammQwnFcyai0h3jy5
 th6mWGU78ltaP/owbJW8GAJ1zoBfIyGMJCMWg/G6gP7CoTzVkcrIuIC9ewY3SG1hd1zt
 +bB7EgYaaA0c7502cNnuI/F/lzXwKqr7drV2LV1oq9pfiXIJ1qx5ejW95uRLKM0se/CC
 1B1w==
X-Gm-Message-State: AOJu0YxzMqkWk9UBOU44fqOtgkRCGDB/kK23DrXpW/q+N9/gTYnsdW1O
 iaF1ZEo/FBwQ/Z9ndBTPczYDq+0I7updDqoemv6UE7dYJrs=
X-Google-Smtp-Source: AGHT+IH24N6nn0EMh2+QwawnbYYgPYv6/a+mKRomOiPsn1uPO+J7hLKKspBA/DBID/dBuwAAZNQIzMgElUL7IypUP0U=
X-Received: by 2002:a05:6871:6a1:b0:1cd:24a1:1c56 with SMTP id
 l33-20020a05687106a100b001cd24a11c56mr12592895oao.19.1695067875696; Mon, 18
 Sep 2023 13:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
 <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
 <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
 <CADYjeSvoxnVhWW9BYkEyJeudsB8ZvYk6pGOjuXJUyh49XQAU_Q@mail.gmail.com>
 <CADvTj4ou41gxNjqMbwjCwtNKGhFzz6uhCwZa+iCgBRwnjUBziQ@mail.gmail.com>
 <CADvTj4q7bCjTN75deJr=WGgoPKNCdqnQt_fkBMY9yiA-2m1v_Q@mail.gmail.com>
 <CADYjeStNG+u8osymoboH7ChLNjNGY3i3BeGLwSppybSWB9bcRg@mail.gmail.com>
 <CADvTj4qx52yQkTvR5XOu58+ssOEodovr0wynVNNhYi9tUe6KXw@mail.gmail.com>
In-Reply-To: <CADvTj4qx52yQkTvR5XOu58+ssOEodovr0wynVNNhYi9tUe6KXw@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 18 Sep 2023 22:11:04 +0200
Message-ID: <CADYjeStEDyGBq3zTOiveO8vhA6v1N5UPvzVZfgrtfTCKC+iAGA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695067876; x=1695672676; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+AXMGJTYi9ArWgROtJosrWY3wi0A78MqHN12yqXoPaA=;
 b=B6J6BHsuInZhNmUHYYh0V9F+agY0dSTvt/GbzD9wZQ2y5n67YUNndAxaBhFmD+c4N8
 zwCuewF70+N6FEA6Ca2TDgEgsAr31mgJtL0ewqAi3Z+MROh68lS5Fo1HBltDc9fevYDm
 zTPXQm9DEHCeoi3Ts3gFHEhLaC0/SISgC7q2OYnCFrHBc9XMAIRSE5bLzYNjlI0y++/C
 9CUDox+YqOAOXkt5Ij7MK6VQx6lFd9PyMEtYA75vZk3pFX8T7Wg27JqgDMxk0aEDWVLI
 tlTq6CDElV9BAEO6pDJqizhTcpt9eo7anP9fkbbP6y8cDu9mQPo0RnjKRrs8q3Fnm2pO
 JfwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B6J6BHsu
Subject: Re: [Buildroot] Error while building tensorflow-lite package
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
Cc: stefan.hager@ginzinger.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1556628515635662676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1556628515635662676==
Content-Type: multipart/alternative; boundary="00000000000099e5940605a7bedd"

--00000000000099e5940605a7bedd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello James,

I tried your PR. I created a .patch file to enable benchmark model config
option and updated tensorflow/lite/tools/benchmark/CMakeLists.txt and
passed -DTFLITE_ENABLE_BENCHMARK_MODEL=3DON to TENSORFLOW_LITE_CONF_OPTS in
tensorflow-lite.mk but, I get same error as above

[ 98%] Building CXX object
tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_delegat=
e_provider.cc.o
2023-09-13T06:49:10 [ 98%] Building CXX object
tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_delega=
te_provider.cc.o
2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
`absl::lts_20211102::strings_internal::Splitter<absl::lts_20211102::ByChar,
absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
std::char_traits<char> >
>::ConvertToContainer<std::vector<std::basic_string_view<char,
std::char_traits<char> >, std::allocator<std::basic_string_view<char,
std::char_traits<char> > > >, std::basic_string_view<char,
std::char_traits<char> >,
false>::operator()(absl::lts_20211102::strings_internal::Splitter<absl::lts=
_20211102::ByChar,
absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
std::char_traits<char> > > const&) const [clone .isra.0]':
2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined
reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
std::char_traits<char> >, unsigned long) const'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
benchmark_tflite_model.cc:(.text+0x284): undefined reference to
`absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
std::char_traits<char> >, unsigned long) const'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
`tflite::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_str=
ing<char,
std::char_traits<char>, std::allocator<char> > const&,
std::pair<std::__cxx11::basic_string<char, std::char_traits<char>,
std::allocator<char> >, std::__cxx11::basic_string<char,
std::char_traits<char>, std::allocator<char> > >&)':

On Mon, 18 Sept 2023 at 19:17, James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Mon, Sep 18, 2023 at 11:01=E2=80=AFAM Sourabh Hegde <hrsourabh011@gmai=
l.com>
> wrote:
> >
> > Hi James,
> >
> > Thanks for the update and PR:
> > I will try this.
> >
> > However, for testing I changed the c++ std in libabseil-cpp.mk to "17"
> and rebuilt the libabseil-cpp package. There were no errors.
> > I did this because I read a similar error in abseil-cpp repo.
> >
> > Now I cleaned the tensorflow-lite package and rebuilt it. There were no
> errors related to linking now.. and benchmark_model is installed to targe=
t
> dir.
> >
> > Do you think is this a good approach? And is it possible to tell
> Buildroot to use c++std=3D17 for libabseil in tensorflow-lite.mk as
> TENSORFLOW_LITE_CONF_OPTS or TENSORFLOW_LITE_ENV variable?
>
> I suspect that may just be masking an issue with incorrect cmake options
> being
> passed to the benchmark_model build.
>
> See if the new config option in my PR fixes the build as that allows the
> build
> to properly use our cmake infrastructure by making it part of the main
> tensorflow
> build invocation.
>
> >
> > On Mon, 18 Sept 2023 at 18:38, James Hilliard <james.hilliard1@gmail.co=
m>
> wrote:
> >>
> >> On Mon, Sep 18, 2023 at 10:22=E2=80=AFAM James Hilliard
> >> <james.hilliard1@gmail.com> wrote:
> >> >
> >> > On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> > >
> >> > > Hello Stefan, James,
> >> > >
> >> > > Have you tried building the benchmark_model from tensorflow-lite? =
I
> am getting above errors during the build...
> >> > >
> >> > > On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> > >>
> >> > >> Hello James,
> >> > >>
> >> > >> Do you have any updates on below issue?
> >> > >> This would be helpful
> >> > >>
> >> > >> Thanks in advance
> >> > >>
> >> > >> On Wed, Sep 13, 2023, 09:07 Sourabh Hegde <hrsourabh011@gmail.com=
>
> wrote:
> >> > >>>
> >> > >>> Hello James,
> >> > >>>
> >> > >>> I am trying to build the "benchmark_model" in the tensorflow-lit=
e
> package. The benchmarking application performs a simple TensorFlow Lite
> model inference and prints benchmarking information.
> >> > >>>
> >> > >>> In the tensorflow-lite.mk  I added new section (similar to
> label_image example)
> >> > >>> ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
> >> > >>> define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> >> > >>>         $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build
> $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model
> >> > >>> endef
> >> > >>> TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D
> TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> >> > >>>
> >> > >>> define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> >> > >>>          $(INSTALL) -D -m0755
> $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
> $(TARGET_DIR)/usr/bin/benchmark_model
> >> > >>> endef
> >> > >>> TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
> TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> >> > >>> endif
> >> > >>>
> >> > >>> But while building this is giving error:
> >> > >>>
> >> > >>> [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_deleg=
ate_provider.cc.o
> >> > >>> 2023-09-13T06:49:10 [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_dele=
gate_provider.cc.o
> >> > >>> 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_mode=
l
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `absl::lts_20211102::strings_internal::Splitter<absl::lts_20211102::ByCha=
r,
> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
> std::char_traits<char> >
> >::ConvertToContainer<std::vector<std::basic_string_view<char,
> std::char_traits<char> >, std::allocator<std::basic_string_view<char,
> std::char_traits<char> > > >, std::basic_string_view<char,
> std::char_traits<char> >,
> false>::operator()(absl::lts_20211102::strings_internal::Splitter<absl::l=
ts_20211102::ByChar,
> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
> std::char_traits<char> > > const&) const [clone .isra.0]':
> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204):
> undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_s=
tring<char,
> std::char_traits<char>, std::allocator<char> > const&,
> std::pair<std::__cxx11::basic_string<char, std::char_traits<char>,
> std::allocator<char> >, std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> > >&)':
> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0):
> undefined reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0xdd4): undefined reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388):
> undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> >> > >>> 2023-09-13T06:49:11 collect2: error: ld returned 1 exit status
> >> > >>> 2023-09-13T06:49:11 make[6]: ***
> [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
> tools/benchmark/benchmark_model] Error 1
> >> > >>> 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
> tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
> >> > >>> 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
> tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
> >> > >>> 2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model]
> Error 2
> >> > >>>
> >> > >>> Do you know what the issue here?
> >> >
> >> > You probably need to patch the tensorflow source code similar to thi=
s
> >> > as we don't
> >> > really support multiple cmake build invocations for a single package=
:
> >> > https://github.com/tensorflow/tensorflow/pull/60021
> >> >
> >> > This line is preventing it from being built properly as part of the
> >> > normal tensorflow-lite
> >> > build:
> >> >
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/too=
ls/benchmark/CMakeLists.txt#L84
> >>
> >> Try applying these changes and enabling the new cmake config flag:
> >> https://github.com/tensorflow/tensorflow/pull/61897
> >>
> >> >
> >> > >>>
> >> > >>> Thank you,
> >> > >>> Sourabh
> >> > >>>
> >> > >>> On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> > >>>>
> >> > >>>> Hello James,
> >> > >>>>
> >> > >>>> Thanks for the update.
> >> > >>>>
> >> > >>>> I could build the tensorflow-lite package.
> >> > >>>>
> >> > >>>> Best Regards,
> >> > >>>> Sourabh
> >> > >>>>
> >> > >>>>
> >> > >>>>
> >> > >>>> On Tue, 5 Sept 2023 at 08:07, James Hilliard <
> james.hilliard1@gmail.com> wrote:
> >> > >>>>>
> >> > >>>>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> > >>>>> >
> >> > >>>>> > Hello All,
> >> > >>>>> >
> >> > >>>>> > I am trying to add tensorflow-lite to Buildroot package and =
I
> found a git (quite old)
> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
> wanted to test.
> >> > >>>>>
> >> > >>>>> Try my v6 patch series:
> >> > >>>>>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
> >> > >>>>>
> >> > >>>>> > But while building it I am getting below error:
> >> > >>>>> >
> >> > >>>>> >
> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthre=
adpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> >> > >>>>> > -- Downloading... done
> >> > >>>>> > -- extracting...
> >> > >>>>> >
> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthrea=
dpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> >> > >>>>> >
> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
> >> > >>>>> > -- extracting... [tar xfz]
> >> > >>>>> > -- extracting... [analysis]
> >> > >>>>> > -- extracting... [rename]
> >> > >>>>> > -- extracting... [clean up]
> >> > >>>>> > -- extracting... done
> >> > >>>>> > [ 33%] No patch step for 'pthreadpool'
> >> > >>>>> > [ 44%] No update step for 'pthreadpool'
> >> > >>>>> > [ 55%] No configure step for 'pthreadpool'
> >> > >>>>> > [ 66%] No build step for 'pthreadpool'
> >> > >>>>> > [ 77%] No install step for 'pthreadpool'
> >> > >>>>> > [ 88%] No test step for 'pthreadpool'
> >> > >>>>> > [100%] Completed 'pthreadpool'
> >> > >>>>> > make[4]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> > >>>>> > [100%] Built target pthreadpool
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> > >>>>> > -- Configuring incomplete, errors occurred!
> >> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
> >> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
> >> > >>>>> > make[1]: *** [package/pkg-generic.mk:283:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/.stamp_configured]
> Error 1
> >> > >>>>> > make: *** [Makefile:23: _all] Error 2
> >> > >>>>> >
> >> > >>>>> > The CMakeError.log
> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CM
> >> > >>>>> > akeFiles shows
> >> > >>>>> >
> >> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_Wshorten64to32 failed with the following output:
> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> > >>>>> >
> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
> CMakeFiles/cmTC_76002.dir/build
> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security
> -DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
>  -Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-Wshorten-64-to-32'
> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> >
> >> > >>>>> >
> >> > >>>>> > Source file was:
> >> > >>>>> > int main() { return 0; }
> >> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_Wcpp11extensions failed with the following output:
> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> > >>>>> >
> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
> CMakeFiles/cmTC_0b14f.dir/build
> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBUG
> -fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-Wc++11-extensions'; did you mean '-fms-extensions'?
> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> >
> >> > >>>>> >
> >> > >>>>> > Source file was:
> >> > >>>>> > int main() { return 0; }
> >> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 faile=
d
> with the following output:
> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> > >>>>> >
> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
> CMakeFiles/cmTC_4c191.dir/build
> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -wd9=
81
> -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-wd981'
> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> >
> >> > >>>>> >
> >> > >>>>> > Source file was:
> >> > >>>>> > int main() { return 0; }
> >> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304
> failed with the following output:
> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> > >>>>> >
> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
> CMakeFiles/cmTC_3d2da.dir/build
> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
>  -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-wd2304'
> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> >
> >> > >>>>> >
> >> > >>>>> > Source file was:
> >> > >>>>> > int main() { return 0; }
> >> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI
> failed with the following output:
> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> > >>>>> >
> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
> CMakeFiles/cmTC_b2340.dir/build
> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPIE
>  -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-strict-ansi'; did you mean '-fstrict-enums'?
> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> > >>>>> >
> >> > >>>>> > Can anyone please let me know what could be an issue and how
> to resolve it?
> >> > >>>>> >
> >> > >>>>> > Thanks in advance
> >> > >>>>> >
> >> > >>>>> > _______________________________________________
> >> > >>>>> > buildroot mailing list
> >> > >>>>> > buildroot@buildroot.org
> >> > >>>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000099e5940605a7bedd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello James,<div><br></div><div>I tried your PR. I created=
 a .patch file to enable benchmark model config option and updated tensorfl=
ow/lite/tools/benchmark/CMakeLists.txt and passed -DTFLITE_ENABLE_BENCHMARK=
_MODEL=3DON to=C2=A0TENSORFLOW_LITE_CONF_OPTS in <a href=3D"http://tensorfl=
ow-lite.mk">tensorflow-lite.mk</a> but, I get same error as above</div><div=
><br></div><div>[ 98%] Building CXX object tools/benchmark/CMakeFiles/bench=
mark_model.dir/__/delegates/xnnpack_delegate_provider.cc.o<br>2023-09-13T06=
:49:10 [ 98%] Building CXX object tools/benchmark/CMakeFiles/benchmark_mode=
l.dir/__/delegates/external_delegate_provider.cc.o<br>2023-09-13T06:49:11 [=
100%] Linking CXX executable benchmark_model<br>2023-09-13T06:49:11 /home/.=
../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch6=
4-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld=
: CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `=
absl::lts_20211102::strings_internal::Splitter&lt;absl::lts_20211102::ByCha=
r, absl::lts_20211102::AllowEmpty, std::basic_string_view&lt;char, std::cha=
r_traits&lt;char&gt; &gt; &gt;::ConvertToContainer&lt;std::vector&lt;std::b=
asic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::allocator=
&lt;std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; =
&gt;, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, fa=
lse&gt;::operator()(absl::lts_20211102::strings_internal::Splitter&lt;absl:=
:lts_20211102::ByChar, absl::lts_20211102::AllowEmpty, std::basic_string_vi=
ew&lt;char, std::char_traits&lt;char&gt; &gt; &gt; const&amp;) const [clone=
 .isra.0]&#39;:<br>2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x2=
04): undefined reference to `absl::lts_20211102::ByChar::Find(std::basic_st=
ring_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&=
#39;<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/=
ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../..=
/aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.text+0x284=
): undefined reference to `absl::lts_20211102::ByChar::Find(std::basic_stri=
ng_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#3=
9;<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ex=
t-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../a=
arch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark=
_tflite_model.cc.o: in function `tflite::benchmark::SplitInputLayerNameAndV=
alueFile(std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, =
std::allocator&lt;char&gt; &gt; const&amp;, std::pair&lt;std::__cxx11::basi=
c_string&lt;char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; =
&gt;, std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std=
::allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Sept 2023=
 at 19:17, James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">=
james.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, Sep 18, 2023 at 11:01=E2=80=AFAM Sourabh H=
egde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsour=
abh011@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi James,<br>
&gt;<br>
&gt; Thanks for the update and PR:<br>
&gt; I will try this.<br>
&gt;<br>
&gt; However, for testing I changed the c++ std in <a href=3D"http://libabs=
eil-cpp.mk" rel=3D"noreferrer" target=3D"_blank">libabseil-cpp.mk</a> to &q=
uot;17&quot; and rebuilt the libabseil-cpp package. There were no errors.<b=
r>
&gt; I did this because I read a similar error in abseil-cpp repo.<br>
&gt;<br>
&gt; Now I cleaned the tensorflow-lite package and rebuilt it. There were n=
o errors related to linking now.. and benchmark_model is installed to targe=
t dir.<br>
&gt;<br>
&gt; Do you think is this a good approach? And is it possible to tell Build=
root to use c++std=3D17 for libabseil in <a href=3D"http://tensorflow-lite.=
mk" rel=3D"noreferrer" target=3D"_blank">tensorflow-lite.mk</a> as TENSORFL=
OW_LITE_CONF_OPTS or TENSORFLOW_LITE_ENV variable?<br>
<br>
I suspect that may just be masking an issue with incorrect cmake options be=
ing<br>
passed to the benchmark_model build.<br>
<br>
See if the new config option in my PR fixes the build as that allows the bu=
ild<br>
to properly use our cmake infrastructure by making it part of the main<br>
tensorflow<br>
build invocation.<br>
<br>
&gt;<br>
&gt; On Mon, 18 Sept 2023 at 18:38, James Hilliard &lt;<a href=3D"mailto:ja=
mes.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 18, 2023 at 10:22=E2=80=AFAM James Hilliard<br>
&gt;&gt; &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank"=
>james.hilliard1@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Hegde &lt;<a=
 href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmai=
l.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hello Stefan, James,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Have you tried building the benchmark_model from tensorf=
low-lite? I am getting above errors during the build...<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde &lt;<a href=
=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Hello James,<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Do you have any updates on below issue?<br>
&gt;&gt; &gt; &gt;&gt; This would be helpful<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Thanks in advance<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Wed, Sep 13, 2023, 09:07 Sourabh Hegde &lt;<a hre=
f=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Hello James,<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; I am trying to build the &quot;benchmark_model&q=
uot; in the tensorflow-lite package. The benchmarking application performs =
a simple TensorFlow Lite model inference and prints benchmarking informatio=
n.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; In the <a href=3D"http://tensorflow-lite.mk" rel=
=3D"noreferrer" target=3D"_blank">tensorflow-lite.mk</a>=C2=A0 I added new =
section (similar to label_image example)<br>
&gt;&gt; &gt; &gt;&gt;&gt; ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHM=
ARK_MODEL),y)<br>
&gt;&gt; &gt; &gt;&gt;&gt; define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br>
&gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_E=
NV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model<br>
&gt;&gt; &gt; &gt;&gt;&gt; endef<br>
&gt;&gt; &gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW=
_LITE_BENCHMARK_BUILD_CMDS<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_=
MODEL<br>
&gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D =
-m0755 $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_mode=
l $(TARGET_DIR)/usr/bin/benchmark_model<br>
&gt;&gt; &gt; &gt;&gt;&gt; endef<br>
&gt;&gt; &gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D T=
ENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>
&gt;&gt; &gt; &gt;&gt;&gt; endif<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; But while building this is giving error:<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; [ 98%] Building CXX object tools/benchmark/CMake=
Files/benchmark_model.dir/__/delegates/xnnpack_delegate_provider.cc.o<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:10 [ 98%] Building CXX object t=
ools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_delegat=
e_provider.cc.o<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 [100%] Linking CXX executabl=
e benchmark_model<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmar=
k_model.dir/benchmark_tflite_model.cc.o: in function `absl::lts_20211102::s=
trings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211102=
::AllowEmpty, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; =
&gt; &gt;::ConvertToContainer&lt;std::vector&lt;std::basic_string_view&lt;c=
har, std::char_traits&lt;char&gt; &gt;, std::allocator&lt;std::basic_string=
_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; &gt;, std::basic_stri=
ng_view&lt;char, std::char_traits&lt;char&gt; &gt;, false&gt;::operator()(a=
bsl::lts_20211102::strings_internal::Splitter&lt;absl::lts_20211102::ByChar=
, absl::lts_20211102::AllowEmpty, std::basic_string_view&lt;char, std::char=
_traits&lt;char&gt; &gt; &gt; const&amp;) const [clone .isra.0]&#39;:<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.=
text+0x204): undefined reference to `absl::lts_20211102::ByChar::Find(std::=
basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long=
) const&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_mo=
del.cc:(.text+0x284): undefined reference to `absl::lts_20211102::ByChar::F=
ind(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsi=
gned long) const&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmar=
k_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benchmark::Sp=
litInputLayerNameAndValueFile(std::__cxx11::basic_string&lt;char, std::char=
_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&amp;, std::pair&=
lt;std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std::a=
llocator&lt;char&gt; &gt;, std::__cxx11::basic_string&lt;char, std::char_tr=
aits&lt;char&gt;, std::allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.=
text+0xcf0): undefined reference to `absl::lts_20211102::StrReplaceAll[abi:=
cxx11](std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, s=
td::initializer_list&lt;std::pair&lt;std::basic_string_view&lt;char, std::c=
har_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::char_trai=
ts&lt;char&gt; &gt; &gt; &gt;)&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_mo=
del.cc:(.text+0xdd4): undefined reference to `absl::lts_20211102::StrReplac=
eAll[abi:cxx11](std::basic_string_view&lt;char, std::char_traits&lt;char&gt=
; &gt;, std::initializer_list&lt;std::pair&lt;std::basic_string_view&lt;cha=
r, std::char_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::=
char_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmar=
k_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benchmark::Be=
nchmarkTfLiteModel::ValidateParams()&#39;:<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.=
text+0x8388): undefined reference to `absl::lts_20211102::numbers_internal:=
:safe_strto32_base(std::basic_string_view&lt;char, std::char_traits&lt;char=
&gt; &gt;, int*, int)&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensor=
flow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu=
/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_mo=
del.cc:(.text+0x83a4): undefined reference to `absl::lts_20211102::numbers_=
internal::safe_strto32_base(std::basic_string_view&lt;char, std::char_trait=
s&lt;char&gt; &gt;, int*, int)&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 collect2: error: ld returned=
 1 exit status<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[6]: *** [tools/benchmar=
k/CMakeFiles/benchmark_model.dir/build.make:476: tools/benchmark/benchmark_=
model] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Mak=
efile2:370: tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Mak=
efile2:377: tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2<br=
>
&gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[3]: *** [Makefile:268: =
benchmark_model] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Do you know what the issue here?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You probably need to patch the tensorflow source code similar=
 to this<br>
&gt;&gt; &gt; as we don&#39;t<br>
&gt;&gt; &gt; really support multiple cmake build invocations for a single =
package:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/tensorflow/tensorflow/pull/6002=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/tensorflow/tenso=
rflow/pull/60021</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This line is preventing it from being built properly as part =
of the<br>
&gt;&gt; &gt; normal tensorflow-lite<br>
&gt;&gt; &gt; build:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/tensorflow/tensorflow/blob/v2.1=
1.0/tensorflow/lite/tools/benchmark/CMakeLists.txt#L84" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/tensorflow/tensorflow/blob/v2.11.0/ten=
sorflow/lite/tools/benchmark/CMakeLists.txt#L84</a><br>
&gt;&gt;<br>
&gt;&gt; Try applying these changes and enabling the new cmake config flag:=
<br>
&gt;&gt; <a href=3D"https://github.com/tensorflow/tensorflow/pull/61897" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/tensorflow/tensorflow=
/pull/61897</a><br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Thank you,<br>
&gt;&gt; &gt; &gt;&gt;&gt; Sourabh<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde &lt;=
<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gm=
ail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Hello James,<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Thanks for the update.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; I could build the tensorflow-lite package.<b=
r>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Best Regards,<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Sourabh<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; On Tue, 5 Sept 2023 at 08:07, James Hilliard=
 &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.h=
illiard1@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM =
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Hello All,<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; I am trying to add tensorflow-lite =
to Buildroot package and I found a git (quite old) <a href=3D"https://githu=
b.com/Exein-io/buildroot-tensorflow-lite/tree/master" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/Exein-io/buildroot-tensorflow-lite/tree/=
master</a> that I wanted to test.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; Try my v6 patch series:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://patchwork.ozlabs.org/=
project/buildroot/list/?series=3D346546&amp;submitter=3D&amp;state=3D*&amp;=
q=3D&amp;archive=3Dboth&amp;delegate=3D" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&amp=
;submitter=3D&amp;state=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegate=3D</a>=
<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; But while building it I am getting =
below error:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; file=3D&#39;/home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6=
dca49109516fac02e973a3de2.zip&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Downloading... done<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting...<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 src=3D&#39;/hom=
e/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967=
dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthreadpool-prefix/=
src/545ebe9f225aec6dca49109516fac02e973a3de2.zip&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 dst=3D&#39;/hom=
e/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967=
dd/tensorflow/lite/buildroot-build/pthreadpool-source&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [tar xfz]<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [analysis]<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [rename]<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [clean up]<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... done<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 33%] No patch step for &#39;pthre=
adpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 44%] No update step for &#39;pthr=
eadpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 55%] No configure step for &#39;p=
threadpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 66%] No build step for &#39;pthre=
adpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 77%] No install step for &#39;pth=
readpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 88%] No test step for &#39;pthrea=
dpool&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Completed &#39;pthreadpool&#=
39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[4]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Built target pthreadpool<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Configuring incomplete, errors o=
ccurred!<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/tmp/.../b=
uild/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/li=
te/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/tmp/.../b=
uild/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/li=
te/buildroot-build/CMakeFiles/CMakeError.log&quot;.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[1]: *** [package/<a href=3D"ht=
tp://pkg-generic.mk:283" rel=3D"noreferrer" target=3D"_blank">pkg-generic.m=
k:283</a>: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c=
68cc4b2ba991967dd/.stamp_configured] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make: *** [Makefile:23: _all] Error=
 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; The CMakeError.log build/tensorflow=
-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-bu=
ild/CM<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; akeFiles shows<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COM=
PILER_SUPPORT_Wshorten64to32 failed with the following output:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make =
cmTC_76002/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_76=
002.dir/build.make CMakeFiles/cmTC_76002.dir/build<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC=
_76002.dir/src.cxx.o<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tens=
orflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-p=
ackage/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=
=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=
=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=
=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast=
-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpoint=
er-arith -Wwrite-strings -Wformat-security -DCOMPILER_SUPPORT_Wshorten64to3=
2 -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-Wshorten-64-to-32 -o CMakeFiles=
/cmTC_76002.dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663a=
be4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFi=
les/CMakeTmp/src.cxx<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: u=
nrecognized command-line option &#39;-Wshorten-64-to-32&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_76002=
.dir/build.make:66: CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_76=
002/fast] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COM=
PILER_SUPPORT_Wcpp11extensions failed with the following output:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make =
cmTC_0b14f/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_0b=
14f.dir/build.make CMakeFiles/cmTC_0b14f.dir/build<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC=
_0b14f.dir/src.cxx.o<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tens=
orflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-p=
ackage/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=
=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=
=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=
=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast=
-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpoint=
er-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversion -=
DCOMPILER_SUPPORT_Wcpp11extensions -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=
=A0-Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c /home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: u=
nrecognized command-line option &#39;-Wc++11-extensions&#39;; did you mean =
&#39;-fms-extensions&#39;?<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_0b14f=
.dir/build.make:66: CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_0b=
14f/fast] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COM=
PILER_SUPPORT_wd981 failed with the following output:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make =
cmTC_4c191/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_4c=
191.dir/build.make CMakeFiles/cmTC_4c191.dir/build<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC=
_4c191.dir/src.cxx.o<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tens=
orflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-p=
ackage/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=
=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=
=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=
=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast=
-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpoint=
er-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversion -=
Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -=
fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werro=
r=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd981 -o CMakeFiles/cmTC_4c191.dir/src.=
cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx=
<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: u=
nrecognized command-line option &#39;-wd981&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_4c191=
.dir/build.make:66: CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_4c=
191/fast] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COM=
PILER_SUPPORT_wd2304 failed with the following output:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make =
cmTC_3d2da/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_3d=
2da.dir/build.make CMakeFiles/cmTC_3d2da.dir/build<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC=
_3d2da.dir/src.cxx.o<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tens=
orflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-p=
ackage/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=
=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=
=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=
=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast=
-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpoint=
er-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversion -=
Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -=
fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werr=
or=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd2304 -o CMakeFiles/cmTC_3d2da.dir/sr=
c.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c=
68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.c=
xx<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: u=
nrecognized command-line option &#39;-wd2304&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_3d2da=
.dir/build.make:66: CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_3d=
2da/fast] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COM=
PILER_SUPPORT_STRICTANSI failed with the following output:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../buil=
d/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/=
buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make =
cmTC_b2340/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/=
.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_b2=
340.dir/build.make CMakeFiles/cmTC_b2340.dir/build<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC=
_b2340.dir/src.cxx.o<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tens=
orflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-p=
ackage/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=
=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=
=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=
=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast=
-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpoint=
er-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-conversion -=
Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -=
fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -=
Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-strict-ansi -o CMakeFiles/cmTC_b23=
40.dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c90370=
30b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMake=
Tmp/src.cxx<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: u=
nrecognized command-line option &#39;-strict-ansi&#39;; did you mean &#39;-=
fstrict-enums&#39;?<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_b2340=
.dir/build.make:66: CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_b2=
340/fast] Error 2<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/ho=
me/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba99196=
7dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Can anyone please let me know what =
could be an issue and how to resolve it?<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Thanks in advance<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; ___________________________________=
____________<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; buildroot mailing list<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"mailto:buildroot@buildro=
ot.org" target=3D"_blank">buildroot@buildroot.org</a><br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"https://lists.buildroot.=
org/mailman/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.buildroot.org/mailman/listinfo/buildroot</a><br>
</blockquote></div>

--00000000000099e5940605a7bedd--

--===============1556628515635662676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1556628515635662676==--
