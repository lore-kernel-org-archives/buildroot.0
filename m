From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:33:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: Fix
 cross-compilation.conf
In-Reply-To: <CADjhFRCDBmdm6Cf_xfyqWSZefL3e_zw5_8dqn+45V2+q6WjaTQ@mail.gmail.com>
References: <20200311105930.21564-1-glex.spb@gmail.com>
 <20200311191141.16295-1-glex.spb@gmail.com>
 <CADjhFRCDBmdm6Cf_xfyqWSZefL3e_zw5_8dqn+45V2+q6WjaTQ@mail.gmail.com>
Message-ID: <20200311213339.GD705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gleb, All,

On 2020-03-11 19:15 +0000, Gleb Mazovetskiy spake thusly:
> I've sent the updated patch using the following command but it appeared as an independent patch in patchwork:
> git send-email --to [1]buildroot at buildroot.org --cc "Eric Le Bihan < [2]eric.le.bihan.dev@free.fr>"
> outgoing/0001-package-pkg-meson.mk-Fix-cross-compilation.conf.patch --in-reply-to [3]20200311105930.21564-1-glex.spb at gmail.com
> What am I doing wrong?

Nothing wrong, that's expected: new iterations do not automatically mark
the older ones as superseded.

Regards,
Yann E. MORIN.

> On Wed, Mar 11, 2020 at 7:11 PM Gleb Mazovetskiy < [4]glex.spb@gmail.com> wrote:
> 
>   $$(STAGING_DIR) -> $(STAGING_DIR) in PKG_MESON_INSTALL_CROSS_CONF.
> 
>   $$ resulted in `$(STAGING_DIR)` in the file instead of the expanded
>   value.
> 
>   Note that this change only affects the etc config at:
>   host/etc/meson/cross-compilation.conf
> 
>   Per-package cross-compilation.conf files are already correct.
> 
>   Reviewed-by: Peter Seiderer < [5]ps.report@gmx.net>
>   Signed-off-by: Gleb Mazovetskiy < [6]glex.spb@gmail.com>
>   ---
>   ?package/ [7]pkg-meson.mk | 2 +-
>   ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
>   diff --git a/package/ [8]pkg-meson.mk b/package/ [9]pkg-meson.mk
>   index 642b715938..416129f6fe 100644
>   --- a/package/ [10]pkg-meson.mk
>   +++ b/package/ [11]pkg-meson.mk
>   @@ -193,7 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
>   ? ? ? ? ? ? -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
>   ? ? ? ? ? ? -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g'
>   \
>   ? ? ? ? ? ? -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
>   -? ? ? ? ? ?-e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
>   +? ? ? ? ? ?-e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
>   ? ? ? ? ? ? $(HOST_MESON_PKGDIR)/ [12]cross-compilation.conf.in \
>   ? ? ? ? ? ? > $(HOST_DIR)/etc/meson/ [13]cross-compilation.conf.in
>   ? ? ? ? sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
>   --
>   2.20.1
> 
> Links:
> 1. mailto:buildroot at buildroot.org
> 2. mailto:eric.le.bihan.dev at free.fr
> 3. mailto:20200311105930.21564-1-glex.spb at gmail.com
> 4. mailto:glex.spb at gmail.com
> 5. mailto:ps.report at gmx.net
> 6. mailto:glex.spb at gmail.com
> 7. http://pkg-meson.mk
> 8. http://pkg-meson.mk
> 9. http://pkg-meson.mk
> 10. http://pkg-meson.mk
> 11. http://pkg-meson.mk
> 12. http://cross-compilation.conf.in
> 13. http://cross-compilation.conf.in

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
