From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Dec 2012 19:03:06 +0100
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <20121229171540.5bb22f40@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <50DF04B3.30801@petroprogram.com> <20121229171540.5bb22f40@skate>
Message-ID: <201212291903.06705.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, Thomas, All,

On Saturday 29 December 2012 Thomas Petazzoni wrote:
> On Sat, 29 Dec 2012 16:56:51 +0200, Stefan Fr?berg wrote:
> > That's what I meant. Those *inside* Signed-off tags.
> > How should I add those inside Signed-off tags to individual patches
> > (either my own make or 3rd party)
> > applied to mesa3d ?
[--SNIP--]
> So basically, you have three choices (ordered below from the poorest to
> the nicest, in my opinion).
> 
> 1. Use the raw diff tool
[--SNIP--]
> And then, edit mesa3d-01-something.patch with your text editor to add
> the patch description and the Signed-off-by line.

I am using vim as editor, and I use the snippet 'plugin'. To add any
SoB-like line, I just have to type:
    sob<TAB>me<TAB>
and I get:
    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Similarly, I have snippets configured for:
    Reported-by:
    Reviewed-by:
    Acked-by:
    Tested-by:
    CC:  (although that one is a bit overkill ;-) )

Snippets available, anyone wants them.

> 2. Use quilt

I've found using quilt to be troublesome. For example, you absolutely have
to tell quilt what files you are *going* to edit, otherwise, quilt will
miss your changes. And this situation happens more often than not; in my
experience, it happened quite often that I edited a file because I _knew_
where the failure was, to later find I forgot to tell quilt about that
file, and was missing that change in the patch series.

So, I would recommend against using quilt; rather use the package's
upstream repository, or at worse, create a temporary git tree just in
the package's extracted directory: it's much more convenient and
powerfull than using quilt.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
