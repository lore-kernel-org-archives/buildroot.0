From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 11:56:19 -0300
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <20160519165112.6a8799cf@free-electrons.com>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
 <20160519160603.3debab78@free-electrons.com>
 <573DC881.2030409@zacarias.com.ar>
 <20160519161455.2bacf98f@free-electrons.com>
 <573DCB2F.1020200@zacarias.com.ar>
 <20160519165112.6a8799cf@free-electrons.com>
Message-ID: <573DD413.1050603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/05/16 11:51, Thomas Petazzoni wrote:

> Hello,
>
> On Thu, 19 May 2016 11:18:23 -0300, Gustavo Zacarias wrote:
>
>> Well, no, after bumping to 4.5.5 connman will go broken with the hacky
>> patch because it's incompatible with the kernel fix upstream.
>
> Yes, but if we:
>
>   1/ Apply your patch 1/2 which bumps to 4.5.5
>
>   2/ Apply your patch 2/2 which removes the patch
>
>   3/ Rebuild the pre-built Buildroot external toolchains that used 4.5.4
>      headers
>
> Then, the connman build failures should go away, right?

Hi.
Yes, exactly.
The only caveat would be people with toolchain headers 4.5.0 - 4.5.4 or 
any eventual external toolchain that ships that way (which by definition 
would be "broken").
Regards.
