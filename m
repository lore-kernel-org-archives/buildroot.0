From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Dec 2017 14:21:04 +0100
Subject: [Buildroot] [PATCH] omxplayer: bump to version 2ee17b2
In-Reply-To: <fad21345-7cfa-4f09-e1b2-f147bc6e2e1a@fln.lt>
References: <fad21345-7cfa-4f09-e1b2-f147bc6e2e1a@fln.lt>
Message-ID: <20171201132104.GA2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julius, All,

On 2017-12-01 02:02 +0200, buildroot.org at fln.lt spake thusly:
> This patch updates omxplayer package to the latest commit on master.
> 
> Latest omxplayer version no longer have broken cross-compile support in
> Makefile.include file, but still contains some hard-coded include paths
> that needs to be replaced before building.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

Your From adress does not match your SoB line, above. Please use your
real name as the From field when sending patches to Buildroot.

Also, we have a script utils/get-developer which returns the list of
person interested in specific packages. You can use that script to see
who to add in Cc of your patch:

With committed changes:

    $ git show |./utils/get-developers -
    git send-email --to buildroot at buildroot.org --cc "Yann E. MORIN <yann.morin.1998@free.fr>"

Or manually:

    $ ./utils/get-developers -p omxplayer
    Yann E. MORIN <yann.morin.1998@free.fr>

;-)

> ---
>  .../0001-Makefiles-clean-up-the-cruft.patch        | 67 ----------------------
>  package/omxplayer/0001-cleanup-Makefile.patch      | 18 ++++++
>  package/omxplayer/omxplayer.hash                   |  4 +-
>  package/omxplayer/omxplayer.mk                     |  9 +--
>  4 files changed, 21 insertions(+), 77 deletions(-)
>  delete mode 100644 package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
>  create mode 100644 package/omxplayer/0001-cleanup-Makefile.patch
> 
> diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
> deleted file mode 100644

I like it 100% when my patches get dropped. :-)

> diff --git a/package/omxplayer/0001-cleanup-Makefile.patch b/package/omxplayer/0001-cleanup-Makefile.patch
> new file mode 100644
> index 0000000000..d91e2e4fe9
> --- /dev/null
> +++ b/package/omxplayer/0001-cleanup-Makefile.patch

However, I like it much less when new patches are added, which do not
have a commit log and a SoB line for themselves.

Also, since omxplayer is using git, we want to use git-fiormatted
patches.

Please see how the patch you are removing was formatted.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
