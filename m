From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 23:09:05 +0200
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
Message-ID: <20140429210905.GE3248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo, All,

On 2014-04-29 21:48 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> For this cleanup session, here are the patches:
[--SNIP--]
> package/makedevs: add "l" type for symlinks ownership change
> angelo dureghello <angelo70@gmail.com>
> http://patchwork.ozlabs.org/patch/283015
> 
> C unsure: Angelo: could you describe in more detail if you are still
> using this patch, and why you need it? How come the symbolic link does
> not have the right ownership from the start?

Note that ownership and permissions of symlinks are never checked, only
those of the pointed-to entity (file, dir...) are.

Setting ownership of symlinks should not generally be a concern.

However, I can se one case where we would want to be able to set
ownership and/or permissions on a synlink: to avoid the identity of the
"builder" to seep down into the generated filesystem. But even in that
case, only the numerical UID would end up in the generated filesystem,
so it is not really a concern.

So, I can't really understand what the underlying problem is.

Angelo, we need you to explain the issue you are facing, so we understand
why you believe this change to be needed.

(Note: a proper commit message would do just that: describe the observed
problem, explain the underlying reason it behaves that way, introduce
and explain the proposed fix. See for example cset 86c3244 "wget: fix
host-gettext build dependency race" for a real-world example.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
