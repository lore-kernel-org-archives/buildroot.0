From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 11:18:23 -0300
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <20160519161455.2bacf98f@free-electrons.com>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
 <20160519160603.3debab78@free-electrons.com>
 <573DC881.2030409@zacarias.com.ar>
 <20160519161455.2bacf98f@free-electrons.com>
Message-ID: <573DCB2F.1020200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/05/16 11:14, Thomas Petazzoni wrote:

> Hello,
>
> On Thu, 19 May 2016 11:06:57 -0300, Gustavo Zacarias wrote:
>
>> Not right now since 4.6 is in -next, however it will if the stable
>> headers are bumped to 4.5.5.
>
> Well, your patch 1/2 does:
>
> -	default "4.4.10"	if BR2_KERNEL_HEADERS_4_4
> -	default "4.5.4"		if BR2_KERNEL_HEADERS_4_5
> +	default "4.4.11"	if BR2_KERNEL_HEADERS_4_4
> +	default "4.5.5"		if BR2_KERNEL_HEADERS_4_5
>
> So it should fix the thing, right?
>
> However, it means I'd have to rebuild once again the Buildroot external
> toolchains, at least the ones that use 4.5 kernel headers, right?
>
> Thomas

Hi.
Well, no, after bumping to 4.5.5 connman will go broken with the hacky 
patch because it's incompatible with the kernel fix upstream.
It's a shitty situation, and yes, you'll have to rebuild, sorry.
This is what happens when kids break the headers.
Regards.
