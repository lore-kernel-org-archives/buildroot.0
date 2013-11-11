From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 14:49:53 +0100
Subject: [Buildroot] [PATCH v8 RESEND 0/8] Add support for top-level
 parallel make
In-Reply-To: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20131111144953.43bd80b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, Arnout,

On Fri, 18 Oct 2013 11:34:12 +0200, Fabio Porcedda wrote:

> this is a patch set for adding support for top-level parallel make in
> buildroot, the common problem scattered in buildroot's top-level
> makefiles is that in the rules it relies on the order of evaluation of
> the prerequisites, to be able to use top-level parallel make instead
> of reling on the left to right ordering of evaluation of the
> prerequisites we must add an explicit rule to describe the
> dependencies.

I'd like to agree on a plan with this patch series. At the latest
Buildroot Developer Day in Edinburgh, I think we agreed that:

 (1) Enabling top-level parallel without having per-package sysroot was
     not desirable, as it would make the builds non-reproducible.

 (2) That being said, Fabio's patches have anyway a merit on their own
     since they make things cleaner, and that therefore, patches 1 to 6
     can be merged. Maybe patch 7 even if I'm not sure it makes sense
     to have it without the top-level parallel build.

What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
