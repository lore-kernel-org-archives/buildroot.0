From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Nov 2013 00:01:03 +0100
Subject: [Buildroot] still trusting ccache ?
In-Reply-To: <52951C8A.5030603@mind.be>
References: <DD0F4606257B467E8A4CA405E36B5548@JohanW7>
 <52951C8A.5030603@mind.be>
Message-ID: <20131126230103.GB3948@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Sagaert, All,

On 2013-11-26 23:11 +0100, Arnout Vandecappelle spake thusly:
> On 25/11/13 22:13, Sagaert Johan wrote:
> >PS I noticed that besides .buildroot-ccache there is also a .ccache created when building.
> 
>  Hm, that's strange...

I confirm that a ~/.ccache dir is created.

However, the only files there are 'stat' files:

    $ find ~/.ccache -type f
    .ccache/0/stats
    .ccache/2/stats
    .ccache/3/stats
    .ccache/4/stats
    .ccache/5/stats
    .ccache/6/stats
    .ccache/7/stats
    .ccache/8/stats
    .ccache/9/stats
    .ccache/CACHEDIR.TAG
    .ccache/a/stats
    .ccache/b/stats
    .ccache/c/stats
    .ccache/d/stats
    .ccache/e/stats
    .ccache/f/stats
    $ du -hs ~/.ccache
    132K    /home/ymorin/.ccache

I do not know why it would not store its statistics in ~/.buildroot-ccache
although it looks like harmless.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
