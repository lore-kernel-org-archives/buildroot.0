From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Fri, 7 Mar 2008 12:17:53 -0600
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <c05908680803070918k635d6106qa7b4ad5aa5634cea@mail.gmail.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
	<20080305165910.GA1935@real.realitydiluted.com>
	<c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
	<1204737793.5023.1.camel@localhost>
	<c05908680803050933p15ae7f46y77a16d3af3262e45@mail.gmail.com>
	<1204787546.28258.21.camel@PC-EK.Solcon>
	<c05908680803052327qdb3c4fbk573b7ffbe38b4590@mail.gmail.com>
	<c05908680803060125j1855f68dn1e34be01b450d58c@mail.gmail.com>
	<c05908680803070918k635d6106qa7b4ad5aa5634cea@mail.gmail.com>
Message-ID: <20080307181753.GB31953@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 07, 2008 at 06:18:52PM +0100, Salvatore Fassi wrote:
> 
> I had been able to compile a complete rootfs with xorg and gtk and to boot
> it, but I had to copy libcrypt, libm and ld-linux.so (with all their links
> etc etc) manually because on my rootfs /lib there was only libc.
> Now the system boots ok...but I can't login!!
> I've tried using "root" with various passwords (also empty one) but I'm
> still not able to log in...
> 
> Am I missing some other libraries? Why do all these libraries weren't copied
> in the rootfs automatically?  :-/
> P.S : For your information...I'm using my linux pc toolchain (fedora core 6)
> as an external toolchain for buildroot.
> 
You are missing the other libraries. Here is what my buildroot config
options look like for my buildroot using an external glibc toolchain:

BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.6"
BR2_TOOLCHAIN_EXTERNAL_LIBS="ld.so.1 libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libnss_dns.so libnss_files.so libpthread.so libresolv.so librt.so libstdc++.so libutil.so"

The libraries that you do not have which are preventing you from logging
in our 'libnsl.so' and 'libnss_dns.so' and 'libnss_file.so'. Once those
are in your root filesystem, you will be able to login.

-Steve
