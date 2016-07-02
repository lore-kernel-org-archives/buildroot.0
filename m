From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 19:09:51 +0200
Subject: [Buildroot] [PATCH 3/4 v3] support/download/git: add support
	for submodules
In-Reply-To: <4d8136108e0e7be40bad4fa68ebb3dd558f42f8d.1467363623.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 1 Jul 2016 11:01:18 +0200")
References: <cover.1467363623.git.yann.morin.1998@free.fr>
 <4d8136108e0e7be40bad4fa68ebb3dd558f42f8d.1467363623.git.yann.morin.1998@free.fr>
Message-ID: <874m8855ls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some git repositories may be split into a master repository and
 > submodules. Up until now, we did not have support for submodules,
 > because we were using bare clones, in which it is not possible to
 > update the list of submodules.

 > Now that we are using plain clones with a working copy, we can retrieve
 > the submdoules.

 > Add an option to the git downlaod helper to kick the update of
 > submodules, so that they are only fetched for those packages that
 > require them. Also document the existing -q option at the same time.

 > Submodules have a .git file at their root, which contains the path to
 > the real .git directory of the master repository. Since we remove it,
 > there is no point in keeping those .git files either.

 > Note: this is currently unused, but will be enabled with the follow-up
 > patch , that adds the necessary parts in the pkg-generic and pkg-download
 > infrastructures.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Tested-by: Matt Weber <matt@thewebers.ws>
 > Reviewed-by: Matt Weber <matt@thewebers.ws>

Committed, thanks.

-- 
Bye, Peter Korsgaard
