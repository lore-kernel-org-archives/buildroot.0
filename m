From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jun 2014 22:28:18 +0200
Subject: [Buildroot] [PATCH V4 1/2] google-breakpad: new package
In-Reply-To: <5390D15E.3070503@gmail.com>
References: <1401881573-12921-1-git-send-email-pascal.huerst@gmail.com>
 <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
 <20140604195302.GF3325@free.fr> <5390D15E.3070503@gmail.com>
Message-ID: <20140605202818.GI3553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2014-06-05 22:21 +0200, Pascal H?rst spake thusly:
> > Besides, not all package install their files in staging. You
> > should use TARGET_DIR instead.
> 
> Aren't all binaries in TARGET_DIR stripped? If so, it doesn't really
> make sense to run gen_syms in TARGET_DIR.

They are stripped only just before making the filesystem images.
So, if you run your script before that, you'll get unstripped binaries
in the target/ dir.

[--SNIP alternate script proposal--]
> Ok, I understand your concerns and the find-call is by far not
> perfect, but the whole reason why I setup the directory structure that
> way, is because googles minidump-stackwalk expects it that way. See:
> https://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide#Producing_symbols_for_your_application

OK (I was afraid that layout was indeed a requirement). You can keep the
layout as you created it. Just adapt my script so it generates the proper
layout.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
