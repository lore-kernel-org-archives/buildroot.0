From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Dec 2012 11:08:28 +0100
Subject: [Buildroot] XBMC
In-Reply-To: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
References: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
Message-ID: <201212231108.28337.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Saturday 22 December 2012 Maxime Hadjinlian wrote:
> I wanted to add XBMC to buildroot, but since it's a pretty big
> application with a lot of dependency, I have created a separated tree
> at github :
> https://github.com/maximeh/buildroot
> 
> I would like to know if it would be of any interest to upstream this
> before sending all theses patches for review ?

I'm also interested in this series.

I see you've added tvheadend. I've also added it recently, and was about
to push it later today, see last commit in:
    https://gitorious.org/buildroot/buildroot/commits/yem-tvheadend

Besides the comments by Marek and Thomas, here are mine regarding tvheadend:

  - not sure it depends on libv4l. It builds just fine here without it;
    I'll double-check;

  - avahi is not a hard-dependency, tvheadend builds just fine without it,
    so I would not do a 'select' either;

  - it also does download some things during its ./configure stage,
    so we need a few hooks to do it the buildroot-way;

  - there's no init script installed by default, so it does not start
    at boot, so we need to install one ourselves. It looks like the
    bundled ones (for Debian and RedHat) will not be compatible with BR's
    init;

  - by default, tvheadend will not allow anyone in, so we have to create
    a basic DB with an admin account, and install that in the rootfs,
    otherwise, tvheadend will be absolutely unusable.

I'm polishing my version today, and will send a pull-request later today.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
