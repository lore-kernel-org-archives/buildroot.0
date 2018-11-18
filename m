From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 19:50:15 -0200
Subject: [Buildroot] [PATCH v2 5/6] testing/tests: CLANG compiler-rt
 runtime test
References: <1542426982-54683-5-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bf1de972509d_7ce43f955806b7385643a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

IMO, much nicer the way you did, using the project in the package instead of
adding a copy of the .cc file!

On Sat, Nov 17, 2018 at 01:56 AM, Matt Weber wrote:

> This patch adds a test case that
>  1) Builds the complete LLVM and CLANG set of host tools
>  2) Cross-compiles the compiler-rt runtime using CLANG
>  3) Builds a cross-compiled application using CLANG and the libfuzzer
>     compiler-rt library.
>  4) Executes the fuzz application (part of the libfuzzer package) on
>     target and checks expected output
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with the entire series applied on next branch:
 https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/121908178
 NOTE: this test case takes longer than test_rust, ~2 hours in my host
 machine with all tarballs previously downloaded]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
