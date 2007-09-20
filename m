From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 16:48:44 +0200
Subject: [Buildroot] [PATCH] make strace buildable
In-Reply-To: <20070920144527.GA6384@aon.at>
References: <200707162232.43774.yann.morin.1998@anciens.enib.fr>
	<20070920144527.GA6384@aon.at>
Message-ID: <20070920144844.GB6384@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 04:45:27PM +0200, Bernhard Fischer wrote:
>Yann,

>>  	{ 3,	0,	sys_ioperm,		"ioperm"	}, /* 101 */
>> -	{ 2,	TD,	sys_socketcall,		"socketcall", SYS_socketcall }, /* 102 */
>>-+	{ 2,	TD,	sys_socketcall,		"socketcall",
>>++	{ 2,	TD,	sys_socketcall,		"socketcall"
>> +#ifdef __NR_socketcall
>>-+	SYS_socketcall }, /* 102 */
>>++	    , SYS_socketcall
>> +#endif
>>++								}, /* 102 */
----------------------------------------------------------------^

It's right here on the far right. Everything is fine, sorry for the
noise..
>
>Hm. I just ment to push this change upstream but..
>Now if there is no socketcall, where does that closing curly bracket
>come from, again?
>I think it should be right here, but i can't see it?
