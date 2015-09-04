From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2015 18:31:21 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E9540C.9060000@mind.be>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
 <55E9540C.9060000@mind.be>
Message-ID: <20150904163121.GD4540@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2015-09-04 10:19 +0200, Arnout Vandecappelle spake thusly:
> On 04-09-15 10:11, Thomas Petazzoni wrote:
> > On Fri,  4 Sep 2015 01:47:42 +0200, Yann E. MORIN wrote:
> > 
> >> +config BR2_ROOTFS_MERGED_USR
> >> +	bool "Use symlinks to /usr for /bin, /sbin and /lib"
> > 
> > Shouldn't we make this a blind option? I.e just do merged usr for
> > systemd always, and never do it for !systemd.
> 
>  I will always turn this option on, even in non-systemd, because it makes for a
> better environment. See the Fedora document for a long explanation why split
> /usr is just legacy baggage. Other parts of your system will also work better
> when this option is turned on - no more confusion between busybox installing
> something in /bin and the full package putting it in /usr/bin. No more worries
> about a shebang being correct.
> 
>  So no, I don't want this to be hidden.

Ditto, I do not want this to be hidden. I want to have the choice of
using a merged-usr even without systemd (and I even have a use-case in
my head for that).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
