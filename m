From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 20:13:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default
 to X.org modular server
In-Reply-To: <20150411195842.52a58aff@free-electrons.com>
References: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
 <20150411195842.52a58aff@free-electrons.com>
Message-ID: <20150411181330.GL4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2015-04-11 19:58 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2015 19:13:56 +0200, Bernd Kuhls wrote:
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> > v2: Change default for all toolchain configurations (Thomas)
> 
> Well, it's not actually changing the default for all toolchain
> configurations, since the modular X.org variant requires C++ support,
> while the KDrive variant does not.
> 
> However, probably this doesn't matter. On such a change, I'd like to
> have a Acked-by from a few other Buildroot developers. Yann, Arnout,
> Gustavo, what do you think?

I would not mind much doing the switch to the modular Xserver by
default. But that would mean proper dependency propagation (i.e. C++).

However, an alternative solution would be to remove the 'default' clause
altogether from the choice:

  - if C++ is available, the modular Xserver is enabled by default,
    being the first option in the choice;

  - if C++ is not enabled, then KDrive is enabled, being the only option
    in the choice.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
