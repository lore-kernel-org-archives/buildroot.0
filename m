From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:49:06 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1500561321-6623-4-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
Message-ID: <20170720224906.301f524a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:35:14 +0200, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This commit introduces the script "fix-rpath" able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> The RPATH fixup is done by the patchelf utility using the option
> "--make-rpath-relative <root-directory>".
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/scripts/fix-rpath | 133 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100755 support/scripts/fix-rpath

I've applied to master, after removing trailing slashes.

However, I noticed that when patchelf is not available in HOST_DIR,
this script does nothing, but doesn't show any error:

thomas at windsurf:~/projets/buildroot (master)$ rm output/host/usr/bin/patchelf 
thomas at windsurf:~/projets/buildroot (master)$ make
[...]
>>>   Sanitizing RPATH in target tree
/home/thomas/projets/buildroot/support/scripts/fix-rpath target
thomas at windsurf:~/projets/buildroot (master)$

This is a little bit disturbing, so I believe it should be fixed in a
follow-up patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
