From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Dec 2014 22:13:58 +0100
Subject: [Buildroot] [buildroot-test 1/2] Taking into account
 BR2_PREFER_STATIC_LIB rename
In-Reply-To: <20141221220305.7923490b@free-electrons.com>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141221220305.7923490b@free-electrons.com>
Message-ID: <20141221211358.GB4207@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-21 22:03 +0100, Thomas Petazzoni spake thusly:
> On Wed, 17 Dec 2014 22:47:37 +0100, Thomas Petazzoni wrote:
> >      if config["libc"] != "glibc" and randint(0, 20) == 0:
> > -        configlines.append("BR2_PREFER_STATIC_LIB=y\n")
> > +        configlines.append("BR2_STATIC_LIBS=y\n")
> 
> Instead, should I also sometimes test BR2_SHARED_STATIC_LIBS ? Like 5%
> of times static only, 5% of times static+shared, and 90% of the time
> shared only (the default) ?

Yes.

If there are some packages that do not like to be build both static and
shared at the same time, we want to catch those.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
