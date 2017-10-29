From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Oct 2017 13:40:08 +0100
Subject: [Buildroot] [RESEND PATCH v4] libostree: new package
References: <20171029093756.23671-1-marcus.folkesson@gmail.com>
Message-ID: <8qugcexorq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 29 Oct 2017 10:37:56 +0100 schrieb Marcus Folkesson:

> OSTree is an upgrade system for Linux-based operating systems
> 
> Signed-off-by: Marcus Folkesson
> <marcus.folkesson@gmail.com>

Hi,

an additional note: The package is broken when used with musl:

  CC       src/libostree/libostree_1_la-ostree-async-progress.lo
In file included from ./libglnx/libglnx.h:33:0,
                 from src/libostree/ostree-async-progress.c:24:
./libglnx/glnx-dirfd.h: In function 'glnx_ensure_dir':
./libglnx/glnx-dirfd.h:108:7: error: implicit declaration of function 
'TEMP_FAILURE_RETRY' [-Werror=implicit-function-declaration]
   if (TEMP_FAILURE_RETRY (mkdirat (dfd, path, mode)) != 0)
       ^~~~~~~~~~~~~~~~~~

Regards, Bernd
