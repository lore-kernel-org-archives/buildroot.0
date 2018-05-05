From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 May 2018 09:14:26 +0200
Subject: [Buildroot] [PATCH] dropbear: Fix host key loading with 521 bit
 ecdsa keys
In-Reply-To: <20180503114701.9452-1-stefan.sorensen@spectralink.com> ("Stefan
 =?utf-8?Q?S=C3=B8rensen=22's?= message of "Thu, 3 May 2018 13:46:59 +0200")
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
Message-ID: <8736z6wp4d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > Dropbear 2018.76 changed the default ecdsa host key size form 521 to 256
 > bits, but this breaks systems with an existing 521 bit key, blocking ssh
 > logins.

 > Apply the upstream fix from https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900 :

 >   Only advertise a single server ecdsa key when -R (generate as required) is
 >   specified. Fixes -R now that default ecdsa key size has changed.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
 >  package/dropbear/dropbear.hash | 3 +++
 >  package/dropbear/dropbear.mk   | 1 +
 >  2 files changed, 4 insertions(+)

 > diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
 > index ef2011d907..ba42d6bd0c 100644
 > --- a/package/dropbear/dropbear.hash
 > +++ b/package/dropbear/dropbear.hash
 > @@ -1,2 +1,5 @@
 >  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
 >  sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65 dropbear-2018.76.tar.bz2
 > +
 > +# Locally calculated
 > +sha256 d4a63567465f2bae9fd5e575e022587f832647fb41b023513ac880c4eb647fdd 0dc3103a5900

Ehh, how did you test this?

>>> dropbear 2018.76 Patching
PATH=/home/peko/source/buildroot/output/host/bin:$PATH support/scripts/apply-patches.sh  /home/peko/source/buildroot/output/build/dropbear-2018.76 /var/lib/downloads/dropbear 0dc3103a5900
Unsupported file type for /var/lib/downloads/dropbear/0dc3103a5900, skipping

So I've added the patch in Buildroot instead and committed, thanks.

-- 
Bye, Peter Korsgaard
