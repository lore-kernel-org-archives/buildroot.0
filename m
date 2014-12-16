From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 08:14:50 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141216081450.6438bdb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 15 Dec 2014 11:56:24 +0300, Alexey Brodkin wrote:
> Consider following cases:
>  * Buildroot only builds rootfs that could be used on systems with
>    different default serial ports (ttyS0, ttyS1, ttyAMA3 etc)

To achieve this, there is no need for a new option, just specify
"console" as the terminal on which to run getty. The only change needed
is to add "console" to /etc/securetty.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
