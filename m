From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2013 19:35:31 +0100
Subject: [Buildroot] [PATCH 1/4] post-{build,
 images} hooks: export BUILD_DIR too
In-Reply-To: <a4300dc9-2aa9-4d40-9b79-26ec5b317c52@email.android.com>
References: <cover.1382894622.git.yann.morin.1998@free.fr>
 <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
 <a4300dc9-2aa9-4d40-9b79-26ec5b317c52@email.android.com>
Message-ID: <20131029183531.GE3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2013-10-27 22:12 +0100, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Also export BUILD_DIR for post-{build,images} hooks, so they do have
> >a place to store generated files.
[--SNIP--]
> >+# This extra environment we can not export ourselves, so we have
> >+# to expicitly pass it to user-supplied external hooks (eg.
> >+# post-build, post-images)
> >+USER_HOOKS_EXTRA_ENV=\
> >+	BUILD_DIR=$(BUILD_DIR)
> 
> I'd add a bit more info here: we cannot export BUILD_DIR globally
> because some packages, like uboot, also use this same variable for
> another purpose.

Will do, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
