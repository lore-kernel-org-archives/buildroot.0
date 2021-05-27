From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 17:44:35 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
Message-ID: <20210527154435.GV3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2021-05-27 17:33 +0200, Andreas Hilse via buildroot spake thusly:
> following up on this because I also encountered this error.
> 
> There is a bug report on the grub bug tracker by Tony Battersby who
> bisected the error down to a certain patch/bugfix:
> https://savannah.gnu.org/bugs/?60458
> 
> The mentioned patch has also been included in buildroot as
> boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch with
> commit e840f2d469.
> 
> I can also confirm, that removing that patch fixes the issue of grub
> loop of endless rebooting.

Thanks for the report.

However, this patch is a security fix, so reverting it is not so nice
either.

Since it seems that using another optimisation level works arorund the
issue, I would be more inclined to change that, e.g. to -Os, as the
reporter seems to imply it works for them.

Would you please send a patch with such a workaround, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
