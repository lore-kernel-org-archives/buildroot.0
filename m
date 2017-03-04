From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 4 Mar 2017 12:01:05 +0100
Subject: [Buildroot] [PATCH] package/librsvg: disable gdk-pixbuf-loader
In-Reply-To: <20170304115606.76da14f6@free-electrons.com>
References: <20170304103503.18877-1-romain.naour@gmail.com>
 <20170304115606.76da14f6@free-electrons.com>
Message-ID: <839dcdac-2ba5-0145-0ba7-be60a0d0db5a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 04/03/2017 ? 11:56, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat,  4 Mar 2017 11:35:03 +0100, Romain Naour wrote:
>> gdk-pixbuf-loader support is enabled by default but it silently fail to
>> generate gdk-pixbuf.loaders file when host != target.
>>
>> For exemple on ARM target:
>> output/host/usr/bin/gdk-pixbuf-query-loaders ./libpixbufloader-svg.la
>> g_module_open() failed for output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la: output/build/librsvg-2.40.16/gdk-pixbuf-loader/./.libs/libpixbufloader-svg.so: wrong ELF class: ELFCLASS32
>>
>> But it doesn't break the build.
>>
>> When host = target using the Sourcery CodeBench AMD64 2016.11 toolchain
>> optimized for x86_68 AMD Puma/Jaguar or AMD Steamroller, it break the
>> build due to "Illegal instruction".
>>
>> output/host/usr/bin/gdk-pixbuf-query-loaders libpixbufloader-svg.la
>> Illegal instruction (core dumped)
>>
>> Since this option is broken for cross-compilation, disable it.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/393/393145bc9bcb93d6df55ec8c63725c3d9a299957
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/librsvg/librsvg.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks. Peter: I believe this should go in the LTS
> branch.
> 
> Gustavo: let me know if you're happy with this solution. If not, don't
> hesitate to provide an alternative solution.

I just found an upstream patch disabling gdk-pixbuf.loaders build when
cross-compiling:

https://github.com/GNOME/librsvg/commit/30a91d1e1f2df9ad4d6b28ed635e69619b1ed8b3

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
