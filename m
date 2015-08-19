From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Aug 2015 00:55:19 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <20150819224105.2993bbe5@free-electrons.com>
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
Message-ID: <20150819225519.GD13372@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-19 22:41 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 Aug 2015 08:30:13 +0200 (CEST), Thomas Petazzoni wrote:
[--SNIP--]
> >          arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/ef685a41a56e81dc93a40f23f8cd55860f44e055/
> >          arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/d842a17476e52f064d678a6a1a9ac5f7b6f2446e/
> >          arc |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/c42d72498e05364a718748caef74bba6c423d7d1/
> 
>   CC       shared/libshared_la-os-compatibility.lo
> src/compositor-rdp.c: In function 'rdp_peer_init':
> src/compositor-rdp.c:1109:10: error: 'rdpSettings' has no member named 'SurfaceFrameMarkerEnabled'
>   settings->SurfaceFrameMarkerEnabled = TRUE;

That's because we're using FreeRDP from the stable-1.1 branch, while
weston expect someything from the master branch.

For master, I'll mark the weston RDP compositor broken. For next, I'll
see if we can bump FreeRDP.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
