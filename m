From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 18:09:23 +0100
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <20150920230136.513b491c@free-electrons.com>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
 <20150920190622.3f7278c3@free-electrons.com>
 <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
 <20150920230136.513b491c@free-electrons.com>
Message-ID: <20160110170922.GH3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Jonathan, All,

On 2015-09-20 23:01 +0200, Thomas Petazzoni spake thusly:
> On Sun, 20 Sep 2015 20:15:02 +0300 (IDT), Jonathan Ben Avraham wrote:
> 
> > I wondered whether to send a patch for each 'select' individually or to 
> > wait until I complete my testing and submit a single patch with all of the 
> > lxc selects. What do you prefer?
> 
> Both solutions are fine with me. You can send patches as you
> progressively discover the issues, or send a single patch fixing all
> problems at once.
> 
> I'm just wondering if we want to make all these dependencies actually
> mandatory or not. It seems some of these dependencies are only used for
> one specific tool in LXC. If the tool is not crucial in LXC usage,
> maybe we should make it optional via a sub-option? I'm not sure here,
> just thinking out loud.

Well, lxc is already in the 'server-class' software, probably to run a
bunch of containers, themselves in the 'bloatware-class'.

So, the overhead of having gzip is probably insignifiant in the face of
the size of the rest of the system.

So, I'm OK with selecting gzip unconditionally.

However, I would not want to force-select BB_SHOW_OTHERS, even though we
already do it in three locations. Well, damn be it, just select both.

Jonathan, care to fix and respin, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
