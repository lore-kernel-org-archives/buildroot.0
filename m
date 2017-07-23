From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Jul 2017 15:44:20 -0300
Subject: [Buildroot] [PATCH 2/4] testing/infra/builder: dump config to
	log
References: <20170723091441.GB2917@scaer>
Message-ID: <5974ee846d043_586e1244f2c29434@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jul 23, 2017 at 06:14 AM, Yann E. MORIN wrote:

> On 2017-07-23 01:20 -0300, Ricardo Martincoski spake thusly:
[snip]
>>          with open(config_file, "w+") as cf:
>>              cf.write(self.config)
>> +        # dump the config to the logfile for easy debugging
>> +        self.logfile.write("> config:\n" + self.config)
>> +        self.logfile.flush()
> 
> Although the variable is named 'comfig', it is in fact a defconfig.

Good point. I will rename it (not the variable, of course) in the commit log and
in the logfile.

> Also, it is easy to miss exactly where the end of the config is, so
> maybe:
> 
>   - prefix all lines with 'config: ',
> or
>   - add 'start config' and 'end config'.

The second one seems nicer to me, I will use '> start defconfig' and
'> end defconfig'.

> 
> Otherwise;
> 
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is the only tag I won't keep, since I am changing this patch.

I will also account for your comment on the last patch. Thank you for the hint.

I am marking patches 2 to 4 as Changes Requested.
Patch 1 (developers file only) I will keep in patchwork as-is.

Regards,
Ricardo
