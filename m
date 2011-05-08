From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 8 May 2011 15:23:44 +0200
Subject: [Buildroot] PATH
In-Reply-To: <20110508081440.78203647owixiiio@www.home.zuerker.org>
References: <20110508081440.78203647owixiiio@www.home.zuerker.org>
Message-ID: <201105081523.44670.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On Sunday 08 May 2011 15:14:40 Heiko Zuerker wrote:
> I'm almost done with the MySQL 5.5 script, but it requires ./ in the path.
> It may not be a bad idea to add this to Makefile.in (TARGET_PATH,  
> HOST_PATH), in case other packages have a similar behavior.
> Thoughts?
> (Worst case I'll just keep it in the mysql.mk)

In my opinion, . in the path is a Really Bad Idea (TM), and should not
only be avoided, but entirely banned.

Best would be to fix the MySQL build to not require . in the PATH.
And push the fix upstream.

If it's too complex, then keep it specific to MySQL. Don't make it generic
in buildroot, we want to catch the breakage in other packages so they can
get fixed instead.

My 2c.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
