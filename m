From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:19:11 +0200
Subject: [Buildroot] [PATCH v2 1/3] infra: Move --enable/--disable-debug
 to package/Makefile.in
In-Reply-To: <20141019151512.GW4072@free.fr>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019170930.6cfe86d0@free-electrons.com>
 <20141019151512.GW4072@free.fr>
Message-ID: <20141019171911.3634121e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Oct 2014 17:15:12 +0200, Yann E. MORIN wrote:

> > Patches 1 and 2 applied. For patch 3, I'm a bit hesitant: there are
> > only two packages using --disable-gtk-doc-html. Does it really make
> > sense to factorize that in the package infrastructure?
> > 
> > Cc'ing Yann to get his input, since he Reviewed-by the patc in question.
> 
> Well, my Reviewed-by means just that: I reviewed it, and found it was
> correct. It does not mean I think it should go in.
> 
> However, I do believe it should go in. The more generic stuff we move
> into the infra, the easier it will get to review packages.
> 
> And since we already have four documentation-rleated switches, it makes
> sense to add another one. Further more, we do have --disable-gtk-doc, so
> adding --disable-gtk-doc-html really makes sense, for consistency.

Well, my personal opinion is that --disable-gtk-doc already shouldn't
have gone to the common package infra. It's far from being a generic
autoconf option, and therefore it generates warnings for many
many ./configure invocations. But the general opinion didn't agree with
mine :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
