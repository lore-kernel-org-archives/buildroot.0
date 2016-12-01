From: Samuel Hurst <samuelh@rd.bbc.co.uk>
Date: Thu, 1 Dec 2016 15:42:12 +0000
Subject: [Buildroot] Package not building automatically.
In-Reply-To: <20161201162603.1747cb41@free-electrons.com>
References: <be469460-df73-df24-c85b-614e8b2d572c@rd.bbc.co.uk>
 <20161201162603.1747cb41@free-electrons.com>
Message-ID: <ace6fc64-0166-1e7c-fed6-44f47856746a@rd.bbc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your quick response.

On 01/12/16 15:26, Thomas Petazzoni wrote:
> Hello,
> 
> Nothing looks wrong here. Are you sure that grep
> BR2_PACKAGE_LIBQUIC .config shows that this package is enabled?

Yes:

samuelh [buildroot]: grep BR2_PACKAGE_LIBQUIC .config
BR2_PACKAGE_LIBQUIC=y

> For a package to build, there's a few rules to respect:
> 
>  - the option must be named BR2_PACKAGE_<FOO>
> 
>  - the package must be in package/<foo>/<foo>.mk
> 
>  - the variables in foo.mk must be prefixed by <FOO>
> 
> All three conditions seem to be respected on what you're showing.

That's what was confusing me. I'll keep at it and see if anything comes
up. I'm starting to wonder if it might be some inconsistency of spaces
and tabs, would that trip up any of the scripts?

> Unrelated, but the LIBQUIC_SOURCE variable is useless, since you have
> specified LIBQUIC_SITE_METHOD = git. But that's definitely not the
> reason why this package doesn't build.

I'll keep that in mind :)

Thanks for the advice,
-Sam

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161201/2e52e732/attachment.asc>
