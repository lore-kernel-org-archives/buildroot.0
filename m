From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 20:53:55 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <201209182328.38581.yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
 <20120918195518.163c409d@skate>
 <201209182328.38581.yann.morin.1998@free.fr>
Message-ID: <20120920205355.29c30a7d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Sep 2012 23:28:38 +0200, Yann E. MORIN wrote:

> I agree that this is somewhat crossing the line. But I also believe this
> change would make it easier to maintain packages, with a single, right way
> of expressing the dependency, and a single place we'd have to change if
> we'd have to, rather than scouting the tree for packages that needs gettext
> feature (although a trivial grep would probably do the trick, granted).
> 
> Also, leaving packages do the conditional test opens the door to packages
> doing it in their own way, eg:
> 
>   if BR2_NEEDS_GETTEXT
>   FOO_DEPS += gettext
>   endif
> 
> vs.
> 
>   FOO_DEPS += $(if $(BR2_NEEDS_GETTEXT),gettext)

Those two ways are identical, so I don't mind what packages do between
both cases. Depending on how the package .mk file is written, one way
or the other might make more sense.

> OK, so here's what I suggest:
>   - fix the 4 gettext mis-constructs in packages, as you pointed out in
>     another mail,
>   - split the gettext abstraction in two parts: one for the Config.in stuff,
>     and a second for the .mk stuff.
> 
> This way, at least the part of the series that we all agree on can be merged,
> and the litiguous parts can be refined/dropped.
> 
> Does that sound OK?

I am all in favor of merging your entire patch series, but I remain
unconvinced on just the .mk macros themselves. That said, it seems
other people are fine with it, so if it goes in, I will not be overly
shocked. I don't think it's a good direction, but I can live with it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
