From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Dec 2015 22:52:20 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <20151219142509.GA3394@free.fr> (Yann E. MORIN's message of "Sat, 
 19 Dec 2015 15:25:09 +0100")
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219150027.72263718@free-electrons.com>
 <20151219142509.GA3394@free.fr>
Message-ID: <874mfchjor.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > I really don't know what to do with git-submodules.

 > But in this precise case, I would:
 >   - dump the cal3d package
 >   - add a post-download hook (or an extra-download URL) to vsxu to also
 >     download cal3d
 >   - add a post-extract hook to vsxu to also extract cal3d in the correct
 >     location.

 > Then, when/if cal3d is later used by other packages, we can revisit the
 > situation.

Yes, I think that makes sense as well.


 > Otherwise, for proper git-submodule handling, we would have to do
 > (roughly):

 >     git clone blabla pkg-version
 >     cd pkg-version
 >     git checkout pkg-version
 >     git submodule update --init --recursive
 >     find . -name .git -exec rm -rf {} +
 >     cd ..
 >     tar czf DL_DIR/pkg-version.tar.gz pkg-version/

 > This is not very complex, but is stil la significant change from our
 > current git wrapper.

Yes, I would prefer if we wouldn't have to do that.

 > And then, what about svn externals? About Hg subrepos? Does bzr also
 > have such a thing?

For svn we create the tarball ourselves, so I believe externals should
work.

I'm not really familiar with hg, but I guess it behaves like git.


 > Note that I would not really mind doing such a change. But is it worth
 > it, given that we currently have only one package that needs submodules?
 > Or do we have others for which we had to "deal with it" in a crude way?

I had a local package at work that originally used git submodules, and
the gstreamer packages use a submodule for "common stuff", so we would
have the issue if we ever moved to getting these from git.

So I think there is a potential use case for it, but it is really quite
a pity that they aren't handled natively by git archive.

Perhaps we should bring it up with the git developers?

-- 
Venlig hilsen,
Peter Korsgaard 
