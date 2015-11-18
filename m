From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 Nov 2015 12:55:24 +0000
Subject: [Buildroot] [PATCH v3 1/1] qemu: add patch to fix SSP support
 detection
In-Reply-To: <1447671498-9180-1-git-send-email-rprebello@gmail.com>
References: <1447671498-9180-1-git-send-email-rprebello@gmail.com>
Message-ID: <564C753C.6020301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On 11/16/2015 10:58 AM, Rodrigo Rebello wrote:
> The QEMU configure script incorrectly assumes SSP is supported by the
> toolchain in some cases where the compiler accepts -fstack-protector*
> flags but the C library does not provide the necessary __stack_chk_*()
> functions.
> 
> Even though a full compile and link test is performed by the script,
> this is done with a code fragment which does not actually meet any of
> the conditions required to cause the compiler to emit canary code when
> the -fstack-protector-strong variant is used. As no compile or link
> failure occurs in this case, a false positive is generated and a
> subsequent error is seen when the probe for pthreads is performed.
> 
> The fix consists in patching the configure script to use a more
> appropriate test program for the SSP support checks.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/efb/efbb4e940543894b8745bb405478a096c90a5ae2/
>   http://autobuild.buildroot.net/results/32d/32d6d984febad2dee1f0d31c5fa0aea823297096/
>   http://autobuild.buildroot.net/results/aa6/aa6e71c957fb6f07e7bded35a8e47be4dadd042c/
>   ...and many others.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture. This patch fixed this recent autobuild
failure:

http://autobuild.buildroot.net/results/9a7211e7b40f5a08fc50a912663d53af515896a8/

Regards,

Vincent.
