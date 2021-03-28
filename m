From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:24:44 +0200
Subject: [Buildroot] [PATCH] package/perl: fix configure when
 BR2_VERSION_FULL contains a '/'
In-Reply-To: <20210327224220.961977-1-yann.morin.1998@free.fr>
References: <20210327224220.961977-1-yann.morin.1998@free.fr>
Message-ID: <20210328212444.4007f725@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Mar 2021 23:42:20 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> When BR2_VERSION_FULL contains one or more '/', injection our version
> in the perl patch-level fails:
> 
>     /usr/bin/sed: -e expression #1, char 27: unknown option to `s'
> 
> When the build is done in a git tree, and HEAD is a tag, BR2_VERSION_FULL
> will contain that tag name. Even if not widely common, it is not unusual
> for a tag to contain a '/', and this is perfectly legit in git.
> 
> So, mangle BR2_VERSION_FULL to escape all '/' with a backslash '\', so
> that the sed expression is correct, and so that we eventually have a
> correct pathclevel string in perl's --version output.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
