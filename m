From: xu min <xuminready@gmail.com>
Date: Mon, 4 Jun 2018 00:30:08 -0700
Subject: [Buildroot] [PATCH v3 2/2] shadowsocks-libev: bump to version
 3.2.0 add a patch for libipset licence add hashes for the license files Fix
 shadowsocks-libev.mk
In-Reply-To: <20180603203735.6b123022@windsurf>
References: <20180530221315.19012-1-xuminready@gmail.com>
 <20180530221315.19012-2-xuminready@gmail.com>
 <20180603203735.6b123022@windsurf>
Message-ID: <CAMpS7mTCpgZyfQa_mkBtL1_nbJVy=kftJvyQEXpvahB0h+26bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your help. I merged 2 patches into 1. And resubmitted my new
patch. https://patchwork.ozlabs.org/patch/924855/

Please notice, the shadowsocks-libev tarball does not include libipset's
license, I add a patch for its license which I found from libipset's git
repo. https://github.com/shadowsocks/ipset/

This is my first contributions to Buildroot using patchwork and git. Thank
you for your help.

MinXu

On Sun, Jun 3, 2018 at 11:37 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello!
>
> Thanks for this contribution!
>
> On Wed, 30 May 2018 15:13:14 -0700, Min Xu wrote:
> > Signed-off-by: Min Xu <xuminready@gmail.com>
> > ---
> >  .../0001-docs-add-BSD-3-Clause-licence.patch       | 52
> ++++++++++++++++++++++
> >  package/shadowsocks-libev/shadowsocks-libev.hash   |  8 +++-
> >  package/shadowsocks-libev/shadowsocks-libev.mk     |  9 ++--
> >  3 files changed, 63 insertions(+), 6 deletions(-)
> >  create mode 100644 package/shadowsocks-libev/
> 0001-docs-add-BSD-3-Clause-licence.patch
>
> All those changes should be part of the patch adding the
> shadowsocks-libev package. If you're not familiar with Git, then look
> at using "git rebase --interactive", it allows you to rewrite the
> commit history.
>
> In your case, you would have to do:
>
> $ git rebase --interactive HEAD~2
>
> This opens up your text editor, with two lines, one for each of your
> two commits. On the second line, change the "pick" word for "fixup",
> and exit your text editor.
>
> This will rewrite the two commits by merging the second one into the
> first one.
>
> > diff --git a/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> > new file mode 100644
> > index 0000000..64dda02
> > --- /dev/null
> > +++ b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> > @@ -0,0 +1,52 @@
> > +From 0047295445c499e010706598c50f1bff8b0d632c Mon Sep 17 00:00:00 2001
> > +From: Min Xu <xuminready@gmail.com>
> > +Date: Wed, 30 May 2018 13:16:12 -0700
> > +Subject: [PATCH] docs: add BSD-3-Clause licence
> > +
> > +add missing licence for shadowsocks-libev/libipset
> > +
> > +Signed-off-by: Min Xu <xuminready@gmail.com>
>
> I'm not sure it makes a lot of sense to add a patch adding the license
> file, especially if the patch is not blessed by upstream.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 

*Best Regards*

*XuMin's Ready?*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/bc304c10/attachment.html>
