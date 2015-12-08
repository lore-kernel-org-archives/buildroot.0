From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 8 Dec 2015 11:40:23 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <876109nzql.fsf@dell.be.48ers.dk>
References: <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan>
 <20151207230201.GG14874@free.fr>
 <20151207232256.GD24430@vapier.lan>
 <876109nzql.fsf@dell.be.48ers.dk>
Message-ID: <20151208164023.GL11489@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08 Dec 2015 08:52, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  > and it doesn't address the other issue i raised: is buildroot going to
>  > bootstrap wget and such to be sure SNI is supported ?  otherwise, even
>  > if you get the buildroot source, sticking to http doesn't help when the
>  > server transparently redirects you to https.  like getting busybox or
>  > uclibc archives :).  or will buildroot detect wget is old and then use
>  > --no-check-certificate everywhere ?
> 
> I don't believe we will ever bootstrap wget, but we might add
> --no-check-certificates in the future (with the download hashes,
> checking certificates doesn't add much).

except there is no checking on the initial download.  imo, people wanting
to use old/insecure versions and fetch things insecurely should be forced
to opt in.  i.e. they use --no-check-certificates.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151208/30bfd95f/attachment.asc>
