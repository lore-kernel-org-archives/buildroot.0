From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:16:13 +0100
Subject: [Buildroot] [PATCH v2] libgtk2: skip tutorial and faq build
In-Reply-To: <20150226163433.340EDE044A@smtp.hushmail.com> (justin swartz's
 message of "Thu, 26 Feb 2015 18:34:33 +0200")
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk>
 <20150226163433.340EDE044A@smtp.hushmail.com>
Message-ID: <87385s74rm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "justin" == justin swartz <justin.swartz@nym.hush.com> writes:

Hi,

 > This should have been addressed to "peter at korsgaard.com", but my
 > provider claims that the address is invalid.

Really? What error message do you get exactly (perhaps privately to
jacmet at sunsite.dk).


 > On 02/26/2015 at 1:17 AM, "Peter Korsgaard" <peter@korsgaard.com> wrote:
 >> Why not just pass DB2HTML=false in LIBGTK2_CONF_ENV?
 >> 
 > DB2HTML=false works perfectly, thanks for pointing that out!

Great. I've committed a fix to pass it.


 >> > +LIBGTK2_CONF_OPTS = \
 >> > +	--disable-glibtest \
 >> > +	--enable-explicit-deps=no \
 >> > +	--disable-gtk-doc-pdf \
 >> > +	--disable-gtk-doc-html
 >> 
 >> What does that buy us? gtk-doc is disabled unless --enable-gtk-doc 
 >> is passed (which we don't), so these shouldn't change anything.
 >> 
 > I hadn't noticed that --disable-gtk-doc was implicitly passed in *_CONF_OPTS.

That and the fact that it defaults to disabled:

./configure --help|grep gtk-doc
  --enable-gtk-doc        use gtk-doc to build documentation [[default=no]]
  --enable-gtk-doc-html   build documentation in html format [[default=yes]]
  --enable-gtk-doc-pdf    build documentation in pdf format [[default=no]]

 > Unfortunately there is still documention installed in to /usr/share/gtk-doc/html/,
 > but it's eventually removed by target-finalize anyway.

Yes, but the patch you sent didn't change anything about that, right?

-- 
Bye, Peter Korsgaard
