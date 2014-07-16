From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 22:05:26 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <53C61864.4080003@mind.be>
References: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
 <53C61864.4080003@mind.be>
Message-ID: <20140716200526.GF9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-07-16 08:15 +0200, Arnout Vandecappelle spake thusly:
> On 15/07/14 01:48, Yann E. MORIN wrote:
[--SNIP--]
> > This is because perl-net-ssleay's buildsystem is really completely
> > brain-damaged. Other perl extensions do not behave like that, and
> > instead are doing the only same thing to do: not add single quotes
> > around the definition, and just use what they were provided for
> > lddlflags.
> > 
> > So, just do the same for perl-net-ssleay. Since tweaking (yet once
> > more) their buildsystem is too complex, we just use a post-configure
> > hook to fix up the mess, by removing single quotes around the definition
> > of LDDLFLAGS.
> 
>  Are you sure that it is only perl-net-ssleay that is broken in this way, and
> not perl-xml-libxml?

No, perl-xml-libxml is not impacted by this issue. I just checked, and I
get a generated Makefile that contains:
    LDDLFLAGS = -shared -g

I maintain my position: perl-net-ssleay's buildsystem is brain-danaged! ;-)
And Fran?ois confirmed that in his reply, too. ;-)

If we needed yet another reason why bundling dependencies in one's own
package was just bad, perl-net-ssleay is just that example. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
