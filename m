From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 11:50:04 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <CAGduivxeet2u3KqTZfNYPy7bi6ddtmYYLovc5b_cNLvFuNz0pA@mail.gmail.com>
References: <20140609211341.GB10459@ned>
 <CAGduivxeet2u3KqTZfNYPy7bi6ddtmYYLovc5b_cNLvFuNz0pA@mail.gmail.com>
Message-ID: <20140610115004.63c68d6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 10 Jun 2014 09:21:39 +0200, Maxime Hadjinlian wrote:

> > But if a new package target-skeleton is added, what would be the dependency
> > chain? Would `make target-skeleton-rebuild` rebuild... the whole rootfs?
> >
> Actually the package that I have introduced after discussing it with
> Thomas Petazzoni was a package called initscripts and busybox/systemv
> only depends on it. This way, when you chose an init system, it will
> copy the files to the target directory.
> 
> This seems to be less intrusive as the end users would not even notice
> (except the disappearance of the init.d folder when systemd is
> chosen).
> 
> If you have any comments regarding this idea, they are welcomed.
> I'll try and send this patch tonight so we can discuss on the idea
> with some code.

After thinking more about it, I believe it would be even better to have
the whole skeleton as a package. This way, everything installed to
$(TARGET_DIR) comes from a package, and things like my "graph-size"
script do not need to special case the skeleton.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
