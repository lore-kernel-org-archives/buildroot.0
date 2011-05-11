From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 11 May 2011 22:22:07 +0400
Subject: [Buildroot] stunnel package
In-Reply-To: <201105102319.58784.yann.morin.1998@anciens.enib.fr>
References: <BANLkTineh8ZO9o1tqX36W=2QJz=1tYMhAw@mail.gmail.com>
	<201105102319.58784.yann.morin.1998@anciens.enib.fr>
Message-ID: <BANLkTikTWgv+bhv-_CGCnD440Qwdmdz-cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks. I did not check what exactly help me, but with configure options
--disable-libwrap --disable-fips (decided to explicitly disable some
features) --with-threads=fork (I think it is the crucial option here)
stunnel works fine.

2011/5/11 Yann E. MORIN <yann.morin.1998@anciens.enib.fr>:
> Sergey, All,
>
> On Tuesday 10 May 2011 23:11:32 Sergey Naumov wrote:
>> In former versions of buildroot there was stunnel package (version
>> 1.16 as I remember). Are there any issues with it? I am trying to
>> import stunnel 1.22 and 1.29 (from Debian) but without any success.
>> First problem is connect() call for client tunnel: it returns error
>> but errno=0. Does uclibc support errno for socket calls?
>> If I check additionally for errno != 0 to prevent falling into error
>> handling branch, then I have second problem: SSL_connect() failure in
>> init_ssl() with "SSL_connect: Peer suddenly disconnected" error.
>> Tcpdump shows a pair or three packets from client to server and vice
>> versa.
>> On the Debian 5.0.0. the similar configuration works fine.
>> My embedded system is busybox-1.17.1, linux-2.6.35.3, uclibc-0.9.31
>> (as far as I remember it is buildroot-08.2010).
>>
>> Have anybody encountered the similar problems?
>
> Maybe related to:
> ?https://bugs.uclibc.org/2089
>
> This issue was very recently re-raised onthe uClibc devel list. See
> the following thread:
> ?http://lists.uclibc.org/pipermail/uclibc/2011-May/045309.html
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> | ?Yann E. MORIN ?| Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software ?Designer | \ / CAMPAIGN ? ? | ?___ ? ? ? ? ? ? ? |
> | +33 223 225 172 `------------.-------: ?X ?AGAINST ? ? ?| ?\e/ ?There is no ?|
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL ? ?| ? v ? conspiracy. ?|
> '------------------------------^-------^------------------^--------------------'
>
