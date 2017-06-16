From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Jun 2017 22:21:21 +0200
Subject: [Buildroot] [PATCH 1/1] br2-external: Check for invalid
	BR2_EXTERNAL
In-Reply-To: <1497641829-32201-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1497641829-32201-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <81ABDA60-61BD-4563-82DF-E8203033A57C@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On June 16, 2017 9:37:09 PM GMT+02:00, Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>From: Judd Meinders <judd.meinders@rockwellcollins.com>
>
>This patch checks for BR2_EXTERNAL paths that begin with "../" which
>do not work with multiple external support.

What do you consider broken with such relative paths?
Can you provide an example?

Ftr, relative paths are supposed to be supported, so I'd prefer we
fix by allowing rather than excluding it.

Regards,
Yann E. MOIRIN.

>Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
>Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>---
> support/scripts/br2-external | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/support/scripts/br2-external
>b/support/scripts/br2-external
>index 00cb57d..b695400 100755
>--- a/support/scripts/br2-external
>+++ b/support/scripts/br2-external
>@@ -75,6 +75,10 @@ do_validate_one() {
>     local br2_ext="${1}"
>     local br2_name br2_desc n d
> 
>+    # Check for BR2_EXTERNAL paths that begin with "../"
>+    if [[ "${br2_ext}" =~ ^\.\./ ]]; then
>+        error "'%s': BR2_EXTERNAL must begin as an absolute path"
>"${br2_ext}"
>+    fi
>     if [ ! -d "${br2_ext}" ]; then
>         error "'%s': no such file or directory\n" "${br2_ext}"
>     fi


-- 
Sent from my phone. Please excuse my brevity.
