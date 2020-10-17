From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:52:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix uclibc build with
 openldap
In-Reply-To: <20200516162731.1708912-1-fontaine.fabrice@gmail.com>
References: <20200516162731.1708912-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017145230.797d742d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 May 2020 18:27:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...st.c-include-stdint.h-before-cmoka.h.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch

Applied to master, thanks. Could you submit the patch upstream? A
similar issue was reported at
https://gitlab.com/cmocka/cmocka/-/issues/7 and fixed in
https://gitlab.com/cmocka/cmocka/-/commit/dd8449ae3ba7fd05ac172f0227cd93af7f37005e.
I looked briefly, and the problem is that cmocka.h wants to define its
own uintptr_t, and it does it in a way that is broken for mips64. As
explained in the bug report, cmocka.h should probably not try to define
its own uintptr_t, and should instead always rely on the one provided
by stdint.h.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
