From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 27 Nov 2009 11:27:15 +0100
Subject: [Buildroot] Found my LIBICONV problem, just ignore that one.
In-Reply-To: <87aay8704z.fsf@macbook.be.48ers.dk>
References: <200911261621.41946.minimod@morethan.org>
	<1259312048.19800.14.camel@bender> <87aay8704z.fsf@macbook.be.48ers.dk>
Message-ID: <1259317635.5579.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-11-27 at 11:06 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> On Thu, 2009-11-26 at 16:21 -0600, Michael S. Zick wrote:
>  >> BR2_PACKAGE_PKG_CONFIG -> BR2_PACKAGE_LIBGLIB2 -> BR2_PACKAGE_LIBINTL && BR2_PACKAGE_LIBICONV
> 
>  Sven> This dependency chain is wrong though, as far as I can see. pkg-config
>  Sven> comes with its own copy of glib-1.2.10. It doesn't need libglib2 and it
>  Sven> doesn't need libintl or iconv either.
> 
> Yes, you can either use the embedded glib copy or you can build with
> --with-installed-glib. We do the latter for the target because the
> embedded copy doesn't cross compile easily (and we already did the work
> for the glib package).

Ah, that makes sense. Thanks for pointing this out.


Sven
