From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 25 Jun 2018 23:01:27 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: fix no-check-hash for
 inferred site method
In-Reply-To: <20180625014101.13177-1-ricardo.martincoski@gmail.com>
References: <20180625014101.13177-1-ricardo.martincoski@gmail.com>
Message-ID: <390b1691-6548-abfd-50de-cb642d692b03@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

On 25/06/2018 03:41, Ricardo Martincoski wrote:
> Currently, when the site method is explicitly set to a SCM other than
> git, the main download is correctly excluded from being hash-checked.
> But when the site method is inferred from the site uri, the download
> from a SCM other than git is wrongly being hash-checked.
> 
> Fix this by moving the code that excludes SCM methods from hash-check
> below the code that infers the site method.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> All packages in the tree that use those site methods currently
> explicitly set the site method.
> $ make -s printvars VARS=%_SITE_METHOD | grep '=\(bzr\|cvs\|hg\|svn\)'
> CANFESTIVAL_SITE_METHOD=hg
> DVB_APPS_SITE_METHOD=hg
> FIS_SITE_METHOD=svn
> OPEN2300_SITE_METHOD=svn
> OPENTYRIAN_SITE_METHOD=hg
> PYTHON_NFC_SITE_METHOD=bzr
> PYTHON_PYGAME_SITE_METHOD=hg

Apologies, but I couldn't understand what this commit is supposed to
fix. From your description above I understand you're fixing packages
whose method is inferred (i.e. not explicitly set). But here you list
packages which explicitly set it.

Which one are you fixing exactly? Can you provide an example package
that your patch fixes?

BTW I couldn't find in Buildroot any package whose method is an SCM
other than git and is not explicitly set.

Thanks,
-- 
Luca
