From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 18:09:40 +0100
Subject: [Buildroot] [PATCH 11/12] manual: add documentation about
	packages' hashes
In-Reply-To: <CAHXCMMKohY_kE5BEOL9iqs30b9=yS1o_MKpzA9n47kuEGN-=Rw@mail.gmail.com>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <9cab6ed51fae5b7d5baa2a514aea4c7c5205fb30.1394055621.git.yann.morin.1998@free.fr>
 <CAHXCMMKohY_kE5BEOL9iqs30b9=yS1o_MKpzA9n47kuEGN-=Rw@mail.gmail.com>
Message-ID: <20140306170940.GB3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-06 11:56 +0100, Samuel Martin spake thusly:
> On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> > index e56e59a..4609a7e 100644
> > --- a/docs/manual/adding-packages-directory.txt
> > +++ b/docs/manual/adding-packages-directory.txt
> > @@ -346,3 +346,68 @@ different way, using different infrastructures:
> >
> >  Further formatting details: see xref:writing-rules-mk[the writing
> >  rules].
> > +
> > +The +.hash+ file
> > +~~~~~~~~~~~~~~~~
> > +[[adding-packages-hash]]
> > +
> > +Optionally, you can add a third file, named +libfoo.hash+, that contains
> > +the hashes of the downloaded files for the +libfoo+ package.
> > +
> > +The hashes stored in that file are used to validate the integrity of the
> > +downloaded files.
> > +
> > +The format for this file is one line for each file for which to check the
> > +hash, each line being space-separated, with these three fields:
> > +
> > +* the type of hash, one of:
> > +** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
> > +* the hash of the file:
> > +** for +sha1+, 40 hexa-decimal characters
> > +** for +sha224+, 56 hexa-decimal characters
> > +** for +sha256+, 64 hexa-decimal characters
> > +** for +sha384+, 96 hexa-decimal characters
> > +** for +sha512+, 128 hexa-decimal characters
> > +* the name of the file, without any directory component
> > +
> > +Lines starting with a +#+ sign are considered comments, and ignored. Empty
> > +lines are ignored.
> > +
> > +There can be more than one hash for a single file, each of its own line. In
> > +this case, all hashes must match.
> 
> Maybe a note explaining why it's better to provide more than 1 hash
> for a file could be added.

As I said to Gustavo on IRC, I'd prefer we only document the format of
the .hash file in the manual, not define any policy. Ie. I don't think
it is sensible to say something like:

    For security considerations, adding more than one hash will ower the
    risk of collusions if more than one hash type is provided.

However, we can say, and I will add, something like:

    If upstream provides more than one type of hash (say, sha1 and
    sha512), then it is best to add all those hashes in the .hash file.

This is more policy-neutral.

We have to keep in mind that this feature is a first-level stop-gap for
security-conscious people, but in no way a security measure. Those
security-conscious users are encouraged to check the downloaded files
using a side-band channel (eg. manually checking signatures and so
on...)

Buildroot itself can't check signatures: if the user does not have a
chain-of-trust, from his own key and up to the signer's key, there is no
point in checking the signature in the first place. We can't expect all
users to have such a chain-of-trust, even less that all have a PGP key.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
