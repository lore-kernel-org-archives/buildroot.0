From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 18:06:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpcap: fix build failure
 without wchar
In-Reply-To: <20210122225221.3234679-1-fontaine.fabrice@gmail.com>
References: <20210122225221.3234679-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123180609.7cb4cf6e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 23:52:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libpcap requires c99 since version 1.10.0 and
> https://github.com/the-tcpdump-group/libpcap/commit/68e5ca3f4cbb66d687582ae9563009c87bf3d184
> 
> However, this test will fail without wchar on:
> 
> configure:3609: /home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
> conftest.c:52:9: error: unknown type name 'wchar_t'
>    const wchar_t *name;
>          ^~~~~~~
> 
> So hardcode ac_cv_prog_cc_c99 as already done in numerous package such
> as apparmor, wireshark, xz, etc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6e87c25a0dccccf5e7ad03742597a0613f554506
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpcap/libpcap.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
