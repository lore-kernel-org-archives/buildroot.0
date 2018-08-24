From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 09:55:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-23
In-Reply-To: <20180824060019.899B4207B1@mail.bootlin.com>
References: <20180824060019.899B4207B1@mail.bootlin.com>
Message-ID: <20180824075557.GL9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Hollis, All,

On 2018-08-24 08:00 +0200, Thomas Petazzoni spake thusly:
> Results for branch 'master'
>         i586 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55 |     
>       x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/1b32b5daf5d3e3cf77e6779af7d9b79ce7e6a8e5 |     

Those two occur on Hollis' autobuilder (again! ;-)), because the host
has kernel headers v2.6.32, which are too old for rauc, which needs
headers >= 3.0. However, we have no way to express this dependency on
host headers, only for the target headers...

(patch incoming to add that dependency for the target variant).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
