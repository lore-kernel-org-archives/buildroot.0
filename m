From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 19:28:42 +0200
Subject: [Buildroot] [PATCH v3 2/3] apply-patches.sh: Use [[...]]
 construct instead of [...] construct
In-Reply-To: <00392aed-ce27-4eea-985b-75f06f79e0d7@email.android.com>
References: <1406826517-6106-1-git-send-email-fabio.porcedda@gmail.com>
 <1406826517-6106-3-git-send-email-fabio.porcedda@gmail.com>
 <00392aed-ce27-4eea-985b-75f06f79e0d7@email.android.com>
Message-ID: <20140731172842.GE3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-31 19:19 +0200, Thomas De Schampheleire spake thusly:
> Fabio Porcedda <fabio.porcedda@gmail.com> schreef:
> >The [[...]] construct it's an improved and safer construct than the
> >[...] construct. It's safer because it doesn't do "word splitting" so
> >we don't need to enclose variable expansion with double quotes, e.g:
> >
> >   [ -e "$file" ] -> [[ -e $file ]]
> >---
> 
> 
> I'm not so convinced by this patch. [[]] is a bashism, it is not
>  supported in all shells. 

Well, apply-patches is  bash script (it has the correct sha-bang.)
But it is almost POSIX. The only bashism currently used is the
'function' keyword to declare functions. REmove this, and we have a
POSIX script.

> Yes, using single brackets means that you need to take care, 
> but anyway shell programming has many pitfalls.
> 
> In the past people have sent patches to make Buildroot 
> more compatible with non-bash shells, so moving in the opposite
>  direction is not a good idea IMO.

Agreed. Besides, the gains from that change are not worth it, IMHO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
