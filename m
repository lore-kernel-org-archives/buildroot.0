From: Vineet Gupta <vgupta@synopsys.com>
Date: Thu, 7 Jan 2021 08:43:16 -0800
Subject: [Buildroot] ARC no console output (was Re: [PATCH 1/2]
 init/console: Use ttynull as a fallback when there is no console)
In-Reply-To: <8735zdm86m.fsf@jogness.linutronix.de>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
Message-ID: <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On 1/7/21 1:02 AM, John Ogness wrote:
> Hi Vineet,
> 
> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>> This breaks ARC booting (no output on console).
> 
> Could you provide the kernel boot arguments that you use? This series is
> partly about addressing users that have used boot arguments that are
> technically incorrect (even if had worked). Seeing the boot arguments of
> users that are not experiencing problems may help to reveal some of the
> unusual console usages until now.


Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 
console=ttyS0,115200n8 debug print-fatal-signals=1

And we do have serial driver built-in.

Thx,
-Vineet
