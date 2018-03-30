From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 30 Mar 2018 14:16:00 +0200
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target
 variant
In-Reply-To: <20180330110753.2c1d1415@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-9-valentin.korenblit@smile.fr>
 <20180330110753.2c1d1415@windsurf>
Message-ID: <1a63ff29-d9ac-316d-f91f-cd9eec06dae5@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

On 30/03/2018 11:07, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 29 Mar 2018 13:33:43 +0200, Valentin Korenblit wrote:
>> This patch provides Clang for the target, tools and libraries.
>>
>> In this package we have to deal with the same kind of problem we encountered
>> when building mesa3d with llvm support: llvm-config (host-version) had to be
>> copied to STAGING_DIR/usr/bin. In this case, we need llvm-tblgen from host
>> to be installed in STAGING_DIR/usr/bin for cross-compiling clang.
>>
>> We need libclang for the target because it is used by all OpenCL implementations.
>> In this series, Clover is provided.
> I'm not sure to understand why you need Clang on the target, and what
> Clover is. Maybe I missed it, but I don't see where the target Clang is
> used in the rest of your series.

What we need is libclang, we don't need the binaries. But as libclang is a tool,
I need to set CLANG_BUILD_TOOLS to ON, what will build everything.

Clover is the OpenCL implementation provided with Mesa. It uses libclang as a frontend
for OpenCL C and libLLVM for code generation.

> In addition, we don't support gcc on the target, so having clang on the
> target raises a red flag for me.
>
> Could you explain a bit more why this is needed/useful ?

As explained above, we don't need it. I could add a hook to erase all unnecessary
binaries from the target if that is ok.

>
> Thanks!
>
> Thomas

Best regards,

Valentin
