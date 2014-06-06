From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Jun 2014 19:06:58 +0200
Subject: [Buildroot] [PATCH 3/5] gnupg2: new package
In-Reply-To: <5391EDAD.6070908@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-4-git-send-email-Vincent.Riera@imgtec.com>
 <k2096bxgbf.ln2@ID-313208.user.individual.net>
 <5391EDAD.6070908@imgtec.com>
Message-ID: <20140606170658.GD3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincente, All,

On 2014-06-06 17:34 +0100, Vicente Olivert Riera spake thusly:
> On 06/06/2014 03:33 PM, Bernd Kuhls wrote:
> >afaik gnupg2 is compatible with uclibc if you use the existing libpthsem
> >package instead of your new pth package.
> 
> no, it doesn't build (as is) using libpthsem. Here is why:
[--SNIP--]
> So, we have three options here and we need to decide one of them:
> 
> Option 1: add the new pth package
>   pros: -there is no need to patch libpthsem
>   cons: -gnupg2 will not work with uclibc
> 
> Option 2: patch the libpthsem package
>   pros: -no need to add pth package
>         -gnupg2 will work with uclibc
>   cons: -we need to patch libpthsem to install compatibility stuff
> 
> Option 3: patch gnupg2 to use libpthsem in case of pth is missing
>   pros: -no need to add pth package
>         -gnupg2 will work with uclibc
>         -gnupg2 will work with both libpthsem and pth
>   cons: -patching gnupg2 source code should be accepted upstream

I think option 1 is the best for now.

If Bernd (or anyone else) is interested in making gnupg2 work on uClibc,
it will be possible for him to apply either option 2 or option 3 later
on. Adding support for uClibc can (and should) be done in a separate
patch, anyway.

And whatever the package we patch (pthsem or gnupg2 or both), the patch
should be submitted upstream, of course! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
