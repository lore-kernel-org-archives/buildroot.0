From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 14:16:19 +0100
Subject: [Buildroot] [PATCH 1/1] netcat-openbsd: depends on
 linux-headers >= 3.12
In-Reply-To: <20171128154437.1631-1-gael.portay@savoirfairelinux.com>
References: <20171128154437.1631-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171231141619.11116894@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 10:44:37 -0500, Ga?l PORTAY wrote:
> This debian fork of netcat includes the kernel UAPI inet6 header. This
> header conflicts with the existing libc inet header and causes
> redefinition of structures when they are both included.
> 
> The compiler raises the following error:
> 
> 	/home/buildroot/build/instance-0/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr' struct in6_addr {
> 
> From version 3.12 of linux, the kernel UAPI header has mechanisms in
> libc-compat.h to prevent such situations (see __UAPI_DEF_SOCKADDR_IN6
> macros).
> 
> Unfortunately the build is broken when toolchains do not satisfy at least
> the linux headers condition (>= 3.12).
> 
> The package now depends on the toolchain headers at least 3.12.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---

You forgot to update the Config.in comment, so I've done so, and
applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
