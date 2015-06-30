From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Jun 2015 08:24:41 -0300
Subject: [Buildroot] [PATCH v2] configs/acmesystems_aria_g25: new configs
In-Reply-To: <CA+TH9Vkn625DJy8xzD-WCSZMpbPF_jE2C_eZ_jnVSfNFRv7NcA@mail.gmail.com>
References: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
 <CA+TH9Vkn625DJy8xzD-WCSZMpbPF_jE2C_eZ_jnVSfNFRv7NcA@mail.gmail.com>
Message-ID: <55927C79.1080700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/06/15 07:21, Angelo Compagnucci wrote:

> Hi Gustavo,

Hi Angelo.

>>   create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config
>>   create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config
>>   create mode 100644 board/acmesystems/aria-g25/readme.txt
>>   create mode 100644 configs/acmesystems_aria_g25_128mb_defconfig
>>   create mode 100644 configs/acmesystems_aria_g25_256mb_defconfig
>
> Can we agree on the configs name format? Sergio usually uses the
> format "acme-BOARD-MEMORY", I used acme-arietta-128m_defconfig for
> example. I really prefer to have a standard name format!

Of course, though i don't know who Sergio is :)
But you must follow the rule as well, is it acme (configs/) or 
acmesystems (board/) ?
It's not consistent for them to differ.

> This is better:
>
> echo ',32,6\n;' | sfdisk -uM /dev/sdX

I've used the xplained readme as basis.
Ideally we should script this thing up, probably making a somewhat 
generic one that takes parameters from an image file defined in the BR 
config.

> Config files for at91bootstrap are not really needed cause Sergio
> shipped them in it's own at91bootstrap fork, so you should simply use
> something like this in your bootstrap defconfig:
>
> BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"

I've missed the fact that the kernel command line is specified in the 
dts, so yes it seems reasonable.

Regards.
