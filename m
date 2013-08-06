From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 00:18:37 +0200
Subject: [Buildroot] [PATCH 2/5] manual: add patch revision and
 versioning section
In-Reply-To: <1375824984-8226-3-git-send-email-s.martin49@gmail.com>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
 <1375824984-8226-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20130807001837.4ea03d9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue,  6 Aug 2013 23:36:21 +0200, Samuel Martin wrote:
> From: Vinicius Tinti <viniciustinti@gmail.com>
> 
> Improve the contribute manual section by adding an explanation about patch
> review and version.
> 
> The section now provides advices in how to respond maintainers requests and how
> to proceed on replying them.

I am not entirely happy with the below text, as it doesn't make the
difference between a simple patch, in which the changelog is typically
included below the '---' sign, and a patch series, where there is the
notion of cover letter that usually includes the changelog.

> +Sometimes, changes will be requested to your patch before getting merged.

This is rather strange way of starting this section, me thinks.

> +Whenever it happens, the new revision of the pacthset should include a

patchset.

> +changelog of the modifications between each submission, and being reposted,
> +as much as possible, as response to the original thread.

Except that this clearly isn't the most common practice in the
Buildroot community. We generally post updated versions of patches as a
new thread. I'm not saying this is good or bad, I'm just observing the
current common practice, and I'm seeing that it doesn't match what this
documentation is saying.

> +Patch revision changelog
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +When editing your commit, below the +signed-off-by+ section, add +---+, then

Signed-off-by.

> +and your changelog below.
> +
> +Although the changelog will be visible for the reviewers in the mail
> +thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
> +will automatically ignore lines below +---+ when the patch will be
> +merged.
> +
> +For longer series, a per-patch changelog should be placed in each commit,
> +and the cover letter must contain a summary of these changes.
> +
> +The following suggested layout example is not mandatory.

Why? It *is* mandatory.

> +
> +---------------
> +Patch title less than 80-character length
> +
> +Some paragraph describing what the patch does and why

Some more paragraph giving some more details.

And yet another paragraph giving more details.

> +
> +Signed-off-by John Doe <john.doe@noname.org>
> +
> +---
> +Changes v2 -> v3:
> +  - foo bar  (suggested by Jane)
> +  - bar buz
> +
> +Changes v1 -> v2:
> +  - alpha bravo  (suggested by John)
> +  - charly delta
> +---------------
> +
> +Any patch revision should include the version number. The version number
> +is simply composed by the letter +v+ followed by an +integer+ greater or
> +equal 2 (two) (i.e. "PATCH v2", "PATCH v3" ...).
> +
> +This can be easly handle in +git-format-patch+ command by using the option
> ++--subject-prefix+:
> +
> +---------------------
> + $ git format-patch --subject-prefix "PATCH v4" -M -n -s -o outgoing origin/master
> +---------------------

-n is the default, maybe we could remove it.
-o outgoing is not really needed here

> +Keeping patch revision in the same thread
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Mail clients will handle this automatically reply in the same thread but
> ++git+ won't.
> +
> +Hence the +--in-reply-to+ option in +git-send-email+ must be used.
> +Get the last +Message-ID+ (it can be found your mail client by accessing
> +the raw mail). Then use this message id to send your revision patch:
> +
> +---------------------
> + $ git send-email --to buildroot at busybox.net --in-reply-to mymsgid at noname.org outgoing/*
> +---------------------

See my earlier comment about this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
