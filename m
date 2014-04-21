From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 16:13:13 +0200
Subject: [Buildroot] [PATCH] syslinux: install helper programs to the
	host
In-Reply-To: <CA+-urNQ8ME28j_cCfhYu=poEot8yFpEXexHce4iieV0rAbaeRA@mail.gmail.com>
References: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
 <20140420115741.1cb6a1b2@skate>
 <CA+-urNQ8ME28j_cCfhYu=poEot8yFpEXexHce4iieV0rAbaeRA@mail.gmail.com>
Message-ID: <20140421141313.GA3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, Thomas, All,

On 2014-04-21 09:18 -0400, Frank Hunleth spake thusly:
> On Sun, Apr 20, 2014 at 5:57 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Frank, syslinux upstream is now at version 6.x. Since you're using
> > syslinux, could you take care of updating the package in Buildroot to
> > match the latest upstream version?

To be noted: I am already working on this too. :-)

> I looked into this some last night and got as far as porting two new
> prerequisite packages for 6.x and then debugging issues with building
> the new EFI code. I personally don't use EFI, and without more digging
> into it I wasn't sure how to turn off its compilation.

syslinux is a pain to use in cross-compilation, as it assumes headers and
libs from gnu-efi to be in /usr/blabla so it's a pain to make it work in
Buildroot.

That, plus a few other nits here and there...

But I have a few patches here to fix the issue for us. It may even be
possible to shape them for upstream...

> It looks like it will take a little longer to make progress on this,
> and I'm not sure when I'll have time again. In the mean time, if there
> are any other interested syslinux users on this list, feel free to
> contact me and I'll try to explain where I'm at with my partial work.

As I am also working on this, if you just posted your changes (on the
list on in a public git tree), I can incorporate your changes I am
missing, and submit those.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
