From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 13 Aug 2014 15:59:24 +0200
Subject: [Buildroot] [PATCH 1/1] qt: make installation of translation
 files optional
In-Reply-To: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
References: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <53EB6F3C.7060302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi, Vivien,

[Copying Vivien as the author of commit 93917b6980f7, which originated
the issue.]

I have a comment on this patch, even though it has already been
committed.

Danomi Manchego wrote:
> Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e introduced the
> installation of the binary .qm translation files, unconditionally.
> This patch introduces an option to disable this behavior, saving
> almost 8MB of space.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> Note: the new option is defaulted to "y", to match the current qt.mk operation.

I'm not sure this is a good default value.
Surely it preserves backward compatibility with Buildroot versions since
2013.11, when the installation got introduced. But for years the
translation files were never installed, and apparently it was not a
problem to anybody.

The size is very large for some embedded systems. I have Qt-based
systems working since years and never needed them. I have one that is
around 17 MB, becomes 25 MB with translations!

Danomi, Vivien, can you explain exactly what these translations are and
when they are needed?

Unless there is a good reason to have the translations on most targets
I would change the default to no in order to preserve new users from an
unnoticed extra size that might be unneeded.

If you agree, I'd send a patch to change this.

Thanks.
-- 
Luca
