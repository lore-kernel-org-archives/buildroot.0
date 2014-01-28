From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 19:32:02 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
 <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
Message-ID: <20140128183202.GC3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2014-01-28 11:50 +0100, Waldemar Rymarkiewicz spake thusly:
> > I am not sure I fully get your patch, what is wrong with putting
> > path/to/my_script.sh ? You don't have to specify the full path, a
> > relative path works well.
> 
> Nothing is wrong to put full path to your scripts. Just a matter of
> what you prefer.
> 
> Try to put script file in buildroot directory and set the post script
> variable  using just the name of the script. I does not work for me
> and I'm pretty sure it does not work for you as well. This is simply
> how Makefile calls the scripts.
> 
> This patch is just addition to run post scripts referenced by relative
> paths as well, nothing more.

Why don't you just set:
  BR2_ROOTFS_POST_BUILD_SCRIPT="./my-script ./my-second-script"

(Ditto for BR2_ROOTFS_POST_IMAGE_SCRIPT.)

I'd say, we don't need that change. I prefer the user be explixit about
what he intends to do, rather than Buildroot guessing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
