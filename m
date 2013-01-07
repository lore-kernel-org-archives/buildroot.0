From: Steve Calfee <stevecalfee@gmail.com>
Date: Sun, 6 Jan 2013 18:46:15 -0800
Subject: [Buildroot] [PATCH 1/2] system: set root password only for
 default skeleton
In-Reply-To: <1f2432a8027f1e1c780a45b488be8be03f1b1b93.1357397453.git.yann.morin.1998@free.fr>
References: <cover.1357397453.git.yann.morin.1998@free.fr>
 <1f2432a8027f1e1c780a45b488be8be03f1b1b93.1357397453.git.yann.morin.1998@free.fr>
Message-ID: <CAJJ6jxsFL2Su1Jpxavk6zh7qw8b31gFbFEHyaKUvKLZ9Xtp1pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 5, 2013 at 6:52 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> In case one is using a custom skeleton, the root pasword might already be
> set in this case, and should not be overriden.
>
> Just ask for (and set) the root password only for the default skeleton.
>
> Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Hi Yann, all,

This is another change that in my opinion goes against the philosophy
of buildroot. It is another change that tries to make BR a swiss army
knife, (can do anything, nothing well). I would prefer a stiletto or
Bowie Knife - good for one thing, but very good at that.

Why do we need yet another change to enable something easily done with
the post build patch script? An easily built bsp skeleton with an
etc/shadow file handles this beautifully. This kind of creeping
feature requires maintenance, documentation etc. Why?

We need to separate people who build things using buildroot and end
users that use those things. Is it real to think an end user will
build from scratch with buildroot? There are full featured
distributions for most popular platforms that contain this kind of
stuff. For true embedded developers, adding more things like this just
complicate things, does not make it easier.

I guess this is the sort of thing it would be good for the European
Buildrooters to discuss at their next conference.

Regards, Steve
