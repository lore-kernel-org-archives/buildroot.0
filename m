From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Jan 2014 07:16:25 +0200
Subject: [Buildroot] [PATCH] manual/faq: add section about why no binary
 packages
In-Reply-To: <1388954663-5692-2-git-send-email-yann.morin.1998@free.fr>
References: <1388954663-5692-1-git-send-email-yann.morin.1998@free.fr>
 <1388954663-5692-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140106051625.GD7812@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jan 05, 2014 at 09:44:23PM +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> It somes up evry now and then on the list, so better be prepared to
> point at the manual, rather than rehash the same evry time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/faq-troubleshooting.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 4e0612b..e97457a 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -111,3 +111,24 @@ directory as the new root, will most likely fail.
>  If you want to run the target filesystem inside a chroot, or as an NFS
>  root, then use the tarball image generated in +images/+ and extract it
>  as root.
> +
> +[[faq-no-binary-packages]]
> +Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
> +----------------------------------------------------------------
> +
> +Buildroot explicitly avoids generating binary packages, on purpose.
> +
> +Buildroot strive at making it easy to generate a root filesystem (hence
> +the name, by the way). That is what we want to make Buildroot good at:
> +building root filesystems.
> +
> +Buildroot is not meant to be a distribution (or rather, a distribution
> +generator). It is the opinion of most Buildroot developpers (me included)
> +that this is not a goal we should pursue. We believe that there are other
> +tools better suited to generate a distro than Buildroot is. For example,
> +http://openembedded.org/[Open Embedded], or https://openwrt.org/[openWRT],
> +are such tools.
> +
> +Rather, we prefer to push Buildroot in a direction that makes it easy
> +(or even easier) to generate complete root filesystems. This is what
> +makes Buildroot stands out in the crowd (among other things, of course!).

Thanks for working on this. I think it is also worth mentioning the rationale. 
By doing source only we avoid the complexity of handling installation time 
dependency tracking and resolution. We also don't need to track what files 
each package installs. This makes Buildroot simpler and easier to work with.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
