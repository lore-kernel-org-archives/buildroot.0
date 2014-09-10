From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Sep 2014 00:10:49 +0200
Subject: [Buildroot] [PATCH 06/12] gcc/4.9: add patch to warn about
 unsafe header paths
In-Reply-To: <20140910222400.5850961c@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140910200825.GB23947@free.fr>
 <20140910222400.5850961c@free-electrons.com>
Message-ID: <20140910221049.GI23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-10 22:24 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 10 Sep 2014 22:08:25 +0200, Yann E. MORIN wrote:
> 
> > > ++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> > > ++  if (temp && strlen(temp) > 0)
> > > ++    {
> > > ++      save_switch("-Werror=poison-system-directories", 0, NULL, false, true);
> > 
> > Here you set the --error-poison-system-direcotries for the linker...
> 
> No, that's not what's happening here. What's happening here is that if
> BR_COMPILER_PARANOID_UNSAFE_PATH is set and non-empty, then we add
> -Werror=poison-system-directories to the gcc options. This makes gcc
> behave as if -Werror=poison-system-directories was passed on the
> command line.

Ah, I see now. OK. We tell gcc to treat that warning as an error.
Of course. :-)

Forget my comment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
