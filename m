From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 17:15:12 +0200
Subject: [Buildroot] [PATCH v2 1/3] infra: Move --enable/--disable-debug
 to package/Makefile.in
In-Reply-To: <20141019170930.6cfe86d0@free-electrons.com>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019170930.6cfe86d0@free-electrons.com>
Message-ID: <20141019151512.GW4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-19 17:09 +0200, Thomas Petazzoni spake thusly:
> On Sun, 19 Oct 2014 11:59:01 +0200, Bernd Kuhls wrote:
> > A lot of packages ignored BR2_ENABLE_DEBUG. This patch simplifies the handling of
> > this option by adding the corresponding configure option to the global Makefile
> > for target packages.
> > 
> > For host packages --disable-debug is added to the global Makefile.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Patches 1 and 2 applied. For patch 3, I'm a bit hesitant: there are
> only two packages using --disable-gtk-doc-html. Does it really make
> sense to factorize that in the package infrastructure?
> 
> Cc'ing Yann to get his input, since he Reviewed-by the patc in question.

Well, my Reviewed-by means just that: I reviewed it, and found it was
correct. It does not mean I think it should go in.

However, I do believe it should go in. The more generic stuff we move
into the infra, the easier it will get to review packages.

And since we already have four documentation-rleated switches, it makes
sense to add another one. Further more, we do have --disable-gtk-doc, so
adding --disable-gtk-doc-html really makes sense, for consistency.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
