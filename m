From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Mar 2014 18:47:21 +0100
Subject: [Buildroot] [lua V3 4/8] luajit: add host variant
In-Reply-To: <1393694590-29945-5-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
 <1393694590-29945-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140301174721.GB3354@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-03-01 18:23 +0100, Francois Perrad spake thusly:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.mk |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 859425a..cb1d94e 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -62,4 +62,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
>  endef
>  
> +define HOST_LUAJIT_BUILD_CMDS
> +	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
> +endef
> +
> +define HOST_LUAJIT_INSTALL_CMDS
> +	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))

I'm really worried about how this is gonna play with the virtual-package
insfrastructure curently pending.

On one hand, I'd like the virtual-package infra to go in first (hey! I
wrote it! ;-) ), since I'm not very versed in this lua stuff (but you
are), and we currently have no host virtual packages. But that would
put the burden onto you to rebase your series.

On the other hand, sicne you're introducing host virtual packages, we
may want to have them in before the virtual-package infra, so we get a
pretty good idea of what is actually required.

So, whatever... Let's see what Thomas (deputy-maintainer while Peter's
on vacation) will say about this. Thomas? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
