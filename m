From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:54:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/apitrace: force Release mode
In-Reply-To: <20200517140515.2665046-1-fontaine.fabrice@gmail.com>
References: <20200517140515.2665046-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017145452.60b28ffd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 May 2020 16:05:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Force Release mode otherwise the toolchain workarounds added by commit
> 6f5fcb43296ffc54b2b67d0b3723405b56d8d439 will be ignored when debug is
> enabled as CMAKE_C_FLAGS_RELWITHDEBINFO is appended to CFLAGS:
> 
> output/build/apitrace-9.0/thirdparty/brotli/CMakeFiles/brotli_dec.dir/flags.make:C_FLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -O0 -fvisibility=hidden -Wall -Wno-sign-compare -fno-strict-aliasing -fmessage-length=0 -fno-omit-frame-pointer -O2 -g -DNDEBUG -fPIC
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2e31abd7b115d4c29117ca82007fd4f87f853ff7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apitrace/apitrace.mk | 2 ++
>  1 file changed, 2 insertions(+)

This was fixed in a different way in commit
ce053a2004d089b3080a750496b3b3b21bcc224d.

I've marked this patch as Superseded then.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
