From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 24 Mar 2015 22:43:57 +0200
Subject: [Buildroot] [RFC 02/11] per-package .users and .files lists
In-Reply-To: <550ED31D.6040902@mind.be>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <e1c1a71680aa988903d278c9413cef7b48bad2ad.1426960081.git.alex.suykov@gmail.com>
 <550ED31D.6040902@mind.be>
Message-ID: <20150324204357.GA4906@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Mar 22, 2015 at 03:35:09PM +0100, Arnout Vandecappelle wrote:

> > With this patch, the data is stored outside of make, possibly
> > allowing one make invocation per package .mk file in the future.
> 
>  So, is there any reason left to move USERS and PERMS to a file?

No, none at present, so I'm dropping this idea completely.

> It has one big disadvantage: it spreads out the package logic over different
> files. We currently only have a separate file for the hashes, and that was
> probably a bad idea to begin with (as witnessed by the many version bumps that
> forget to update the hash file).

Ok, that was for the large part to match current .hash handling.
I wonder if it makes sense to move hashes into .mk files then, Arch-style.
