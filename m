From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 18:51:07 +0100
Subject: [Buildroot] [PATCH 2/6] pkg-infra: move git download helper to
 a script
In-Reply-To: <52D3F59E.5090004@lucaceresoli.net>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
 <52D3F59E.5090004@lucaceresoli.net>
Message-ID: <20140113175107.GB3344@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-01-13 15:18 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >The git download helper is getting a bit more complex, and does not
> >raise an error when a PKG_VERSION is a sha1 that does not exist in
> >the repository. Instead, it generates an empty archive.
> >
> >Fixing it in the Makefile proves to be challenging, to say the least.
> >
> >Move it into a shell script in support/download/git, which will make
> >it much easier to read, maintain, fix an enhance in the future.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Peter Korsgaard <jacmet@uclibc.org>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This is a very welcome change, thanks for caring!
> 
> Just a minor note below, but looks ok anyway:
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
[--SNIP--]
> >diff --git a/support/download/git b/support/download/git
> >new file mode 100755
> >index 0000000..99ea1b2
> >--- /dev/null
> >+++ b/support/download/git
> >@@ -0,0 +1,36 @@
> >+#!/bin/sh
> >+set -e
> >+
> >+# Download helper for git
> >+# Call it with:
> >+#   $1: git repo
> >+#   $2: git cset
> >+#   $3: prefix/
> >+#   $4: output file
> >+# And this environment:
> >+#   GIT      :  the git command to call
> >+#   BUILD_DIR:  path to Buildroot's build dir
> >+
> >+repo="${1}"
> >+cset="${2}"
> >+prefix="${3}"
> >+output="${4}"
> >+
> >+pushd "${BUILD_DIR}" >/dev/null
> >+rm -rf .git-tmp-repo    # In case a previous attempt was interrupted
> 
> This rm did not exist in the original version. I would move this into a
> separate commit.

Indeed, I've moved it to the next commit.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
