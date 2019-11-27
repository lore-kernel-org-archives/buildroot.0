From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 27 Nov 2019 08:54:25 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: fix reconfigure for
 kconfig packages
In-Reply-To: <a0642eaa-fb56-84c2-b38c-09f174e0954b@mind.be>
References: <20191124231002.32255-1-angelo@amarulasolutions.com>
 <20191125183248.2a9b409d@windsurf>
 <a0642eaa-fb56-84c2-b38c-09f174e0954b@mind.be>
Message-ID: <CA+_SqVaqhby1qo9DrvDrSF8XqZZ1CPQr0rF6wEsDbT--gjGWcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 26, 2019 at 11:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 25/11/2019 18:32, Thomas Petazzoni wrote:
> > However, there seems to be some disagreement on IRC where
> > "foo-reconfigure" on a kconfig package implies that the configuration
> > of the package is completely regenerated, therefore losing any local
> > change that may have been done using "foo-menuconfig". We need to sort
> > out this disagreement before we can merge a patch like this.
>
>  The word "reconfigure" by itself could mean either option: run 'olddefconfig'
> on the current .config (which is what is done now), or recreate the .config from
> its inputs (which is what this patch makes it do).
>
>  I think the latter is a *lot* more useful than the former. The current
> situation is only useful if you're either modifying the .config directly
> (without foo-menuconfig), or if you're modifying the Kconfig files in an
> OVERRIDE_SRCDIR. Modifying the .config directly is clearly not something we need
> to support. Modifying Kconfig files in OVERRIDE_SRCDIR is something we should
> support, but even then it makes a lot of sense to reconstruct the .config from
> the inputs rather than trying to reuse the locally modified .config.
>
>  Bottom line: I think it's a good change (if done in pkg-kconfig like Thomas
> proposed).

FIY: https://patchwork.ozlabs.org/patch/1201052/

The latest iteration of the patch!

Thanks!

>
>  It'll need to be mentioned in the release notes however.
>
>  Regards,
>  Arnout
>
