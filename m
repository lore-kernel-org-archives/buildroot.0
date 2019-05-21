From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 21 May 2019 21:53:29 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libubootenv: fix build
 with musl and static lib
In-Reply-To: <20190521205911.5dca7351@windsurf.home>
References: <1558455512-31444-1-git-send-email-pjtexier@koncepto.io>
 <20190521205911.5dca7351@windsurf.home>
Message-ID: <b1c26647-772e-8f7b-e9f5-ed6ff2f9e970@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 21/05/2019 ? 20:59, Thomas Petazzoni a ?crit?:
> Hello Pierre-Jean,
>
> On Tue, 21 May 2019 18:18:32 +0200
> Pierre-Jean Texier <pjtexier@koncepto.io> wrote:
>
>> Libubootenv is a shared library, so add missing dependency on !BR2_STATIC_LIBS.
> I think instead src/CMakeLists.txt should be changed to not force
> building a shared library.
Ok, I will do.
>
>> Also add BR2_TOOLCHAIN_USES_MUSL dependency to avoid 'unknown type name 'loff_t''.
> And here I'm pretty sure musl provides loff_t, it's probably just a
> missing #include.
In fact yes, we have to define _GNU_SOURCE.
I'll prepare a patch to fix this issue.
>
>> +comment "libubootenv application library needs a glibc or uClibc toolchain w/ dynamic library"
> The correct comment would be:
>
> comment "libubootenv needs a glibc or uClibc toolchain w/ dynamic library"
>
> but I think it's better to fix the actual problems.

No problem, I will send a v2 tomorrow.

Thanks

Pierre-Jean
>
> Best regards,
>
> Thomas
