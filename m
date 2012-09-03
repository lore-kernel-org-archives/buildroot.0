From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 11:09:52 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: ensure gettext gets built
 before all other packages
In-Reply-To: <5043C1F8.6020801@mind.be>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
 <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
 <5043C1F8.6020801@mind.be>
Message-ID: <20120903110952.6998fa01@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 02 Sep 2012 22:30:48 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I don't like this.  I don't like the idea of having redundant
> dependencies, I don't like to have a single thing that everything
> depends on, I don't like the $(filter-out ...) construct.
> 
>   I also don't like that it breaks the build when the toolchain
> depends on some package (sstrip, ccache, ...).
> 
>   Possible alternatives:
> 
>   * Use a construct similar to patch 11/12: $(gettext-dependency)
> which is nothing unless gettext is enabled.
> 
>   * Move this dependency into the toolchain logic - which means
> duplicating it three times so maybe not such a good idea...

I don't like it either, and I don't think I like those alternatives
either.

I prefer keeping the explicit dependency in the packages, because I
don't like things that are too magic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
