From: justin.swartz at nym.hush.com <justin.swartz@nym.hush.com>
Date: Thu, 26 Feb 2015 18:34:33 +0200
Subject: [Buildroot] [PATCH v2] libgtk2: skip tutorial and faq build
In-Reply-To: <877fv57f9j.fsf@dell.be.48ers.dk>
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk> 
Message-ID: <20150226163433.340EDE044A@smtp.hushmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should have been addressed to "peter at korsgaard.com", but my provider claims
that the address is invalid.

On 02/26/2015 at 1:17 AM, "Peter Korsgaard" <peter@korsgaard.com> wrote:
>Why not just pass DB2HTML=false in LIBGTK2_CONF_ENV?
>
DB2HTML=false works perfectly, thanks for pointing that out!

> > +LIBGTK2_CONF_OPTS = \
> > +	--disable-glibtest \
> > +	--enable-explicit-deps=no \
> > +	--disable-gtk-doc-pdf \
> > +	--disable-gtk-doc-html
>
>What does that buy us? gtk-doc is disabled unless --enable-gtk-doc 
>is passed (which we don't), so these shouldn't change anything.
>
I hadn't noticed that --disable-gtk-doc was implicitly passed in *_CONF_OPTS.

Unfortunately there is still documention installed in to /usr/share/gtk-doc/html/,
but it's eventually removed by target-finalize anyway.

Regards
Justin
