From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:45:29 +0200
Subject: [Buildroot] [PATCH 2/8] libsepol: rework host installation
In-Reply-To: <20170703124502.26113-3-arnout@mind.be>
References: <20170703124502.26113-1-arnout@mind.be>
 <20170703124502.26113-3-arnout@mind.be>
Message-ID: <20170704084529.1d6e0fa7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 14:44:56 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> libsepol has a pretty peculiar interpretation of DESTDIR and PREFIX.
> PREFIX is not consistently used: some installation paths are forced to
> $(DESTDIR)/usr/... . Also, the shared lib symlink is forced to ../../lib
> (i.e. assumes it's installed under /usr). For these reasons, the host
> build and install commands are a bit unusual: they use DESTDIR instead
> of PREFIX, DESTDIR points to $(HOST_DIR) without /usr, and some
> additional fixup is needed to correct the installation directory of
> libsepol.so.1 and the symlink to it.
> 
> This can be simplified quite a lot by passing both DESTDIR and PREFIX,
> and including the /usr part in both. The symlink still has to be fixed,
> but that's much simpler.
> 
> Note that a side effect is that the man pages are now installed under
> $(HOST_DIR)/usr/usr/man. While not very nice, we don't really care
> about man pages. In addition, this will resolve itself when we later
> move $(HOST_DIR)/usr to $(HOST_DIR).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> It's a bit counter-intuitive to have a patch that adds /usr in a series
> that is meant to remove it, but this is the simplest way to have a
> bisectable series...
> ---
>  package/libsepol/libsepol.mk | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
