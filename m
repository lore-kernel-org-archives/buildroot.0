From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2019 12:44:49 +0100
Subject: [Buildroot] [PATCH 1/1] utils: add a csv to xml conversion
 script for legal info, rendering as html
In-Reply-To: <20191027161523.30907-1-nicolas.carrier@orolia.com>
References: <20191027161523.30907-1-nicolas.carrier@orolia.com>
Message-ID: <20191102114449.GB2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2019-10-27 16:15 +0000, Nicolas Carrier spake thusly:
> An xsl file is provided alongside the python script, which is referenced
> by the generated xml.
> This xsl file can be customized at will by users if they want to add, say
> extra information, styling or even a logo...
> When the xml file is served in http, browsers like firefox can render it
> as if it was pure HTML.

It does not work for me, unfortunately. From a clean tree:

    $ make defconfig
    $ make legal-info
    $ ./utils/legal-info-to-xml output/legal-info/manifest.csv \
                               >output/legal-info/legal-info.xml
    $ cp utils/legal-info.xsl output/legal-info/legal-info.xsl
    $ python2 -m SimpleHTTPServer 1234

And then in firefox:

    http://127.0.0.1:1234/output/legal-info/legal-info.xml

Then firefox will never stop "loading" the page (the boucing loading
symbol in the tab will never stop). However, opening the console (F12)
will indeed show the HTML page with the expected content (see attached
HTML page). But the firefox page stays blank...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191102/998360f0/attachment-0001.html>
