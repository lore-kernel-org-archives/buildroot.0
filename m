From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 11:26:38 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
 <20150319101643.6a4eeed3@free-electrons.com>
 <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
Message-ID: <20150319112638.6e5fc986@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, 19 Mar 2015 10:34:47 +0100, Angelo Compagnucci wrote:

> > Patchwork is an open-source project, the code base is pretty small and
> > easy, so feel free to contribute improvements!
> 
> Why not, I will try to take a look, I'm really acquainted to web
> programming with various web frameworks.

It's written in Django, and the code base is small as I said, so should
be easy to get involved. And the maintainer is also very nice, so
contributing shouldn't be a problem. patchwork's maintainer is even
using Buildroot himself, and he has contributed a number of patches, so
the project is definitely not unknown to him.

> > What you could do however, since patchwork has the complete e-mails, is
> > create a "Reply" button next to each patch in patchwork, that would
> > open up the patch and format a reply to it so that you can review the
> > patch.
> 
> Yes, this is exactly what I'm thinking. I'm making some experiments
> with http://getbarkeep.org, it's email based and has really a nice
> review system, get a look at the video. Patchworks should offer
> something similar.

I had a quick look at barkeep, but it seems that the workflow they have
is completely different than the one we want and use in the Buildroot
community. From
https://github.com/ooyala/barkeep/wiki/Comparing-Barkeep-to-other-code-review-tools,
it says:

  Barkeep was built at Ooyala, where we usually prefer a post-commit
  code review workflow for our products. This is where developers push
  to master as soon as their code is ready (i.e. looks nice, tests are
  written and pass) so other developers can begin integrating it. Code
  review happens when it's convenient for the team (within 1-2 days),
  and any comments are addressed in future commits.

This is definitely not the workflow we use today, and probably not the
one we would like to use.

> > Also, often people complaining about e-mail and wanting to use
> > web-based stuff instead is because their e-mail client or e-mail setup
> > in general sucks. Do you have a good and efficient e-mail client? If
> > you don't, then the issue might be here.
> 
> Gmail is a good email client, no problems here. But if our mail
> clients are easy to use, why there are patches as old as February
> 2014?

Because the problem is not tools, but time. We've got more and more
patches contributing, but not enough people helping with
reviewing/testing. So far, it's almost only Arnout, Yann, Peter, Baruch
and me doing regularly code reviews. Vicente is also helping by testing
patches. We need more people involved in the review process.

Also, on a number of pending patches, the reason they get stuck is
because they raise some questions/challenges that need to be discussed.
Something like just new package or a package bump that does not do
anything fancy is easy to review and merge. But something like the
per-package sysroot directory from Fabio, or some other big series,
require a lot more discussion / review because it's changing a lot of
things.

But indeed, having a way to categorize patches in patchwork would be
good. Maybe a simple tag system, so that we can associate random tags
to patches, and classify using that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
