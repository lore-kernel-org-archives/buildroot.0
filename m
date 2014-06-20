From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Jun 2014 13:41:20 +0200
Subject: [Buildroot] [PATCH 1 of 3] infra: support buildroot being
	located in /usr
In-Reply-To: <8282245ececc13c97588.1403206947@localhost>
References: <patchbomb.1403206946@localhost>
 <8282245ececc13c97588.1403206947@localhost>
Message-ID: <CAAXf6LVHv-22de_AZr31VA-1=UHyPduYevjs=RUQA87cfu3Urg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 19, 2014 at 9:42 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> pkg-generic and pkg-autotools both perform sed replacements of /usr to
> $(STAGING_DIR)/usr, in .pc and .la files respectively. However, if buildroot
> itself is located in /usr, then STAGING_DIR also starts with /usr, and naive
> replacements of '/usr' can result in paths of the form:
>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
>
> This patch makes the replacements more careful, by first replacing the known
> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
> replacement, and finally replacing the tokens with the corresponding paths.
>
> Additionally it removes the unnecessary making of a backup copy in
> pkg-autotools.
>
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
>
> Partially-based-on-a-patch-from: Jeremy Kerr <benstoltz@gmail.com>

Quick note: this was a copy/paste error in Ben's patch, seems Jeremy
Kerr and Ben Stoltz are no alter egos after all :-)
I will send a v2 but wait a while until there is more feedback.

Best regards,
Thomas
