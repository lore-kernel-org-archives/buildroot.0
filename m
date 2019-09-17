From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:50:45 +0200
Subject: [Buildroot] [PATCH] package/luksmeta: do not build man pages
In-Reply-To: <20190916135048.5459-1-peter@korsgaard.com>
References: <20190916135048.5459-1-peter@korsgaard.com>
Message-ID: <20190917225045.4901a99e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 15:50:48 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/a6247b95f1578fe1daec485589582310c75b5d84/
> 
> luksmeta-v9 generates man pages at build if a2x is available since:
> 
> commit 3fa51bb22350fee101fc52044949f6eb394114ae
> Author: Daniel Kope?ek <dkopecek@redhat.com>
> Date:   Fri Jul 13 01:52:45 2018 +0200
> 
>    Generate manual page from source during build time
> 
>    If a2x (asciidoc) is not available during configure time,
>    a warning will be generated and the manual page wont be
>    generated nor installed.
> 
> Man pages are not needed on target and the build step fails in certain
> setups, so disable it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/luksmeta/luksmeta.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
