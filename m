From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2015 19:07:55 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <CAOudHSVLKiTwrkv0xBNVW=ry3w1yOv4TJqP8+JMFSJRzw3dASQ@mail.gmail.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <20150915204528.GD3650@free.fr>
 <CAOudHSVLKiTwrkv0xBNVW=ry3w1yOv4TJqP8+JMFSJRzw3dASQ@mail.gmail.com>
Message-ID: <20150916170755.GA3563@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2015-09-15 18:42 -0400, Cjw X spake thusly:
[--SNIP--]
> I'm working on switching it over to be an autotools-package now.
> Newlib has a fun issue though. Newlib wants to install it's headers in
> the wrong place with respect to how buildroot builds its tools. When I
> modified newlib's configure.ac to fix the problem, I selected
> AUTORECONF for newlib to rebuild the automake tools. However, I get an
> error that it is the wrong autoreconf version. Apparently, it only
> works with version 2.64, and we are using version 2.69.
> 
> I can comment out the check, which appears to work, but that seems
> like a poor solution.

In this case, I thing the easiest is just o patch both configure.in and
configure, since the change is trivial, and comment in the patch that
newlib does not autoreconf, hence the two changes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
