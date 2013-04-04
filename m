From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Apr 2013 13:49:30 +0200
Subject: [Buildroot] TOP_SRCDIR:  Where is it defined?
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C610C1A21F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C610C1A21F@ex-mb1.corp.adtran.com>
Message-ID: <515D68CA.5080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/03/13 21:16, ANDY KENNEDY wrote:
> Within the pkg-generic file, TOP_SRCDIR is used to define
> $(PKG)_DIR_PREFIX:
>
> buildroot-2013.02$ grep -R "TOP_SRCDIR" .
> grep: ./system/skeleton/dev/log: No such file or directory
> grep: ./system/skeleton/etc/resolv.conf: No such file or directory
> ./package/pkg-generic.mk:$(2)_DIR_PREFIX                        = $(if $(4),$(4),$(TOP_SRCDIR)/package)

  You're right, TOP_SRCDIR is never defined, and never has been. The 
whole condition can be removed.


> This would be a problem only for some entity (which didn't set $4 to
> $(call pkgparentdir)) directly calling inner-generic-package as
> generic-package does do the call to pkgparentdir.

  But since nobody should be calling the inner- macros, this shouldn't be 
a problem :-)


  Regards,
  Arnout


> I'm just thinking this should be changed, however, I'm clueless about
> the vision the developer who added this had in mind for TOP_SRCDIR, so
> I have no suggestion how to change it.
>
> FWIW,
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
