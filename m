From: Thierry Bultel <tbultel@free.fr>
Date: Tue, 09 Dec 2014 15:48:03 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses: add support for 256 colors
In-Reply-To: <5486E958.9070404@zacarias.com.ar>
References: <1418122710-27852-1-git-send-email-tbultel@free.fr>
 <5486E958.9070404@zacarias.com.ar>
Message-ID: <54870BA3.2010205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/12/2014 13:21, Gustavo Zacarias a ?crit :
> On 12/09/2014 07:58 AM, Thierry Bultel wrote:
>
>> +config BR2_PACKAGE_NCURSES_EXT_COLORS
>> +	bool "ncurses extended colors"
>> +	select BR2_PACKAGE_NCURSES_WCHAR
>> +	depends on BR2_USE_WCHAR
>> +	help
>> +	  compile for 256-color support
>> +
>
> Hi.
> Do you know the size delta between this option enabled and disabled?
> I'm asking because it might not be even worth an option.
> Thanks.
> Regards.
>

Hi, the size delta is quite small:

256 colors:

-rwxr-xr-x 1 thierry thierry 210K d?c.   9 14:23 
output/target/usr/lib/libncursesw.so.6.0

std colors:

-rwxr-xr-x 1 thierry thierry 202K d?c.   9 15:46 
output/target/usr/lib/libncursesw.so.5.9


Thierry
