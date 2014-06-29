From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:43:17 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-download: fix svn download for
 deleted path
In-Reply-To: <1403788659-1936-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1403788659-1936-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20140629104317.2a750a1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 26 Jun 2014 08:17:39 -0500, Ryan Barnett wrote:
> If a SVN path has been deleted in a future revision, downloading a
> package's source will fail using 'svn checkout -r'. Fix using
> URL at REV syntax since the SVN command will then verify the path at the
> specified version. Without using the URL at REV syntax, the SVN command
> will attempt to verify the path exists on the the HEAD revision before
> checking out the path at the specified revision.
> 
> Error seen if SVN path has been deleted in HEAD using svn checkout -r:
>   svn: E160013: '/svn/path/' path not found
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/pkg-download.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
