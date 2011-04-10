From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Sun, 10 Apr 2011 09:38:28 -0600
Subject: [Buildroot] xfonts error in 2011.02
In-Reply-To: <1302385414.7244.23.camel@galileo.graphics-muse.org>
References: <1302385414.7244.23.camel@galileo.graphics-muse.org>
Message-ID: <1302449908.6468.3.camel@kepler.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2011-04-09 at 15:43 -0600, Michael J. Hammel wrote:
> This seems related to this patch:
> http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabec72d7637f80f7a55fbba9ce67bf
> 
> I've applied the patch but it doesn't appear to fix the problem.  Also,
> is this patch correct?  It seems the following:
> 
> ++ if (pcsysrootdir &&
> ++ (!strcmp(variable_name, "includedir") ||
> ++ !strcmp(variable_name, "libdir")))

After more testing it appears this is probably correct, but is missing
one additional variable: mapdir.  When I added mapdir to the patch the
build appears to complete successfully and the fonts are in the correct
location.

I don't know if this is the correct solution, but it works.  So I'll
post a bug report for it in a little while.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
