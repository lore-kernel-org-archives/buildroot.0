From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 13 Mar 2019 00:34:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190312231451.6dde5f3b@windsurf>
References: <20190312222035.16834-1-vadim4j@gmail.com>
 <20190312231451.6dde5f3b@windsurf>
Message-ID: <20190312223430.rwhcsceekzbwgx6q@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 12, 2019 at 11:14:51PM +0100, Thomas Petazzoni wrote:
> Hello Vadim,
> 
> On Wed, 13 Mar 2019 00:20:35 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > Add custom ecryptfs-common script which provides gettext wrapper as
> > function which checks at runtime if there is gettext tool, if no - the
> > "echo" will be used instead. Each script which uses gettext is
> > patched with including this ecryptfs-common script.
> > 
> > The patch for ecryptfs-utils only inserts hard-coded (w/o using
> > @prefix@/lib/@PACKAGE@ variables) path to the ecryptfs-common, it is
> > very small and trivial, it allows to easy support new bumped version.
> > 
> > gettext package is now selected automatically only if NLS is enabled.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  ...cho-instead-of-gettext-if-it-does-not-exi.patch | 117 +++++++++++++++++++++
> >  package/ecryptfs-utils/Config.in                   |   2 +-
> >  package/ecryptfs-utils/ecryptfs-common             |  33 ++++++
> >  package/ecryptfs-utils/ecryptfs-utils.mk           |   6 ++
> >  4 files changed, 157 insertions(+), 1 deletion(-)
> >  create mode 100644 package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch
> >  create mode 100755 package/ecryptfs-utils/ecryptfs-common
> 
> Thanks for this proposal. I would actually perfer if ecryptfs-common
> was part of the ecryptfs-utils patch, and this patch be submitted
> upstream.
> 
Me too, but it requires more work like converting these scripts to *.in
form to be processed by configure because in that case it is better to
use conf variables like:

    . @prefix@/lib/@PACKAGE@

and I am not sure if upstream community would prefer this), but while having
temporary easy solution (provided by this patch) I can work on official
patch in parellel.

My worries related to point that in case upstream will not accept the
better-for-official version it will make harder to maintain such patch
when new ecryptfs-utils version is bumped.

Regards,
Vadim Kochan
