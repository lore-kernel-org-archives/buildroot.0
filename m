From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 19:19:05 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007165956.GE9561@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <30033387.d25L1SpIx8@sagittae> <20131007140733.173904b6@skate>
 <20131007164829.GB9561@free.fr> <20131007165956.GE9561@free.fr>
Message-ID: <20131007191905.7715dd69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 7 Oct 2013 18:59:56 +0200, Yann E. MORIN wrote:

> > It would then be the responsibility of the user to provide such a
> > script. We could provide a simple script that just do this logging as an
> > example.
> 
> I have another interesting idea about such a script: detect whether a
> package overwrites or otherwise modifies a file already existing in
> staging/ and/or target/ to assess for the sanity of the packaging.

I believe there are cases where we are doing this today, and where it
is valid. Think for example the full-blown versions of some commands
that overwrite the symbolic link installed by Busybox.

> We could also add another sanity-check to look at build issues (eg.
> build-path in RPATH, build-path in scripts...).

Right! However, I don't see why those checks should be in some external
scripts that the user should install. I believe those checks should be
part of the Buildroot core, possibly with a Config.in option to decide
whether a check failure should result to a global build failure or just
a warning (default value would be a warning, a global build failure
could be used in the autobuilders, for example).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
