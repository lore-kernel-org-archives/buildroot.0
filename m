From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Nov 2019 16:21:35 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <20191031223842.24bfc912@windsurf.home>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
 <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
 <20191031223842.24bfc912@windsurf.home>
Message-ID: <20191101152135.GB3133@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-31 22:38 +0100, Thomas Petazzoni spake thusly:
> On Tue, 29 Oct 2019 23:40:07 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> >  It is looking pretty good. I just have one major comment: it has to be flake8
> > compliant.
> 
> During the Buildroot Developers meeting, Nicolas Carrier worked on an
> alternate proposal that consists in generating an XML, and then use an
> XSLT stylesheet to have the browser render an HTML output:
> 
>   http://patchwork.ozlabs.org/patch/1185080/
> 
> I am personally not a big fan of XML/XSLT technologies, and we already
> have stuff in Buildroot that generates just pure HTML, so I would tend
> to prefer an approach such as the one proposed by Micka?l in this
> patch. Should we formally reject the proposal from Nicolas ?

In fact, I still prefer that we expose unformatted, un-rendered data,and
leave to the user the responsibility to inject that in whatever web
framework they are using. So far, the legal-info/ directory contained
only that: raw data. Arguably, the xml format is still kinda raw. The
rendered web-page, not so much, and will mostly never fir into the
user's web framework (and in my olpinion, does not bring much more than
a directory listing would provide).

So, my preference would be for Nicolas' patch (if it can be made to
work).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
