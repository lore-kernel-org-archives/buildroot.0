From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 May 2013 23:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] ser2net: add default init script
In-Reply-To: <20130505201932.GB13672@game.jcrosoft.org>
References: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
 <20130505135025.GA3246@free.fr>
 <20130505143252.GA13672@game.jcrosoft.org>
 <20130505145814.GB3246@free.fr>
 <20130505201932.GB13672@game.jcrosoft.org>
Message-ID: <20130505212328.GA3438@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On Sun, May 05, 2013 at 10:19:32PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 16:58 Sun 05 May     , Yann E. MORIN wrote:
> > On Sun, May 05, 2013 at 04:32:52PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > On 15:50 Sun 05 May     , Yann E. MORIN wrote:
> > > > On Sun, May 05, 2013 at 02:43:05PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > > > add option to specify the configuration file
[--SNIP--]
> > > > I think we should provide a default, basic configuration file that we
> > > > install unconditionnally to the rootfs. The user will then be free to
> > > > provide a post-build script to tweak that file.
> > > 
> > > I hate post-build it's not trackable and as it's completly board specific with
> > > x serial to export I do not want a generic file
> > 
> > It's not about what *you* want, it's about what is *best* for Buildroot
> > and *all* its users, *and* is maintenable and easily reproduced (which
> > pointing to a config file outside of the buildroot tree is definitely
> > not) *and* can fit your use case (which what I suggest should).
> 
> I want to put the ser2net.conf in the tree not our of tree

OK. So, why have it configurable if it is in the tree in the first place?

> > We're speaking about a _default_ and _simple_ configuration file. Of
> > course it can not cover all use cases, but just exporting a single
> > serial port would be enough. Customisation beyond that is really part of
> > the post-build scripts.
> the problem here which port you export?
> the ttyS0? no it's mostly the default console

Of course, ttyS0 is special because it is the console. ttyS1 is a good
candidate.

> how could you even think of any generic file as the name of the port(s) and
> configuration is board specific

IIRC, I never said 'generic'; I said 'default and basic', which I agree
did not completely convey what I meant. I think this file should be seen
as a (kind of) example that would work on some boards (eg. a PC) but
would anyway need further customisation.

> This will be completly board specific

Yes, I agree that will be board specific.

However, providing a default configuration file that exports ttyS1 can
serve as a basis for the user to customise.

We can't expect everything in Buildroot to work without customisation.
For example, a webserver will always have pages to serve, so the user
will have to provide those. And provide a certificate if he wants to
serve https. And so on... The same goes for this kind of configuration:
provide a simple, basic config file that the user can further customise,
or even entirely replace.

And this kind of customisation is done with post-build scripts.

However, an alternative solution would be to ask the user what port(s)
to export, and generate the config file from ser2net.mk. If this is not
enough, then a post-build script can be used to provide a more advanced
config file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
