From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 18:22:53 +0200
Subject: [Buildroot] [PATCH 08/35] packages: apply custom patches using
 *.patch instead of <pkg>-*.patch
In-Reply-To: <20150330092951.7ec4a63d@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150329213551.GI4093@free.fr>
 <20150330092951.7ec4a63d@free-electrons.com>
Message-ID: <20150330162253.GA4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-30 09:29 +0200, Thomas Petazzoni spake thusly:
> On Sun, 29 Mar 2015 23:35:51 +0200, Yann E. MORIN wrote:
> 
> > At first, I was wondering if we could not simply get rid of al those
> > custom hooks, and do something like:
> > 
> >     BR2_GLOBAL_PATCH_DIR += $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)
> > 
> > and so on for the others.
> > 
> > But it turns out that we're only looking into sub-directories of
> > BR2_GLOBAL_PATCH_DIR, so the above sould not work.
> 
> No, it does not work, because BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
> is directly the directory where the patches are, while
> BR2_GLOBAL_PATCH_DIR expects the at91bootstrap patches to be in an
> at91boostrap/ directory.

Yup, that was my conclusion, too.

> > Second, I'm afraid this would break the case where someone has all the
> > patches in a single directory, and use the 'package' prefix to
> > differentiate what package a patch would apply, like so:
> > 
> >     /path/to/my/patches/at91bootstrap-patch-1.patch
> >     /path/to/my/patches/at91bootstrap3-patch-1.patch
> >     /path/to/my/patches/barebox-patch-1.patch
> >     /path/to/my/patches/linux-patch-1.patch
> >     ...
> > 
> > This change would break that setup, would it not?
> 
> Yes, it would. But on the previous iterations of those patches, Arnout
> said it was OK to break this setup. See
> http://lists.busybox.net/pipermail/buildroot/2015-March/123006.html.

Yup, that was my conclusion, too.

:-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
