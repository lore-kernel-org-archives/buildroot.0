From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Dec 2010 23:30:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.package.in: Added BZR
	download support
In-Reply-To: <ac294cf557f0d6053373d9af3471300a12f28d1c.1293210451.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 24 Dec 2010 18:07:42 +0100")
References: <cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<ac294cf557f0d6053373d9af3471300a12f28d1c.1293210451.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878vzdpjt8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
 Thomas> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Makefile.package.in |   39 ++++++++++++++++++++++++++++-----------
 Thomas>  1 files changed, 28 insertions(+), 11 deletions(-)
 
 Thomas> +define DOWNLOAD_BZR
 Thomas> +	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 Thomas> +	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)

Shouldn't this make a tarball like the git/svn versions do?

-- 
Bye, Peter Korsgaard
