From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jul 2014 09:21:26 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-20
In-Reply-To: <20140721121553.10be890c@free-electrons.com>
References: <20140721063011.48A3410123E@stock.ovh.net>
 <20140721121553.10be890c@free-electrons.com>
Message-ID: <53CD05C6.3050909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/2014 07:15 AM, Thomas Petazzoni wrote:

> Hello all,

Hi.

>>       bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8c891d0b8ad6413a44ecd33e952063308ff08a42/
> 
> warning: cannot find entry symbol __start; defaulting to 00000000
> 
> I guess it's a problem related to shared libraries, on a platform that
> doesn't support them. Gustavo?

Actually it's not, it builds just fine for say mips static.
I think elf2flt is at fault here, maybe exclude it for flat?

>>        arm |                openswan-2.6.41 | NOK | http://autobuild.buildroot.net/results/e5970eae28d01503d89a5d4e593711d7a27da8b5/
> 
> /scratch/peko/build/openswan-2.6.41/lib/libipsecconf/keywords.c:501:40: error: unknown type name ???YYSTYPE???
>  int parser_find_keyword(const char *s, YYSTYPE *lval)
> 
> Gustavo, maybe?

Patch sent, looks like it likes to regen parser.l from parser.y when
flex is around and on that machine it's too old. I was unable to
reproduce and the failure is uncommon because of it.

Regards.
