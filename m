From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Mar 2014 19:39:23 +0100
Subject: [Buildroot] [PATCH 1/2] legal-info: extract even
 no-redistribute packages
In-Reply-To: <532738D7.3070304@lucaceresoli.net>
References: <cover.1394834923.git.yann.morin.1998@free.fr>
 <4688cbeefb9e44bd98d4780efd574b93e0e7d81b.1394834923.git.yann.morin.1998@free.fr>
 <532738D7.3070304@lucaceresoli.net>
Message-ID: <20140317183923.GA3393@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-03-17 19:03 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> >will not try to extract it first.
[--SNIP--]
> I agree with this change, but still it still leave a corner case broken.
> 
> For packages with _LICENSE_FILES defined and _REDISTRIBUTE = NO, if
> local or override is used, the tarball is extracted but no license
> files are copied.
> 
> This is because code that copies the files (a little below) is inside
> an if chain that prevents any actions for local and overridden packages.

Ah yes, I mised that case. Thanks for spotting this.

I'll rework the patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
