From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 19:25:54 +0200
Subject: [Buildroot] [PATCH 1/1] qt: make installation of translation
 files optional
In-Reply-To: <53EB6F3C.7060302@lucaceresoli.net>
References: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
 <53EB6F3C.7060302@lucaceresoli.net>
Message-ID: <20140813192554.4bff7b3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 13 Aug 2014 15:59:24 +0200, Luca Ceresoli wrote:

> > Note: the new option is defaulted to "y", to match the current qt.mk operation.
> 
> I'm not sure this is a good default value.
> Surely it preserves backward compatibility with Buildroot versions since
> 2013.11, when the installation got introduced. But for years the
> translation files were never installed, and apparently it was not a
> problem to anybody.
> 
> The size is very large for some embedded systems. I have Qt-based
> systems working since years and never needed them. I have one that is
> around 17 MB, becomes 25 MB with translations!
> 
> Danomi, Vivien, can you explain exactly what these translations are and
> when they are needed?

When applying the patch, I also hesitated a bit on the default value,
and I was tempted to change Danomi's patch to *not* install the
translation files by default. But then, I saw the argument of keeping
the existing behavior, and decided to apply Danomi's patch as is, with
the "default y".

That being said, I am personally completely fine with having this
option default disabled. I think it makes sense to have a lightweight
system by default, so I will support a patch changing the default value
for this option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
