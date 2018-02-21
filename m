From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 21 Feb 2018 23:21:34 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio/init: preserve arguments
In-Reply-To: <20180221234332.0aab34e2@windsurf.lan>
References: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
 <20180221234332.0aab34e2@windsurf.lan>
Message-ID: <20180221232134.GD22894@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Feb 2018 23:43:32 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Wed, 21 Feb 2018 16:02:16 -0500, Ga?l PORTAY wrote:
> > Use "$@" instead of $* to preserve argument.
> 
> Thanks for your patch, but why ? The commit log needs to explain the
> use-case/motivations/reasons.

Using $* here will split each of the arguments at the spaces (well, at any of
the characters fro $IFS): that means that passing 'has space' as argument,
using $* will result in two arguments 'has' and 'space' being passed down.
Using "$@" prevents $IFS-splitting and passes argument unchanged as-is.

In most cases whenever there is a $* in a shell script, pretty much it means
that passing the parameters with spaces (file names, paths, etc.) will break
things.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180221/3604ce5f/attachment.asc>
