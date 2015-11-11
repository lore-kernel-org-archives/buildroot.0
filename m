From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2015 23:58:20 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <20151111235359.707acc35@free-electrons.com>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
Message-ID: <20151111225820.GB3968@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-11 23:53 +0100, Thomas Petazzoni spake thusly:
> On Mon,  9 Nov 2015 20:00:21 +0100, Yann E. MORIN wrote:
> > Currently, we set HOSTARCH to the output of `uname -m`. This gives us
> 
> > But since w eintroduced the latest Linaro toolchains, we now have
> > toolchains that require a 64-bit userland.
> > 
> > So, when running on a 64-bit kernel, we believe those toolchains are
> > available, even when the user is running a 32-bit userland. This causes
> > build failures for our autobuilders, like so:
> > 
> >     http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/
> 
> Those build failures are not caused by a 32 bits vs. 64 bits issue. In
> fact, I started running my chroot under "linux32", but it was even
> worse. Because indeed my chroots *are* 64 bits.

OK, but still, in a 32-bit chroot, in the linux32 personality, we were
trying to use the 64-bit variant of the toolchain. And I observed the
same symptom as the autobuild failures.

So, two different problems, with a single symptom.

This patch adresses the 32-bit vs. 64-bit issue I encountered.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
