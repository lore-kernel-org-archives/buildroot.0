From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2015 18:05:13 +0100
Subject: [Buildroot] [PATCHv2] core: add defconfig to .gitignore
In-Reply-To: <20151229091922.41fac4b7@free-electrons.com>
References: <1451249086-24341-1-git-send-email-yann.morin.1998@free.fr>
 <20151229091922.41fac4b7@free-electrons.com>
Message-ID: <20151229170513.GA3445@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-29 09:19 +0100, Thomas Petazzoni spake thusly:
> On Sun, 27 Dec 2015 21:44:46 +0100, Yann E. MORIN wrote:
> > From: Karoly Kasza <kaszak@gmail.com>
> > 
> > After using "make safedefconfig", a defconfig file appears which is an
> > extract of the .config file. When running git, it incorrectly detects it as a
> > source code change.
> > 
> > Add /defconfig to .gitignore.
> > 
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> > [yann.morin.1998 at free.fr: do not remove on distclean]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I continue to question whether this is the right thing to do.
> "defconfig" is really only the default name, and it can be changed to
> anything by changing BR2_DEFCONFIG. So should we gitignore the default
> name, but not any other name?
> 
> I'm for the principle of least surprise, and I would personally find it
> odd that we gitignore the default name only. Since we can't gitignore
> all defconfigs, I'd prefer to not gitignore any of them.

Yes, and I guess with the recent ML issues you did not catch my reply in
the initial thread;
    http://lists.busybox.net/pipermail/buildroot/2015-December/148452.html

And since I did respin that patch before you replied there, this is now
moot. At that time, that patch did not appear on Pathwork when I wanted
to mark it reject. I guess it is now marked Rejected in Patchwork? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
