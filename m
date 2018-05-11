From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 11 May 2018 13:37:28 +0200
Subject: [Buildroot] [PATCH] package/clang: link libclang against
 libLLVM.so
In-Reply-To: <20180504170537.0a7a9c09@windsurf>
References: <20180504122743.13589-1-valentin.korenblit@smile.fr>
 <20180504170537.0a7a9c09@windsurf>
Message-ID: <88dbfcfe-444b-7f8c-e7d4-e98fbe3703f1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04/05/2018 17:05, Thomas Petazzoni wrote:
> Hello,
>
> On Fri,  4 May 2018 14:27:43 +0200, Valentin Korenblit wrote:
>> libclang.so is statically linking against all LLVM static libraries
>> instead of linking dynamically against libLLVM.so.
>>
>> This patch fixes this problem partially: libclang links against libLLVM.so
>> but the following LLVM libraries are still being linked statically:
>>
>> libLLVMOption.a
>> libLLVMMCParser.a
>> libLLVMProfileData.a
>> libLLVMBitReader.a
>> libLLVMBinaryFormat.a
>> libLLVMCore.a
>> libLLVMMC.a
>> libLLVMSupport.a
>> libLLVMDemangle.a
>>
>> This problem comes out when clang is not built as a subproject of
>> LLVM (llvm/tools/clang).
> Is this a problem you have discussed with upstream ? Has the patch
> you did on the clang CMakeLists.txt any chance from being accepted
> upstream ?

I didn't, because I was not really convinced about this patch. I've
just found the appropriate solution.

We need to set DLLVM_LINK_LLVM_DYLIB=ON in clang.mk. I'll send the
patch now.

>
> Thanks!
>
> Thomas

Best regards,

Valentin
