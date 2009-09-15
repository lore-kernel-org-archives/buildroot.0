From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Sep 2009 08:52:06 +0200
Subject: [Buildroot] [PATCH] DNS resolv problem with glibc
In-Reply-To: <20090915061256.GA9451@gmail.com> (Anders Darander's message of
	"Tue\, 15 Sep 2009 08\:13\:10 +0200")
References: <20090915061256.GA9451@gmail.com>
Message-ID: <873a6o3dk9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:

 Anders> Fix problem with dns resolv, by copying the libnss_dns.so to the rootfs.
 Anders> Using glibc from external toolchain, name resolving does not work,
 Anders> unless libnss_dns.so is available on the target.

Thanks, committed.

 Anders> diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
 Anders> index 568ac3a..1f5aa19 100644
 Anders> --- a/toolchain/external-toolchain/ext-tool.mk
 Anders> +++ b/toolchain/external-toolchain/ext-tool.mk
 Anders> @@ -198,7 +198,7 @@ EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthr
 Anders>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 Anders>  EXTERNAL_LIBS+=ld-uClibc.so
 Anders>  else
 Anders> -EXTERNAL_LIBS+=ld-linux.so libnss_files.so
 Anders> +EXTERNAL_LIBS+=ld-linux.so libnss_files.so libnss_dns.so
 Anders>  endif
 Anders>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)

Your MTA seems to have swallowed the empty line above the LIBSTDCPP
line, causing the patch to not apply. Please check your settings.

-- 
Bye, Peter Korsgaard
