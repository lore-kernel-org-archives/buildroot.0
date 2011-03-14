From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 14 Mar 2011 14:04:03 -0500
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <AANLkTikuS1doYx310yhGbu6esBQAqksL_VzgKZRWfBH+@mail.gmail.com>
References: <AANLkTikz08GZdkFc9kEVmk6mdxpnb_hovz1JpTXQ8zpa@mail.gmail.com>
	<201103141154.45996.minimod@morethan.org>
	<AANLkTikuS1doYx310yhGbu6esBQAqksL_VzgKZRWfBH+@mail.gmail.com>
Message-ID: <201103141404.13865.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon March 14 2011, you wrote:
> On Mon, Mar 14, 2011 at 4:54 PM, Michael S. Zick <minimod@morethan.org> wrote:
> > On Mon March 14 2011, Will Newton wrote:
> >> NSS is the Network Security Services library developed as part of
> >> the Mozilla project. It provides similar functions to OpenSSL but
> >> allows MPL, GPL and LGPL licensing and has been FIPS certified.
> >>
> >
> > Note:
> > The version mentioned in this patch __is not__ one of the certified
> > versions.
> > Ref:
> > http://www.mozilla.org/projects/security/pki/nss/fips/
> >
> > Nor does the validated version build for all of the Buildroot targets.
> > Ref:
> > http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140val-all.htm#815
> > http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140sp/140sp815.pdf
> >
> > So I think it is unwise to include that "and has been FIPS certified"
> > in the new package description.
> 
> I'm aware that it is not a FIPS certified version, I only that line in
> there to help answer the inevitable "why another crypto library?"
> question.
> 
> I'll remove the mention of FIPS certification.
> 
> 

Good idea, will not mis-lead someone in the future.

But it does raise an interesting guestion -

OpenSSL will build the FIPS validated module which can be
used with the rest of the library when the security policy
is followed (which I think would be easy for BR to do).
http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140sp/140sp1051.pdf
Installation instructions start on page 15.

Which might be of interest because the validated module will
build for ARM-uClibc. (Page 6)  Also, version 1.2.2 should have
the cross-compile problem fixed. (Page 4).

Having that would also allow other users of the library to build
"FIPS mode" applications, such as OpenSSH.  (In case anyone needs
a "FIPS mode ssh" ;-) )

One down-side I can see to suggesting that FIPS mode be included in BR:

The configuration and make files are easy for someone to change without
reference to the security policy - 
If someone updated the package site, version or allowed commands,
they would be generating a non-validated module when they thought otherwise.

So maybe "FIPS mode" of everything should remain the providence of the
local security officer, outside of Buildroot.

Mike
