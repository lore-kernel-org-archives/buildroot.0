From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 30 Mar 2020 09:33:41 +0200
Subject: [Buildroot] Buildroot LLVM support
In-Reply-To: <003301d602a7$68975330$39c5f990$@ruhr-uni-bochum.de>
References: <003301d602a7$68975330$39c5f990$@ruhr-uni-bochum.de>
Message-ID: <09805a9e-f787-97a0-dddc-330241a01541@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

Please send your mail with the Buildroot mailing list in copy, other
contributors and maintainers can be interested by your work :)

Le 25/03/2020 ? 14:15, Jan Thoma a ?crit?:
> Dear Mr. Naour,
> 
> I am a PhD student at Ruhr University Bochum (Germany). In my project, I
> developed an extension for the RISCV instruction set and modified a CPU
> (VexRiscv) to be able to handle the new instructions. I also modified the
> LLVM compiler so that I am able to compile C code for the modified
> instruction set. The CPU core is able to boot Buildroot Linux when compiled
> with the Riscv GNU compiler. I would like to build a Linux version with LLVM
> so that Linux boots with the modified instructions. 
> 
> Unfortunately, it seems that Buildroot doesn't offer the ability to be
> cross-compiled with a LLVM compiler. In my research, I stumbled across a
> Mail archive where you seemed to face a similar issue
> (http://lists.busybox.net/pipermail/buildroot/2019-September/258744.html).
> Did you succeed building Buildroot with Clang and if so, can you  help me
> out on how to do this? Is there existing code / a buildroot version that
> allows configuring the compiler to LLVM?

I had some discussion with Lu?s Marques from lowrisc [1] but no patch has been
posted to the mailing list so far.

Feel free to contribute to the Buildroot project to enable riscv target for llvm
and clang.

About building all the userspace application and libraries with Clang, I posted
a patch series to do this [2]. But it's outdated since llvm/clang was updated to
version 9.x since then. This series is not an easy one, especially if you're not
familiar with the Buildroot internals. But you can rework this series a post a
new version if it works for you.

You may be interested by [3] [4].

[1]
https://www.lowrisc.org/blog/2019/07/large-scale-risc-v-llvm-testing-with-buildroot/
[2] http://patchwork.ozlabs.org/project/buildroot/list/?series=129565
[3] https://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot/
[4]
https://www.linuxembedded.fr/2019/08/my-first-linux-kernel-built-with-clang-compiler/

Best regards,
Romain


> 
> Many thanks!
> 
> Best regards,
> Jan
> 
> --?
> Jan Philipp Thoma
> Research Assistant
> 
> Chair for Security Engineering (SecEng)
> Dept. Electrical Engineering & Information Technology
> Horst G?rtz Institute for IT-Security,
> Ruhr-University Bochum, Germany
> Building ID 2/647
> Phone: +49 (0)234 32 27891
> https://www.seceng.rub.de?
> 
> 
