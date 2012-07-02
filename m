From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 02 Jul 2012 09:58:17 +0200
Subject: [Buildroot] [PATCH v2 1/3] pkg-infra: add XXXTARGETS_HOST macro
In-Reply-To: <1341090872-12266-1-git-send-email-arnout@mind.be>
References: <1341090872-12266-1-git-send-email-arnout@mind.be>
Message-ID: <4FF15499.4090401@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle (Essensium/Mind) wrote:
> Create GENTARGETS_HOST, AUTOTARGETS_HOST and CMAKETARGETS_HOST
> macro.  Such a macro is more intuitive to use than the
> $(call ...,host) construct.  Also it speeds things up by having
> one less $(call ...) evaluation.
>
> Also includes documentation update, but not for buildroot.html.
>
> This brings the time for 'make -qp' (which is used by bash-completion)
> down from 1.85s to 1.35s on my laptop.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Very nice cleanup!

However, the patchesas you sent themdo not apply with git am. For packages
that have both host and target variant (such as syslinux), patch3/3 does not
like to sit on top of 2/3.

Once this is fixed:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
