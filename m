From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 18:01:29 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <fb512f72-301c-41de-8b2c-968784696955@zimbra2.corp.accelance.fr>
References: <fb512f72-301c-41de-8b2c-968784696955@zimbra2.corp.accelance.fr>
Message-ID: <201302181801.29121.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On Monday 18 February 2013 Jeremy Rosen wrote:
> do you plan to integrate this more tightly into buildroot ?

More tightly, I am not sure. However...

> i.e : for boards that need a particular partition layout have
> them provide a decription file for genimage and have genimage
> called directly from the fakeroot jail when such a file is
> configured ?

... these tools are intended to be used by post-image scripts, so
boards could provide both a genimage layout and a post-image script.

I am not sure we would want to integrate that into buildroot itself.
I am afraid doing so would complexify the infrastructure.

Also, the fakeroot jail is restricted to the filesystem image generation,
and post-image (and post-build) scripts are *not* run in the fakeroot,
although it is trivial to re-enter a new fakeroot from inside such a
post-{build,image} script, a-la:

    #!/bin/sh
    if [ $(id -u) -ne 0 ]; then
        exec fakeroot "${0}" "${@}"
    fi

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
