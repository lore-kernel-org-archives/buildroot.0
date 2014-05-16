From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 May 2014 09:40:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-15
In-Reply-To: <20140516063007.BBF65100E93@stock.ovh.net>
References: <20140516063007.BBF65100E93@stock.ovh.net>
Message-ID: <20140516094010.79b1493d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b0cdbd79cdd61cdcf21dabb72835c8c9a859552d/

The infamous "attempted static link of dynamic object
`/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/armv6-ctng-linux-uclibcgnueabi/4.8.3/../../../../armv6-ctng-linux-uclibcgnueabi/lib/libstdc++.so'".

Gustavo, as we discussed on IRC, could you provide a summary of the
problem and the possible solutions you see?

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ab05ebf608c8ca8d1344b0e6f32ce21ff6bd5795/
>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2c25c0d66ed89fc3f8c87911d32dfff9208b9f66/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=8e5b15d9e7ca16e0413bd002424843319eae676e.

>       bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/9a210e565fe88d474e92fb94844c2c91d584fe3c/

libiconv problem, to investigate.

>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/d9a8a7327bdba3cacfb5afce8021e281a11cfaae/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/185b9ab5604b2c66576bb4e5fbcb4f8a1216fe95/

Should hopefully be fixed once
http://patchwork.ozlabs.org/patch/349267/ gets committed.

> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/7b9d647f1a85e1d232dace6a5925314f39c2081b/

flex needed?

>        arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/1fe9cece681f02f58a97fe40350e555d050e5bcf/

common/libjack.so: undefined reference to symbol 'floor'

BR2_TOOLCHAIN_EXTERNAL=y build, missing -lm.

>      nios2 |              libfribidi-0.19.6 | NOK | http://autobuild.buildroot.net/results/a584831261c431210549aa247e746a99cacf599c/

Missing host-pkgconf dependency.

> microblazeel |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/6860988c9edb62d0d32cc6b0bd6af4f35ca0e343/

Fixed by http://patchwork.ozlabs.org/patch/349295/.

>      avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/01cd52a9f1a21cc6d33d7373ffe439d3cd7d4786/

Should disable Samba on AVR32, just like we did for Samba 4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
