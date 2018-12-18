From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 21:01:48 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <353c4c5d-5064-f92d-bfd0-5232bad2204a@licor.com>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com>
 <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer>
 <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
 <20181218084937.47142880@windsurf>
 <353c4c5d-5064-f92d-bfd0-5232bad2204a@licor.com>
Message-ID: <20181218200148.GI24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-18 14:14 +0000, Chris Lesiak spake thusly:
> On 12/18/18 1:49 AM, Thomas Petazzoni wrote:
> > On Mon, 17 Dec 2018 23:59:04 +0100, Arnout Vandecappelle wrote:
> >>   Which brings me to my question to Chris: what was the purpose of this patch to
> >> begin with? Since OPENSSH_USERS is already set, the sshd user will already exist
> >> in /etc/passwd, so the sysusers.d directive will be ignored... Either that, or
> >> our mkusers script doesn't work correctly.
> > Stateless systems, where /etc and /var don't even "exist" in a
> > persistent fashion, and are entirely populated at boot time.
> In my particular case, /etc is empty on first boot, but retains state 
> after that.? Even if I started with a populated /etc/passwd, when 
> updating /usr (switching in a new version to update the the OS), I might 
> have new services with associated users that I would like to have 
> automatically added to /etc/passwd.

So it can also serve for reset-factory situations, too, I guess? A
trigger that wipes the filesystem backing /etc and reboots, and then
you are in factory-pristine configuartion. Neat.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
