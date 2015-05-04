From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 15:35:31 +0200
Subject: [Buildroot] [PATCH 1/2 v2] autotools-package: also handle
	pre-installed external toolchain in .la fixup
In-Reply-To: <71ddaa7abe2063c33ad88194ed1e499a7d06ef78.1430687963.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 3 May 2015 23:30:38 +0200")
References: <cover.1430687963.git.yann.morin.1998@free.fr>
 <71ddaa7abe2063c33ad88194ed1e499a7d06ef78.1430687963.git.yann.morin.1998@free.fr>
Message-ID: <87lhh4qxcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Arnout Vandecappelle <arnout@mind.be>
 > The .la fixup handling looks for paths starting with /usr and assumes
 > that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
 > already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
 > are under /usr, but it does not yet handle the case that a
 > pre-installed external toolchain is under /usr (and tracks that fact
 > in some .la file). For instance, if you use buildroot to generate a
 > toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.

 > Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
 > addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
 > internal toolchains, it is empty and the sed expression would fail.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Reported-by: Carlos Soto <csotoalonso@gmail.com>
 > Cc: Carlos Soto <csotoalonso@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > I haven't been able to test this very extensively because it's not so
 > easy to find .la files where it goes wrong.

 > Carlos, can you check if this patch solves the problem for you?

Committed, thanks.

-- 
Bye, Peter Korsgaard
