From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2017 09:52:23 +0200
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests
 to packages directories
In-Reply-To: <20170917071844.GA2930@scaer>
References: <bead9472ebddf2faaa023fd64dfe511e48827b0f.1505594291.git.yann.morin.1998@free.fr>
 <59be0604174a3_76dff67c8c964d2@ultri3.mail>
 <20170917071844.GA2930@scaer>
Message-ID: <20170917075223.GC2930@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-17 09:18 +0200, Yann E. MORIN spake thusly:
> On 2017-09-17 02:20 -0300, Ricardo Martincoski spake thusly:
> > On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:
[--SNIP--]
> > > +        package = os.path.basename(dir)
> > > +        for file in files:
> > 
> > You can import fnmatch to drastically reduce the number of regex compilations:
> >         for file in fnmatch.filter(files, '*.py'):
> Wee! :-)

In fact, no. At least, not in this state, because we do not want to
match _any_ .py file; instead, we want to match only .py files that are
named after the package.

But I guess I can make it to work with fnmatch nonetheless. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
