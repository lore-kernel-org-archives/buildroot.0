From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 18:29:13 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <20150208172043.GL16955@sapphire.tkos.co.il>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
 <20150208172043.GL16955@sapphire.tkos.co.il>
Message-ID: <20150208172913.GM4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-02-08 19:20 +0200, Baruch Siach spake thusly:
> Hi Vicente,
> 
> On Sun, Feb 08, 2015 at 03:07:05PM +0000, Vicente Olivert Riera wrote:
> > - Add version 2.21
> > - Add a hash value for it
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> The glibc NEWS for the 2.21 release[1] include this:
> 
> * The GNU C Library is now built with -Werror by default.  This can be
>   disabled by configuring with --disable-werror.

Yup, I had seen this. And I think this is a good idea for such a
critical piece of code.

> I think we should add --disable-werror when configuring glibc 2.21.

Why so? I think on the contrary we should keep the default, and only if
we find issues then we can investigate as to whether this is a real
error or not, and report that upstream.

Granted, we usually remove -Werror from packages when they fail to build
(and I am not a big fan of it, warnings should not be treated lightly),
but only in that case. If the package builds fine with -Werror, we
usually keep it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
