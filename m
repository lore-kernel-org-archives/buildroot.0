From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Nov 2015 14:35:56 +0000
Subject: [Buildroot] [PATCH v5 0/2] package/unscd: new package
In-Reply-To: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <5653244C.7060903@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn, everyone,

just a small question. Perhaps I'm wrong, but..., isn't nscd deprecated
in favor of sssd? If so, shouldn't we add the sssd package instead?

Regards,

Vincent.

On 23/11/15 13:58, Doug Kehn wrote:
> systemd recipe/support is removed. systemd support is best left to someone
> versed in systemd who desires to use unscd with systemd.
> 
> The BR2_GLIBC_NSCD suggestion is incorporated. However, I'm not sure what the
> proper next steps are to properly install glibc nscd for both internal/external
> toolchains. Is it sufficient, for now, to just define BR2_GLIBC_NSCD?
> 
> Doug Kehn (2):
>   package/unscd: new package
>   toolchain/toolchain-common.in: install nscd
> 
>  package/Config.in             |  1 +
>  package/unscd/Config.in       | 11 ++++++++++
>  package/unscd/S46unscd        | 24 ++++++++++++++++++++++
>  package/unscd/unscd.hash      |  3 +++
>  package/unscd/unscd.mk        | 47 +++++++++++++++++++++++++++++++++++++++++++
>  toolchain/toolchain-common.in |  4 ++++
>  6 files changed, 90 insertions(+)
>  create mode 100644 package/unscd/Config.in
>  create mode 100644 package/unscd/S46unscd
>  create mode 100644 package/unscd/unscd.hash
>  create mode 100644 package/unscd/unscd.mk
> 
> --
> Changes v4 -> v5
>   - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
> Changes v3 -> v4
>   - Incorporate feedback/suggestions by Yann and Maxime.
> Changes v2 -> v3
>   - Remove trailing '/' from UNSCD_SITE.
>   - Whitespace cleanup.
> Changes v1 -> v2
>   - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
> 
