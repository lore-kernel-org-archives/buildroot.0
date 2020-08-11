From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 11 Aug 2020 23:31:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.46
In-Reply-To: <87o8nkyh95.fsf@dell.be.48ers.dk>
References: <20200807171100.220432-1-bernd.kuhls@t-online.de>
 <20200807192657.GJ2186@scaer> <20200807225632.41b7c8d0@gmx.net>
 <20200808122312.GO2186@scaer> <87o8nkyh95.fsf@dell.be.48ers.dk>
Message-ID: <20200811233149.4bf7233d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Peter,

On Sat, 08 Aug 2020 23:12:06 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  > The hashes are there to guarantee that the archives have not be tampered
>  > with, so that we know that:
>
>  >  1. there was no technical issue downloading the archive (e.g. partial
>  >     download, proxy playing tricks, etc...),
>
>  >  2. upstream did not re-release the same version with a different
>  >     content, so that we know our patches would or would not apply for
>  >     example,
>
>  >  3. the source code has not been tampered with, so that no ill source
>  >     code has been injected (either in-transit, or if upstream got
>  >     compromised).
>
>  > md5 is broken, there is no point in using it. If that's the only thing
>  > upstream provides, we can carry it, but if upstream provides better
>  > hashes, md5 brings nothing to address the above, especially point 3.
>
>  > sha1 is not yet fully broken, but it is no longer trusted, and everyone
>  > is moving away from it. If upstream only provides sha1, we can carry it,
>  > but if upstream provides better hashes, then we should not _add_ sha1
>  > (but we can continue to update an existing one we already carry). While
>  > sha1 is still OK-ish to address accidental tampering (point 1) or
>  > non-malicious modifications (point 2, and even then), it is now
>  > useless to address malicious tampering (point 3).
>
>  > This is the point of view hashes should be looked at from.
>
>  > In this case, upstream provides two strong hashes, sha256 and sha512;
>  > adding md5 is totally useless, while adding sha1 is borderline useless.
>
>  > For the records:
>
>  >   - md5 [0] was introduced 1991, and the first security issues were
>  >     identified in 1993, and the first collisions reported in 1996.
>
>  >   - sha1 [1] was introduced in 1995, is considered weak since 2005 (15
>  >     years ago!), disallowed for signatures by NIST since 2013, and
>  >     chosen-prefix attacks are a thing since this year.
>
> This is all true, but generating a single rogue file with BOTH a md5 and
> sha1 collision and still being a valid compressed tarball is extremely
> unlikely, so I have no issues with listing them (together with a
> manually calculated sha256) if upstream doesn't provide sha256 or
> better.
>
> If upstream does provide sha256 or better then there indeed isn't much
> point in adding the older hashes as well.
>

Totally agree with the given arguments for omitting redundant hashes (and
always wondered why the docs suggested otherwise)...., time to update
the docs to reflect this?

Regards,
Peter
