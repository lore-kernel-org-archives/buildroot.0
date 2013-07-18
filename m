From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 10:16:01 +0200
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <CAEBucnAAdKuub3sHu4emRcCj8Kw=O1nE4DDEEFZd2fK4XRCYjg@mail.gmail.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
 <20130716105514.3a6bd85c@skate>
 <CAEBucnCaQXD1Q__3bgx__3BPkNxGybGi5fQZecJ8nUo5zLVAgg@mail.gmail.com>
 <20130716210801.04f8e299@skate>
 <CAEBucnAAdKuub3sHu4emRcCj8Kw=O1nE4DDEEFZd2fK4XRCYjg@mail.gmail.com>
Message-ID: <20130718101601.57ccc624@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 18 Jul 2013 02:21:44 -0500, Spenser Gilliland wrote:

> > Ok. As discussed on IRC, one option would be to extend the download
> > infrastructure to be able to pass the --recursive option to Git. Not
> > sure it's worth the effort for one package though. Maybe what you did
> > with sunxi-mali + sunxi-mali-prop is the simplest option for now. As I
> > noted, it should however be documented.
> 
> Because git-archive does not easily support creating tarballs of git
> submodule based projects, I've decided to keep the current structure.

Right, sounds good to me.

> Just as further discussion, I went down the path of transforming the
> CONFIGURE step into a post extract hook. However, I'm concerned that
> this may cause a race condition if the post-extract-hook occurs before
> sunxi-mali-prop is extracted. Perhaps, this needs to be a post
> configure hook so that the dependency is satisfied.

You are absolutely correct. By the time sunxi-mali is extracted, there
is no guarantee at all that sunxi-mali-prop will be extracted, so my
suggestion of moving the copying of sunxi-mali-prop stuff into
sunxi-mali sources at the extract step clearly doesn't work. Doing it
at the configure stage as you did is the only solution, so you were
right.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
