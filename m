From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 19:18:08 +0100
Subject: [Buildroot] [PATCH 1/3] system/skeleton: add the shadow-group
	file
In-Reply-To: <20121231181824.3f82197f@skate>
References: <cover.1356909238.git.yann.morin.1998@free.fr>
 <3633f72d3f35d4413bec319971b1a8d26c2fbaeb.1356909238.git.yann.morin.1998@free.fr>
 <20121231181824.3f82197f@skate>
Message-ID: <201212311918.08866.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 31 December 2012 Thomas Petazzoni wrote:
> On Mon, 31 Dec 2012 00:26:02 +0100, Yann E. MORIN wrote:
> > /etc/gshadow is to /etc/group what /etc/shadow is to /etc/passwd.
> 
> Could you give some more details? I understand /etc/shadow as opposed
> to /etc/passwd, but I don't see the point of /etc/gshadow since groups
> don't have passwords.

Wrong. Groups can have passwords. And users can change-group with:

    $ newgrp [-] groupname

If the user is a member of that group, or the group is paswrod-less, then
no password is asked for, and the current group-id has changed (it is a bit
like 'su', but to just change group)

If the user is not a member that group, and the group is not restricted (eg.
password is not '*' and does not start with '!', then the user is asked to
enter the group password.

See:
    group(5) gshadow(5) newgrp(1)

I hope that was enough to explain addition of gshadow. ;-)

Happy New Year!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
