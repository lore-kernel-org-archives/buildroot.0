From: Alexander Dahl <post@lespocky.de>
Date: Mon, 5 Apr 2021 20:37:15 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
In-Reply-To: <87blasr8ko.fsf@dell.be.48ers.dk>
References: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
 <87blasr8ko.fsf@dell.be.48ers.dk>
Message-ID: <20210405183714.7gtx25hqmcftnau3@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Mon, Apr 05, 2021 at 06:37:43PM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > The old at91bootstrap version (1.x) uses a strange variant of the BSD
>  > license, called "BSD Source Code Attribution" and referenced by SPDX
>  > as BSD-Source-Code.
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  >  boot/at91bootstrap/at91bootstrap.hash | 1 +
>  >  boot/at91bootstrap/at91bootstrap.mk   | 2 ++
>  >  2 files changed, 3 insertions(+)
> 
>  > diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
>  > index b1f963b825..e4a6760f12 100644
>  > --- a/boot/at91bootstrap/at91bootstrap.hash
>  > +++ b/boot/at91bootstrap/at91bootstrap.hash
>  > @@ -1,2 +1,3 @@
>  >  # locally computed
>  >  sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
>  > +sha256  cb53ea8cf7a54929944de5de10569f51068af4f6d63ddfe8735759bdd8cebf38  main.c
>  > diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
>  > index c68b56b6ec..001427855f 100644
>  > --- a/boot/at91bootstrap/at91bootstrap.mk
>  > +++ b/boot/at91bootstrap/at91bootstrap.mk
>  > @@ -7,6 +7,8 @@
>  >  AT91BOOTSTRAP_VERSION = 1.16
>  >  AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
>  >  AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
>  > +AT91BOOTSTRAP_LICENSE = BSD-Source-Code
>  > +AT91BOOTSTRAP_LICENSE_FILES = main.c
> 
> Hmm, this doesn't work very well if someone patches main.c :/ But OK, I
> don't really know how common that is / what to do about it.

Two remarks here:

1) atbootstrap 1.16 seems to be the final version, no updates anymore.
However patching is likely for someone with a certain combination
board and soc not supported out of the box.

2) in ptxdist license information or let's say hashes for license
texts for packages not shipping a separate
license file is frequently based on comment sections in source files,
but not based on the whole file but on the comment section only. The
packages contain information on which file and _from_ which line _to_
which line. Only those lines containing the license information are
extracted and hashed, making it possible to patch the file. Maybe
that's an idea to copy?

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210405/6cfe8ad1/attachment.asc>
