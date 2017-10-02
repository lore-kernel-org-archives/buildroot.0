From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Oct 2017 08:06:49 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
In-Reply-To: <59d191cdafd96_6a703fce1469bdfc55573@ultri3.mail>
References: <20170929080419.GA2899@scaer>
 <59d191cdafd96_6a703fce1469bdfc55573@ultri3.mail>
Message-ID: <20171002060649.GC4753@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-10-01 22:09 -0300, Ricardo Martincoski spake thusly:
> On Fri, Sep 29, 2017 at 05:04 AM, Yann E. MORIN wrote:
> > On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
[--SNIP--]
> > But I would like to allow for a bit longer lines, because we already
> > have quite some deeply indented code, and 79 chars wide lines are all
> > the shorter.
> > 
> > So I would suggest we add this file:
> > 
> >     $ cat support/testing/setup.cfg:
> >     [flake8]
> >     max-line-length=132
> 
> I didn't know about this option. Nice!
> 
> > 
> > Thoughts?
> 
> My personal preference is to use the default. We can add "  # noqa" to the
> exceptions.
> The beauty of using default values is that anyone can call the tool without
> thinking about config files or command line options.

Yes, but flake8 will automatically find and use that file, so users do
not need to pass any option when calling flake8. That's the beauty of
it:

http://flake8.pycqa.org/en/latest/user/configuration.html#project-configuration

> But well... we can add a command line to the manual (as we have for
> git format-patch), or either add such config file for the test infra and also
> for all directories that have Python files.
> 
> If we follow this path of adopting command line arguments or a config file,
> don't worry about the test files in the package directories
> (http://patchwork.ozlabs.org/patch/814544/), I will send a RFC patch that also
> checks files pointed by symlinks.
> 
> The bikeshedding challenge is to define the magic number: 100? 132? 150?

I did not choose 132 randomly; I choose it for a reason.

https://en.wikipedia.org/wiki/132_(number)

The number of columns of a Line printer printing in landscape mode on
14-inch paper.  /(while in portrait it was 80)/

Also, 132 was the alternative line width on a VT (vt200? my memory of
it is a bit fuzzy... ;-] )

So, 132 is a good fit. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
