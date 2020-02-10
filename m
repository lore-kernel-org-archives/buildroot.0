From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 11:40:22 +0100
Subject: [Buildroot] [PATCH] package/erlang-p1-xmpp: fix host build
In-Reply-To: <20200202095653.1311254f@windsurf>
References: <20200122103401.21596-1-johan.oudinet@gmail.com>
 <20200202095653.1311254f@windsurf>
Message-ID: <CAJtjsKYi9DkK0vY6+P++kqn==fmUsuusdtjnybs6NB=7g32T6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 2, 2020 at 9:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 22 Jan 2020 11:34:01 +0100
> Johan Oudinet <johan.oudinet@gmail.com> wrote:
>
> >  ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
> >       erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
> > +HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml
>
> It is weird that there is no symmetry between the target dependencies
> and host dependencies. Why don't we have the same set of packages ?

I honestly don't know. I use this package only as a dependency of
ejabberd. So I just check it compiles and ejabberd works correctly
afterwards. This is far from perfect to test if the list of
dependencies is correct.

> Also, it is really normal/correct for the target variant to depend on
> host-erlang-p1-xml ?

I remember I had to add this host dependency to make the target
variant compiles. I also think this is weird. I haven't tested
recently to remove such dependency but I'll try to simplify the
dependencies next time I bump the version of this package.

-- 
Johan
