From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 23:41:26 +0200
Subject: [Buildroot] [PATCH 0/12 v7] Some download-related changes
 (branch yem/check-downloads)
In-Reply-To: <20140610200831.GC3561@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
 <CAAXf6LWP75NohFWXmHU4o4xh4jnDJZqe6_9+rpyN1+zeumnqrw@mail.gmail.com>
 <20140610200831.GC3561@free.fr>
Message-ID: <20140610214126.GD3561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2014-06-10 22:08 +0200, Yann E. MORIN spake thusly:
> On 2014-06-10 21:44 +0200, Thomas De Schampheleire spake thusly:
> > On Sun, Jun 8, 2014 at 10:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > [..]
> > > Yann E. MORIN (12):
> > >       Makefile: add BR2_DL_DIR to EXTRA_ENV
> > >       pkg-infra: also set PKGDIR for the download step
> > >       pkg-infra: move the git download helper to a script
> > >       pkg-infra: move the svn download helper to a script
> > >       pkg-infra: move the cvs download helper to a script
> > >       pkg-infra: move the hg download helper to a script
> > >       pkg-infra: move the wget download helper to a script
> > >       pkg-infra: move the bzr download helper to a script
> > >       pkg-infra: don't use DL_DIR as scratchpad for temporary downloads
> > >       pkg-infra: add possiblity to check downloaded files against known hashes
> > >       manual: add documentation about packages' hashes
> > >       package/ca-certificates: add tarball's hashes
> > >
> > >  docs/manual/adding-packages-directory.txt    | 66 ++++++++++++++++++++++
> > >  package/Makefile.in                          |  1 +
> > >  package/ca-certificates/ca-certificates.hash |  3 +
> > >  package/pkg-download.mk                      | 83 ++++++++++++----------------
> > >  package/pkg-generic.mk                       |  1 +
> > >  support/download/bzr                         | 34 ++++++++++++
> > >  support/download/check-hash                  | 77 ++++++++++++++++++++++++++
> > >  support/download/cvs                         | 40 ++++++++++++++
> > >  support/download/git                         | 50 +++++++++++++++++
> > >  support/download/hg                          | 38 +++++++++++++
> > >  support/download/svn                         | 37 +++++++++++++
> > >  support/download/wget                        | 32 +++++++++++
> > >  12 files changed, 413 insertions(+), 49 deletions(-)
> > >  create mode 100644 package/ca-certificates/ca-certificates.hash
> > >  create mode 100755 support/download/bzr
> > >  create mode 100755 support/download/check-hash
> > >  create mode 100755 support/download/cvs
> > >  create mode 100755 support/download/git
> > >  create mode 100755 support/download/hg
> > >  create mode 100755 support/download/svn
> > >  create mode 100755 support/download/wget
> > 
> > Is there any particular reason why the scp and localfiles method was
> > not split to a separate file like the others?
> > One could think this is because they are oneliners, but so is the bzr method...
> 
> There's no real reason. Initially, the series was to check the download
> hashes; it then spiraled out to englobe the helper scripts, but still
> with the ultimate goal of checking the hashes.
> 
> So I was, like, is there a reason to check hashes of locally or
> scp-retrieved packages? My own answer was, no, there's no reason.

And yet, I've converted them over to check the hashes... Weird... :-/

Conversion to script helpers in progress. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
