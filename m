From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:57:05 +0200
Subject: [Buildroot] [PATCH] target-finalize: fix calling ldconfig
In-Reply-To: <1429287033-21225-1-git-send-email-yann.morin.1998@free.fr>
References: <1429287033-21225-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150418155705.3ff66f18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 17 Apr 2015 18:10:33 +0200, Yann E. MORIN wrote:
> On some systems (e.g. Fedora 20), the build breaks when parsing include
> directives in our /etc/ld.so.conf, with error messages as thus:
> 
>     /sbin/ldconfig: need absolute file name for configuration file
>     when using -r
> 
> So, enforce the path to the ld.so.conf file to point to our own, in the
> target/ directory.
> 
> Reported-by: Al West <al.west@v-nova.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks. But I must admit I would prefer a real overhaul of our
ldconfig handling (that takes into account glibc vs. uclibc vs. musl,
etc.).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
