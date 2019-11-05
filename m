From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Tue, 5 Nov 2019 12:41:57 +0000
Subject: [Buildroot] [PATCH 1/1] utils: add a csv to xml conversion script
 for legal info, rendering as html
In-Reply-To: <17534e09b92af585ca4aca23718bf0e5d5b1db77.camel@orolia.com>
References: <20191027161523.30907-1-nicolas.carrier@orolia.com>
 <20191102114449.GB2710@scaer>,
 <17534e09b92af585ca4aca23718bf0e5d5b1db77.camel@orolia.com>
Message-ID: <AM6PR06MB43416BC282E6A6B77D75854F847E0@AM6PR06MB4341.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hello Yann,
Thank you for taking the time to review this proposal.

I tried the very same sequence of commands and it worked for me with
Firefox 70.0, Chrome 77.0.3865.120 and Chromium 76.0.3809.100.

I suspect something related to your particular installation /
configuration of Firefox.
Have you been able to test with another web browser by chance?

Can you please try to launch Firefox with a blank profile? Something
like the following should work:

     $ mkdir output/temp-profile
     $ firefox -profile output/temp-profile/ -no-remote -new-instance
http://127.0.0.1:1234/output/legal-info/legal-info.xml

Can you also try to generate the html file with the xsltproc command-
line and check if you have the same issue? As a reminder:

     $ xsltproc --output output/legal-info/legal-info.html
output/legal-info/legal-info.xml

You can then try to open output/legal-info/legal-info.html either
directly in firefox and via the HTTP server you launched via python.


And then, last, can you please try using the attached xsl file instead,
which has neither styling nor javascript?


PS: this is a resend to the busybox ML which I originally forgot to add to the recipients list.
On Sat, 2019-11-02 at 12:44 +0100, Yann E. MORIN wrote:
> Nicolas, All,
>
> On 2019-10-27 16:15 +0000, Nicolas Carrier spake thusly:
> > An xsl file is provided alongside the python script, which is
> > referenced
> > by the generated xml.
> > This xsl file can be customized at will by users if they want to
> > add, say
> > extra information, styling or even a logo...
> > When the xml file is served in http, browsers like firefox can
> > render it
> > as if it was pure HTML.
>
> It does not work for me, unfortunately. From a clean tree:
>
>     $ make defconfig
>     $ make legal-info
>     $ ./utils/legal-info-to-xml output/legal-info/manifest.csv \
>                                >output/legal-info/legal-info.xml
>     $ cp utils/legal-info.xsl output/legal-info/legal-info.xsl
>     $ python2 -m SimpleHTTPServer 1234
>
> And then in firefox:
>
>     http://127.0.0.1:1234/output/legal-info/legal-info.xml
>
> Then firefox will never stop "loading" the page (the boucing loading
> symbol in the tab will never stop). However, opening the console
> (F12)
> will indeed show the HTML page with the expected content (see
> attached
> HTML page). But the firefox page stays blank...
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------
> ------------.
> >  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> > conspiracy: |
> > +33 662 376 056 | Software  Designer | \ /
> > CAMPAIGN     |  ___               |
> > +33 561 099 427 `------------.-------
> > :  X  AGAINST      |  \e/  There is no  |
> > http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML
> > MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------
> ------------'
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191105/92abfc41/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: legal-info.xsl
Type: application/xslt+xml
Size: 750 bytes
Desc: legal-info.xsl
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191105/92abfc41/attachment.xslt>
