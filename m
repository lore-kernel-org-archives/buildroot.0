From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Aug 2012 12:23:46 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201208261223.46075.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Saturday 25 August 2012 17:06:05 Thomas Petazzoni wrote:
> I got sick of having build issues related to libffi needs of threads,
> of the absence of support for sh2a in libffi, so I did the work needed
> to ensure that libffi would not be used anymore in those two cases.
> 
> This is a boring work, because libffi is mandatory for Python and
> glib2, and glib2 has a crazy number of reverse dependencies that do
> "select BR2_PACKAGE_LIBGLIB2", and therefore overstepping the
> dependencies of glib2.
> 
> This patch, I hope, illustrate how crazy this story of "depends on"
> needed for toolchain options has become. We need to find a solution
> for this. Yann has proposed something (see
> http://lists.busybox.net/pipermail/buildroot/2012-August/057144.html).
> 
> Opinions? My patch, or Yann's solution? Other solutions?

I'm sorry to say that, but pushing dependencies down to every package is
ugly.

What would happen when/if hte next libffi release does support sh2a?
You'd have to undo most of this work with another thousands-packages patch.

Today, I'll be working on my proposal (eg. the BR2_PKG_XX_AVAILABLE stuff),
and will post a patchset.

Thus, we'll be able to compare.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
