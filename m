From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Nov 2018 18:08:13 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <06c9bba5-3d39-5f92-6c0c-c0c6b4dd9c50@mind.be>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
 <06c9bba5-3d39-5f92-6c0c-c0c6b4dd9c50@mind.be>
Message-ID: <20181110170813.GE2445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-09 21:13 +0100, Arnout Vandecappelle spake thusly:
> On 08/11/2018 00:43, Arnout Vandecappelle wrote:
> >  I *think* the real problem is that fakeroot forgets to wrap the setxattrat and
> > lsetxattrat syscalls, and these are the ones that are used by tar.
> 
> ?So this was a stupid mistake - there is no setxattrat syscall, it's a function
> that is defined by tar itself.

ACK, thanks for the feedback.

> ?Peter's analysis looks a lot more accurate.

Except he was not using fakeroot, but sudo, which does work (as
explained in BZ-11216).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
