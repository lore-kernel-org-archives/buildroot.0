From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:35:19 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <20151219142509.GA3394@free.fr>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219150027.72263718@free-electrons.com>
 <20151219142509.GA3394@free.fr>
Message-ID: <20151219153519.38c52050@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 19 Dec 2015 15:25:09 +0100, Yann E. MORIN wrote:

> But in this precise case, I would:
>   - dump the cal3d package
>   - add a post-download hook (or an extra-download URL) to vsxu to also
>     download cal3d

A post-download hook wouldn't play well with "make source", "make
legal-info" and all. We have to take this into account. But an
EXTRA_DOWNLOADS should work fine.

>   - add a post-extract hook to vsxu to also extract cal3d in the correct
>     location.

Could be a solution, I'll try this.

> Otherwise, for proper git-submodule handling, we would have to do
> (roughly):
> 
>     git clone blabla pkg-version
>     cd pkg-version
>     git checkout pkg-version
>     git submodule update --init --recursive
>     find . -name .git -exec rm -rf {} +
>     cd ..
>     tar czf DL_DIR/pkg-version.tar.gz pkg-version/
> 
> This is not very complex, but is stil la significant change from our
> current git wrapper.
> 
> And then, what about svn externals? About Hg subrepos? Does bzr also
> have such a thing?
> 
> Note that I would not really mind doing such a change. But is it worth
> it, given that we currently have only one package that needs submodules?
> Or do we have others for which we had to "deal with it" in a crude way?

I don't want to go down this route for the moment, I'd prefer to see
how many of these git submodule users we have.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
