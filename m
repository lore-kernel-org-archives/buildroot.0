From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Sun, 26 Dec 2010 00:25:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.package.in: Added BZR
	download support
In-Reply-To: <878vzdpjt8.fsf@macbook.be.48ers.dk>
References: <cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<ac294cf557f0d6053373d9af3471300a12f28d1c.1293210451.git.thomas.petazzoni@free-electrons.com>
	<878vzdpjt8.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimRPGKcst-pgrPt-135P2BaBy1V0+p2nEBoNCNK@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/12/25 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> ?Thomas> From: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ?Thomas> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ?Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ?Thomas> ---
> ?Thomas> ?package/Makefile.package.in | ? 39 ++++++++++++++++++++++++++++-----------
> ?Thomas> ?1 files changed, 28 insertions(+), 11 deletions(-)
>
> ?Thomas> +define DOWNLOAD_BZR
> ?Thomas> + ? ? ?test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> ?Thomas> + ? ? ?$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
>
> Shouldn't this make a tarball like the git/svn versions do?

Bzr exports directly into a tarball:
http://doc.bazaar.canonical.com/bzr.2.2/en/user-reference/export-help.html
