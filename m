From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 15:08:41 +0200
Subject: [Buildroot] [PATCH] core: always pass full path to strip command
In-Reply-To: <20170701074205.21287-1-yann.morin.1998@free.fr>
References: <20170701074205.21287-1-yann.morin.1998@free.fr>
Message-ID: <20170701150841.36ec8e86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 09:42:05 +0200, Yann E. MORIN wrote:
> In some cases, passing STRIP=true is not sufficient to disable striping
> altogether, as some (incorrectly generated?) configure scripts will
> ignore a ${STRIP} that is not a full path.
> 
> This is the case, for example, for nmap, which ends up using the host
> strip command when we pass STRIP=true:
> 
>     checking for arm-buildroot-linux-gnueabihf-strip... no
>     checking for strip... /usr/bin/strip
>     configure: WARNING: using cross tools not prefixed with host triplet
>     [--SNIP--]
>     /usr/bin/install -c -c -m 755 nping /home/ymorin/dev/buildroot/O/target/usr/bin/nping
>     /usr/bin/strip -x /home/ymorin/dev/buildroot/O/target/usr/bin/nping
>     /usr/bin/strip: Unable to recognise the format of the input file `/home/ymorin/dev/buildroot/O/target/usr/bin/nping'
> 
> We fix that by forcing a full path to the strip sommand when it is
> disabled: STRIP=/bin/true
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
