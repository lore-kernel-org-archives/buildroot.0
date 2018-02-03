From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:24:13 +0100
Subject: [Buildroot] [PATCH 12/14] size-stats-compare: fix code style
In-Reply-To: <20180129231353.64fa64c8@windsurf.lan>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1516581882-30582-13-git-send-email-ricardo.martincoski@gmail.com>
 <20180129231353.64fa64c8@windsurf.lan>
Message-ID: <20180203152413.GK2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ricardo, All,

On 2018-01-29 23:13 +0100, Thomas Petazzoni spake thusly:
> On Sun, 21 Jan 2018 22:44:40 -0200, Ricardo Martincoski wrote:
> > Fix these warnings:
> > E129 visually indented line with same indent as next logical line
> 
> Really?
> 
> >      header = next(reader)
> >      if (header[0] != 'File name' or header[1] != 'Package name' or
> > -        header[2] != 'File size' or header[3] != 'Package size'):
> > +            header[2] != 'File size' or header[3] != 'Package size'):
> 
> This looks totally bogus to me. The code was properly and nicely
> indented before the change, and now it looks badly indented. Is this
> really what flake8 wants? If so, flake8 is very strange.

I guess it 's probably more about the following line than about hte
previous one:

    if (header[0] != 'File name' or header[1] != 'Package name' or
        header[2] != 'File size' or header[3] != 'Package size'):
        print(("Input file %s does not contain the expected header. Are you "

... where there could be confusion with the 'printf' line.

Maybe the printf line could be indented one-level mnore, instead? Nope,
that does not solve the issue. I guess flake8 does not do look-ahead...

In this case, I would be happy with an exception...  # noqa E129

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
