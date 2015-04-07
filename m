From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Apr 2015 13:36:39 +0900
Subject: [Buildroot] [PATCH] Makefile: remove redundant ifdef V
In-Reply-To: <20150407041911.GB2241@tarshish>
References: <1428379696-16079-1-git-send-email-yamada.masahiro@socionext.com>
 <20150407041911.GB2241@tarshish>
Message-ID: <CAK7LNASJwcTHc-sSR7u+qwF6b1mzNrH9biyv6YqG+3p6JPj0cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.


2015-04-07 13:19 GMT+09:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Masahiro Yamada,
>
> On Tue, Apr 07, 2015 at 01:08:16PM +0900, Masahiro Yamada wrote:
>> If "V" is not defined, "$(origin V)" returns "undefined".
>> "ifdev V" is redundant.
>
> V is not defined in code but ...

Right.

V=1 is supposed to be passed from the command line,
like Linux, U-Boot, barebox, busybox and other projects that use Kbuild.


>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  Makefile | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index d6426b3..9db52a8 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -184,10 +184,8 @@ endif
>>
>>  # To put more focus on warnings, be less verbose as default
>>  # Use 'make V=1' to see the full commands
>
> ... as this comment says, you can define V manually on the make invocation
> command line. That is its intended use.


Right. I do understand this.

I am afraid you are misunderstanding my patch.


I recommend you to read the git-log of
commit b8b0618cf6fab3bd5b1da8c72f4b29847d81ac42  of Linux Kernel.



-- 
Best Regards
Masahiro Yamada
