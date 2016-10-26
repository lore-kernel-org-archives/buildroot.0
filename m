From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Oct 2016 23:19:57 +0200
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <20161026211708.GA3593@free.fr>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161026211708.GA3593@free.fr>
Message-ID: <20161026211957.GB3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Sam, All,

On 2016-10-26 23:17 +0200, Yann E. MORIN spake thusly:
> On 2016-10-25 15:01 -0500, Matt Weber spake thusly:
> > From: Sam Voss <samuel.voss@rockwellcollins.com>
> > Add script to create kconfig fragment; defaults to busybox fragment if
> > only one config is specified (compares to package/busybox/busybox.config).
[--SNIP--]
> But we can do it much more simply, in a single command. Your script
> would be just (without even a requirement for bash):
> 
>     #!/bin/sh
> 
>     usage() {
>         cat <<-_EOF_
>         Blabla
>         _EOF_
>     }
> 
>     [ ${#} -eq 2 ] || { usage; exit 1; }
>     [ -f "${1}" ]  || { usage; exit 1; }
>     [ -f "${2}" ]  || { usage; exit 1; }
> 
>     comm -23 <( sed -r -e 's/ /_S_P_A_C_E_/g' "${FirstConfig}"  |sort -d ) \
>              <( sed -r -e 's/ /_S_P_A_C_E_/g' "${SecondConfig}" |sort -d ) \
>     |sed -r -e 's/_S_P_A_C_E_/ /g'

Of course, you would already noticed that you would have to replace
${FirstConfig} with ${1} and ${SecondConfig} with ${2}. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
