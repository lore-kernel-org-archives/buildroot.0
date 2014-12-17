From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Dec 2014 15:24:44 +0000
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <20141217161406.1f418842@free-electrons.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
 <20141217161406.1f418842@free-electrons.com>
Message-ID: <1418829884.4132.13.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2014-12-17 at 16:14 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 17 Dec 2014 15:03:12 +0000, Alexey Brodkin wrote:
> 
> > Well, actually putting "console" in BR2_TARGET_GENERIC_GETTY_PORT
> > resolves only part of issues - need to specify particular tty.
> > 
> > But still we have serial port settings like baudrate.
> > BR2_TARGET_GENERIC_GETTY_BAUDRATE_x must match your serial port
> > settings.
> > 
> > So we're loosing flexibility of my approach here, but what is even more
> > important imagine if there're 2 serial ports in the system and they have
> > different baudrates but both properly described in kernel bootargs. With
> > BR2_TARGET_GENERIC_GETTY only 1 console could be used then but not
> > either of them.
> 
> Ah, yes I haven't looked at the baudrate issue. Isn't there a way to
> not pass any baudrate to getty, and let it use whatever baudrate is
> already configured on the device?

Probably not. At least in case of Busybox I saw this on attempt to
execute getty without baudrate at all.

--->---
BAUD_RATE of 0 leaves it unchanged

BusyBox v1.22.1 (2014-12-15 15:41:48 MSK) multi-call binary.

Usage: getty [OPTIONS] BAUD_RATE[,BAUD_RATE]... TTY [TERMTYPE]
Open TTY, prompt for login name, then invoke /bin/login

        -h              Enable hardware RTS/CTS flow control
        -L              Set CLOCAL (ignore Carrier Detect state)
        -m              Get baud rate from modem's CONNECT status
message
        -n              Don't prompt for login name
        -w              Wait for CR or LF before sending /etc/issue
        -i              Don't display /etc/issue
        -f ISSUE_FILE   Display ISSUE_FILE instead of /etc/issue
        -l LOGIN        Invoke LOGIN instead of /bin/login
        -t SEC          Terminate after SEC if no login name is read
        -I INITSTR      Send INITSTR before anything else
        -H HOST    
--->---

-Alexey
