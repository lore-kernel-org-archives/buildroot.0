From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 13:46:14 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-04
In-Reply-To: <20141105073015.758941014DB@stock.ovh.net>
References: <20141105073015.758941014DB@stock.ovh.net>
Message-ID: <545A2A26.8060506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 11/05/2014 07:30 AM, Thomas Petazzoni wrote:
>       mipsel |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/4a179bebdc9cd85780d7f16f672ee019a1947147/

The external toolchain used here doesn't have the needed fix in order to
build civetweb for uClibc + static. This has been already fixes in
Buildroot but this toolchain was generated before.

Patch sent: http://patchwork.ozlabs.org/patch/406989/

>       mipsel |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/2f2f298c9baccba79d7c94a02703be708cec6757/

"makeinfo: command not found"

This fails when generating the documentation because the build host
doesn't have texinfo installed (which provides the makeinfo tool).

However, using the same exact configuration and removing the makeinfo
executable from my system, I still being unable to reproduce this failure.

>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/9bfb9bcad67727bdaf74c94206eca0bb728d7eec/
>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/b64a150f3e66d6f2504d2b28f2594e67eda8ea16/

This shouldn't be happening. The rt-tests package should be removed from
the build list for the toolchains used in those config files. The
builder who did those builds doesn't have an updated autobuild-run script.

ThomasP in CC.

>          arm |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/aa4dc974c297ad2595363ee524a18ea30536cca1/

Reported upstream:
http://lists.libsdl.org/pipermail/sdl-libsdl.org/2014-November/096804.html

Related: http://patchwork.ozlabs.org/patch/400969/

>     mips64el | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/d777f62139f47677becd41c76c9ed4a02ff3301d/

This seems an error of the autobuilder. The compilation stops suddenly
without any error message.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
