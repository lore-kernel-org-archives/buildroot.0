From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2012 18:44:24 +0100
Subject: [Buildroot] [RFC] Allow packages to create users
Message-ID: <201212301844.24383.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recently, I've had the need for a package to create a user to
run its daemon as:
    http://lists.busybox.net/pipermail/buildroot/2012-December/064044.html

The solution was ugly and very specific to this package, so it was
(rightfully!) refused, until there is a generic way for packages to
create users.

I now have a prototype that is working in simple cases:
    https://gitorious.org/buildroot/buildroot/commits/yem-package-create-user

(The commit titled 'package/foo: new package to test adding users' is a
dummy, temporary commit, it will be removed before a pull-request is made).

The documentation for this new feature is available at:
    http://ymorin.is-a-geek.org/download/tmp/br/manual/manual.html#generic-package-reference

The new variable is FOO_USERS, with its syntax defined here:
    http://ymorin.is-a-geek.org/download/tmp/br/manual/manual.html#makeuser-syntax

I'd appreciate comments, especially on the syntax.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
