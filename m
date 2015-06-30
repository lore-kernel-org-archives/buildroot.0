From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Jun 2015 08:24:39 -0300
Subject: [Buildroot] [PATCH] board/acmesystems/arietta: new board
In-Reply-To: <CA+TH9VktP3joMNWevTZ8rTU3X3FckhZL=0SkApSyxQCMDF13zg@mail.gmail.com>
References: <1434537135-32177-1-git-send-email-angelo.compagnucci@gmail.com>
 <5591C5EB.2010700@zacarias.com.ar>
 <CA+TH9VktP3joMNWevTZ8rTU3X3FckhZL=0SkApSyxQCMDF13zg@mail.gmail.com>
Message-ID: <55927C77.5090609@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/06/15 07:05, Angelo Compagnucci wrote:

> Hi Gustavo,

Hi Angelo.

>> Any particular reason you need a custom config instead of being able to use
>> at91_dt (like on the Aria sample i sent)?
>> I know the Arietta lacks an ethernet PHY, but the DTS should take care of
>> that.
>
> That configuration is really bloated, it compiles several unneeded
> modules and it's not really optimized for arietta.

We normally don't try to be too "smart ass" with the config files and 
try to use the ones shipped with the kernel if they work - after all you 
can't cover every use scenario out there and we just expect the boards 
to boot properly (which the default config will probably do).
Also since the arietta has at least 128MB RAM and boots from SD (plenty 
of flash) the bloat scenario isn't severe (many kernel options are built 
as modules).
Regards.
