From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:47 +0200
Subject: [Buildroot] [PATCH/RFC] Download sources from Git (and more)
Message-ID: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset is a tentative generalization of the DOWNLOAD macro, as
recently discussed in mailing-list, in order to allow BR to obtain
package sources not only as tar files from http/ftp, but also using
other protocols.

I borrowed some pieces of code from Quotient Remainder's patch, but this
approach is substiatially different.

The feature list is short: I deliberately wanted to be minimalistic
but set up a clean infrastructure that can be extended later.

Even though these patches are quite polished, please consider them as
a proposal for discussion. If there is general consensus about the way
I propose, I'll be glad to add a bit of user documentation as well.

In the first two patches I prepare the ground by making the download
infrastructure more general. The DOWNLOAD function is replaced by a
per-package $(PKG)_DOWNLOAD, whose value is computed automatically
from the site URL but can be overridden. The good old wget system is
modified to fit in the new framework.

In the third and fourth commit I add DOWNLOAD_GIT, which is relatively
straightforward given the whole infrastructure is already in place.
The place where the repository should be cloned might not be appreciated,
but I definitely think it should go in output/, as it is part of
buildroot's -well- output, not of the package "recipe".

The last patch is surely *not* meant to be committed. It's just a
minimalistic example of a package downloaded via Git, and would be
replaced by user docs as stated above.

Luca
