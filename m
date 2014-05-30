From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 16:24:23 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-29
In-Reply-To: <20140530063009.C131B1013EE@stock.ovh.net>
References: <20140530063009.C131B1013EE@stock.ovh.net>
Message-ID: <20140530142423.GA3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-30 08:30 +0200, Thomas Petazzoni spake thusly:
>        arm |                     ofono-1.14 | NOK | http://autobuild.buildroot.net/results/a84a35d3319aec09f7b83474bbed7235d4336fbc/

Happens because ofono links with -lc before -pthread, which is
considered to not be sound, and expected to fail. See:
    https://sourceware.org/bugzilla/show_bug.cgi?id=15648#c11

Investigating further...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
