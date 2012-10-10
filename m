From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 10 Oct 2012 12:32:51 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <20121010165620.GA21086@piout.net>
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <20121010124644.55d52fff@skate> <20121010165620.GA21086@piout.net>
Message-ID: <201210101232.53274.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed October 10 2012, Alexandre Belloni wrote:
> On Wed, Oct 10, 2012 at 12:46:44PM +0200, Thomas Petazzoni wrote :
> > 
> > Ok. I am not a security expert, but I am not sure that downloading
> > those things from https:// gives any win over a http:// download. What
> > would be more interesting is to be able to verify the cryptographic
> > signature of those tarballs (or the signature of a hash of those
> > tarballs), to actually be able to verify that those tarballs have
> > really been emitted by whoever is supposed to emit those tarballs. But
> > that's another story, and there are probably many projects that don't
> > provide cryptographic signatures to verify the authenticity of
> > the tarballs.
> > 
> 
> Anyway, downloading the cryptographic hash/signature from the same host
> would make no sense as it would probably be tempered with at the same
> time as the package itself. In the case we want to ensure integrity,
> buildroot should come with the cryptographic hash of each package, in
> the .mk files for example.
> 
> 

A hash sum, possibly: Yes
A cryptographic signature: No

The typical process is to take a non-reversible hash sum of the object
and then construct the signature using the private key of a 
"public key pair".

To verify, a person needs to get the public key of that "key pair" from
a trusted third party.

There are "key servers" on which the public key can be posted.
Or on a server under the buildroot project's control.

pgp (or gpg) is the public key tool usually used in signing.
All that the Buildroot project needs to do is provide a link to
where their public key can be obtained.

For a simple "warm and fuzzy" level of authentication -
check my mirrors.minimodding.com
Those archive are all signed ;
The public key (right hand side bar) can be obtained from another
domain.

Mike
