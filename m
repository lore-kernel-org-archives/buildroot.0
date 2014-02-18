From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 18 Feb 2014 12:44:50 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <530244B7.402@mind.be>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
 <530244B7.402@mind.be>
Message-ID: <20140218114448.GB6731@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Feb 17, 2014 at 06:19:51PM +0100, Arnout Vandecappelle wrote:
> On 14/02/14 16:11, Eric Le Bihan wrote:
[...]
> > +.Virtual package +Config.in+ file
> > +=================================
> > +The +Config.in+ file of virtual package 'foo' should contain:
> > +
> > +---------------------------
> > +01: config BR2_PACKAGE_HAS_FOO
> > +02:	bool
> > +03:
> > +04: config BR2_PACKAGE_PROVIDES_FOO
> > +05:	depends on BR2_PACKAGE_HAS_FOO
> > +06:	string
> > +---------------------------
> > +=================================
>
>  I haven't checked, but isn't this === line redundant?
>
No. I used docs/manual/adding-packages-generic.txt as example.
According to the Asciidoc reference, the text of an example should be
delimited using === (http://www.methods.co.nz/asciidoc/userguide.html#X48).
As our example is a code listing, the code should be delimited with ---
(http://www.methods.co.nz/asciidoc/userguide.html#_listing_blocks).

Removing either one messes up the layout.
> > +
> > +On line 1, we declare the option +BR2_PACKAGE_HAS_FOO+, which will be selected
> > +by the provider. On line 4, we declare the option +BR2_PACKAGE_PROVIDES_FOO+
> > +whose value will be set to the name of the provider, by the provider.
>
>  I think an example would be better here. All those providers are a bit
> confusing. So it would be nice if you could make a complete example with
> Config.in and *.mk fragments for the virtual package and for a provider.
>
So, instead of adding this tutorial to 'adding-packages-tips.txt', maybe it
would be better to add it in a new file named 'adding-packages-virtual.txt'?
A complete example takes more room than a tip.

I'll update the text to whack the 'provider' repetitions.
>  To make it easier for the reader to distinguish between them, perhaps it
> would be better to the virtual package V and the provider package P.
Do you mean using BR2_PACKAGE_HAS_V instead of BR2_PACKAGE_HAS_FOO and so on?
FOO and BAR/BAZ are already used in other parts of the manual and single
letter package names look strange to me. They also make a better distinction
between the prefix of the symbol and the name of the package.

Thanks for the review!

Best regards,
ELB
