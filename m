From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 12:32:59 +0200
Subject: [Buildroot] [PATCH 2/2] libcgicc: bump to version 3.2.13
In-Reply-To: <20140330113051.5c43cc69@skate>
References: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>
 <1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
 <20140330113051.5c43cc69@skate>
Message-ID: <20140330103259.GB3152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-30 11:30 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Mar 2014 20:19:00 -0300, Gustavo Zacarias wrote:
> > Also add license files and docs license definition.
> > 
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  package/libcgicc/libcgicc.mk | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Applied, thanks, with one minor change.
> 
> > +LIBCGICC_LICENSE = LGPLv3+, docs: GFDL1.2+
> 
> I've changed this to the more traditional:
> 
> 	LGPLv3+ (library), GFDL1.2+ (docs)
> 
> Though I'm wondering if:
> 
>  * We shouldn't use GFDLv1.2+ instead, like we do for GPL/LGPL.

For the sake of consistency, yes.i

For the records, however, SPDX does not list any 'or-later' for the GFDL:
    http://spdx.org/licenses/

    ---
    GNU Free Documentation License v1.1         GFDL-1.1
    GNU Free Documentation License v1.2         GFDL-1.2
    GNU Free Documentation License v1.3         GFDL-1.3
    GNU General Public License v1.0 only        GPL-1.0
    GNU General Public License v1.0 or later    GPL-1.0+
    GNU General Public License v2.0 only        GPL-2.0
    GNU General Public License v2.0 or later    GPL-2.0+
    ---

But that is valid for an author to specify this 'or later', so OK for
the 'GFDLv1.2+'

>  * Whether we should really worry about the documentation license,
>    since we don't allow the installation of the documentation on the
>    target. I don't think we have any other package that describe the
>    license of their documentation.

Well, if we're sure there's no installed doc, then we do not need this
in the licensing info. But if in doubt, better let the user check on his
side if the license indeed applies or not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
