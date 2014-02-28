From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 28 Feb 2014 01:40:12 +0100
Subject: [Buildroot] [PATCH 1/4] luajit: refactor without
	dont-strip.patch
In-Reply-To: <20140227235952.4bde8034@skate>
References: <1390465713-12600-1-git-send-email-francois.perrad@gadz.org>
 <20140227235952.4bde8034@skate>
Message-ID: <CAB0FRssOtOyWfoL35MT62f5TihDJ2FBDM8vydMLqUQN9LPQ-iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-27 23:59 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Thu, 23 Jan 2014 09:28:30 +0100, Francois Perrad wrote:
>> the variable TARGET_STRIP does the job
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/luajit/luajit-03-dont-strip.patch |   23 -----------------------
>>  package/luajit/luajit.mk                  |    2 +-
>>  2 files changed, 1 insertion(+), 24 deletions(-)
>>  delete mode 100644 package/luajit/luajit-03-dont-strip.patch
>
> Looks good to me. Just a question below.
>
>
>> +             TARGET_STRIP=@: \
>
> Any reason to use @: instead of just : ?
>

I've seen this value in the Makefile at
http://repo.or.cz/w/luajit-2.0.git/blob/HEAD:/src/Makefile#l354
so I copy/paste it.

Fran?ois

> Also, personally, I would probably prefer TARGET_STRIP=true. I know
> it's the same, but I find the usage of ':' a bit hard to read.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
