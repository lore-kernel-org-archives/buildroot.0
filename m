From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 9 Nov 2019 14:42:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <20191109143000.37b5a746@windsurf>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
 <20191109120151.GO3419@scaer>
 <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
 <20191109143000.37b5a746@windsurf>
Message-ID: <43ec9f4c-0fc9-baa5-f3e5-b40b53a00808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/11/2019 ? 14:30, Thomas Petazzoni a ?crit?:
> On Sat, 9 Nov 2019 14:09:50 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Well, It's the same problem as for using llvm/clang on the host to build some
>> host tools. For your case you have to build hos-llvm with your host variant
>> (x86_64 for example) (LLVM_TARGETS_TO_BUILD).
>>
>> But since we use the same LLVM_TARGET_ARCH for the host-llvm and llvm, we need
>> to use -target x86_64-linux-gnu when using clang.
> 
> Wouldn't it be more "natural" for clang to by default produce binaries
> for the host, and when you want to cross-compile, have to explicitly
> pass -target arm-something-something ?

It's seems Valentin had some issues when LLVM_TARGET_ARCH is not the same for
host-llvm and llvm, there is a comment about it:

# It must be set to LLVM_TARGET_ARCH for host and target, otherwise we get
# "No available targets are compatible for this triple" with llvmpipe when host
# and target architectures are different.

Valentin, do you remember ? Was It a runtime issue ?

Best regards,
Romain

> 
> Thomas
> 
