From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 07:14:51 -0300
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <20120312075840.648c0cba@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120312075840.648c0cba@skate>
Message-ID: <3fb8fff01011dbe187d729419e8c6156@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-12 03:58, Thomas Petazzoni wrote:

> Hello,
>
> Le Sun, 11 Mar 2012 22:58:49 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
>> -HOST_INTLTOOL_CONF_OPT = \
>> -  PERLLIB=$(HOST_DIR)/usr/lib/perl
>
> Has this been tested on a system where libxml-parser-perl is not
> installed?
>
> Thomas

That's easy to reproduce and yes, did so by doing "mv /usr/lib/perl5 
/usr/lib/perl5.oops"
As long as your distro uses /usr/lib/perl5 and not /usr/lib/perl or 
some other directory of course, but the same thing applies anyway.
Regards.
