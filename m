From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 18:22:56 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207230201.GG14874@free.fr>
References: <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan>
 <20151207230201.GG14874@free.fr>
Message-ID: <20151207232256.GD24430@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08 Dec 2015 00:02, Yann E. MORIN wrote:
> On 2015-12-07 17:54 -0500, Mike Frysinger spake thusly:
> > we're already at (3).  even if we weren't, i don't see how transitioning
> > would affect the SNI issue.  the question is simple: how long do you want
> > to (try to) support old systems where people refuse to fix their setup ?
> > we're talking about systems that are over three years old (wget-1.14 was
> > released in Aug 2012).  what is your cut off ?  3 years ?  4 years ?
> 
> A lot of companies are still using RHEL5, which was released in 2007.
> 
> Yes, that's old. But once an enterprise has settled on their "production
> environment", it lasts years, up to the decade or more. Yes, we are
> still trying to have Buildroot work in such an old environment...

to be clear, the initial download doesn't necessarily have to happen on
the RHEL system itself, and it is possible to work around -- the wget
command itself already suggested a "fix" by adding the no check flag:
--no-check-certificate
in this mode, it's basically equiv to using http, and it works with
wget versions that don't support SNI.

and it doesn't address the other issue i raised: is buildroot going to
bootstrap wget and such to be sure SNI is supported ?  otherwise, even
if you get the buildroot source, sticking to http doesn't help when the
server transparently redirects you to https.  like getting busybox or
uclibc archives :).  or will buildroot detect wget is old and then use
--no-check-certificate everywhere ?
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/c9c6dd56/attachment.asc>
