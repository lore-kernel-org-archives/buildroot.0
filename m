From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 22:29:32 +0100
Subject: [Buildroot] [PATCH 08/10] support: mkusers: add warning when
 using mkpasswd from the host system
In-Reply-To: <87bnz7n2au.fsf@dell.be.48ers.dk>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-9-git-send-email-s.martin49@gmail.com>
 <87bnz7n2au.fsf@dell.be.48ers.dk>
Message-ID: <20140119212932.GH3387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-19 21:29 +0100, Peter Korsgaard spake thusly:
> >>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
> 
>  > Because the mkpasswd provided by some distribution does not support all
>  > options used in the mkusers script, mkpasswd has been integrated as a
>  > package.
> 
>  > However, using a custom rootfs skeleton, the host-mkpasswd target is not
>  > automatically built, even if some packages add users.
> 
>  > In this case, to help the Buildroot users understanding what happen when
>  > the mkpasswd from the host system is used (so, might fail), mkusers now
>  > print a warning message explaining how to solve this.
> 
> Why not just fix it to always use our mkpasswd? E.G. something like
> adding host-mkpasswd to dependencies in fs/common.mk if PACKAGE_USERS
> isn't empty?

We've already spoke about it with Samuel on IRC, and I was rather
leaning toward this: if the user uses a custom skeleton, lets just rely
on him to provide a proper set of users.

As an afterthought, I think this would not be correct from us, and that
we should indeed continue to generate those users.

So, agreed with Peter on that one. Sorry Samuel... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
