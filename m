From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 10 Jun 2014 17:33:40 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <20140610115004.63c68d6a@free-electrons.com>
References: <20140609211341.GB10459@ned>
 <CAGduivxeet2u3KqTZfNYPy7bi6ddtmYYLovc5b_cNLvFuNz0pA@mail.gmail.com>
 <20140610115004.63c68d6a@free-electrons.com>
Message-ID: <4791738.8uP1XQ7Rq8@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tuesday 10 June 2014 11:50:04 Thomas Petazzoni wrote:
> Dear Maxime Hadjinlian,
> 
> On Tue, 10 Jun 2014 09:21:39 +0200, Maxime Hadjinlian wrote:
> > > But if a new package target-skeleton is added, what would be the
> > > dependency
> > > chain? Would `make target-skeleton-rebuild` rebuild... the whole rootfs?
> > 
> > Actually the package that I have introduced after discussing it with
> > Thomas Petazzoni was a package called initscripts and busybox/systemv
> > only depends on it. This way, when you chose an init system, it will
> > copy the files to the target directory.
> > 
> > This seems to be less intrusive as the end users would not even notice
> > (except the disappearance of the init.d folder when systemd is
> > chosen).
> > 
> > If you have any comments regarding this idea, they are welcomed.
> > I'll try and send this patch tonight so we can discuss on the idea
> > with some code.
> 
> After thinking more about it, I believe it would be even better to have
> the whole skeleton as a package. This way, everything installed to
> $(TARGET_DIR) comes from a package, and things like my "graph-size"
> script do not need to special case the skeleton.

Hmm... This patch seems to be something close to that:
  http://patchwork.ozlabs.org/patch/335963/

I may rework it, if needed.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
