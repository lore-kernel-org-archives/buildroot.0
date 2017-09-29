From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 10:29:33 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
In-Reply-To: <20170929080419.GA2899@scaer>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20170929022713.2967-4-ricardo.martincoski@gmail.com>
 <20170929080419.GA2899@scaer>
Message-ID: <20170929082933.GG2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-09-29 10:04 +0200, Yann E. MORIN spake thusly:
> On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
[--SNIP--]
> > diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> > index 9d5f714b02..045f5e80a4 100644
> > --- a/support/testing/infra/basetest.py
> > +++ b/support/testing/infra/basetest.py
> > @@ -41,13 +41,14 @@ class BRTest(unittest.TestCase):
> >      def __init__(self, names):
> >          super(BRTest, self).__init__(names)
> >          self.testname = self.__class__.__name__
> > -        self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
> > +        self.builddir = self.outputdir and os.path.join(self.outputdir,
> > +                                                        self.testname)
> 
> I think that in such situation, a better break would be right after the
> 'and' operator [...]

PEP8 states to split before binary operators.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
