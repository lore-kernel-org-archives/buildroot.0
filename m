From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2013 18:52:18 +0100
Subject: [Buildroot] genmanual: generates kconfiglib.pyc in Buildroot
 source tree
In-Reply-To: <52A03286.3070808@mind.be>
References: <20131204225227.GH3332@free.fr>
 <52A03286.3070808@mind.be>
Message-ID: <20131205175218.GA3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-05 09:00 +0100, Arnout Vandecappelle spake thusly:
> On 04/12/13 23:52, Yann E. MORIN wrote:
> >Samuel, All,
> >
> >When one runs 'make manual', python will create:
> >     support/scripts/kconfiglib.pyc
> >in the Buildroot source tree.
> >
> >Python will happily run, even if it is not able to generate that file
> >(eg. because the source tree is read-only).
> >
> >However, the file is not cleaned on 'make clean'. I'm a bit reluctant at
> >adding it since it would try to remove a file outside of $(O), which
> >could break parallel builds in multiple $(O) at the same time... Not
> >sure what to do here.
> >
> >Since we do not really care about speed, would it be possible to tell
> >python not to generate it at all?
> 
>  I do 'man python', and the first thing I see is
> 
> -B     Don't write .py[co] files on import. See also PYTHONDONTWRITEBYTECODE.

Hey! I read the manpage, but only greped for '\.pyc' not for this.
Thanks for pointing it to me.

>  I'd say, go for it! Unfortunately, you can't add it directly in the #! line
> of the script because all the arguments are concatenated together. So I
> guess the PYTHONDONTWRITEBYTECODE environment variable should be set when
> calling the script.

Patch on its way.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
