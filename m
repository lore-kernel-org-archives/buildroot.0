From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:19:53 +0200
Subject: [Buildroot] [PATCH 11/16 v3] docs/manual: document the
 br2-external ID
In-Reply-To: <20160827221303.23e011ec@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
 <20160827221303.23e011ec@free-electrons.com>
Message-ID: <20160827221953.GN5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:31 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> > index 9ad177d..839d1b1 100644
> > --- a/docs/manual/customize-outside-br.txt
> > +++ b/docs/manual/customize-outside-br.txt
> > @@ -57,19 +57,50 @@ Or disable the usage of external definitions:
> >  buildroot/ $ make BR2_EXTERNAL= xconfig
> >  -----
> >  
> > -+BR2_EXTERNAL+ allows three different things:
> > +A +BR2_EXTERNAL+ tree must contain at least those three files:
> > +
> > ++external.id+::
> 
> I thought this file was optional when there was a single external tree,
> but you're saying it's mandatory here. Is it because the "no
> external.id file" case is only supported for backward compat, and we
> expect that new users write an external.id, regardless of whether they
> are using a single or multiple external trees ?

Exactly, as explained in the commit log:

    Even though it is still possible to write a br2-external tree that
    is not multi-aware, we only document it with an ID.

> > +   That file should contain the ID for the +BR2_EXTERNAL+ tree.
> > +   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
> > +   available in +Config.in+ and +external.mk+ (see below), so that ID
> > +   must be a valid make and Kconfig variable. Buildroot sets
> > +   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
> > +   The format for this file is a single line with the ID.
> > ++
> > +Examples of an +external.mk+ file that declares the ID +FOO+:
> 
> Huh? Is it really external.mk that contains the ID ?

Good catch!

> > ++
> > +----
> > +$ cat external.mk
> 
> Ditto.

Ditto. ;-)

> > +FOO
> > +----
> > ++
> > +Examples of IDs and the corresponding +BR2_EXTERNAL_$(ID)+ variable:
> > ++
> > +  * +FOO+ -> +BR2_EXTERNAL_FOO+
> > +  * +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
> > +  * ...
> 
> Maybe mention which characters are allowed and which ones are not
> allowed?

I thought I did address this, a bit above, when describing the
external.id file:

    [...] ID must be a valid make and Kconfig variable.

Isn't that enough?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
