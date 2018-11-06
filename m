From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 05 Nov 2018 20:44:54 -0800
Subject: [Buildroot] Out of tree Linux kernel builds?
In-Reply-To: <87o9b27rhj.fsf@tkos.co.il>
References: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
 <87o9b27rhj.fsf@tkos.co.il>
Message-ID: <E9ECB5E7-2ECB-4B58-941F-20A0A28E8516@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On November 5, 2018 8:35:36 PM PST, Baruch Siach <baruch@tkos.co.il> wrote:
>Hi Florian,
>
>Florian Fainelli writes:
>> Hi Yann, all,
>>
>> AFAIR a while back you mentioned that you were looking into adding
>> support for out of tree Linux builds. Do you have working patches for
>> that, or you would rather have someone take a stab at doing it?
>
>What do you mean by "out of tree Linux builds"? Buildroot has supported
>custom kernel tree build since long ago. Did you mean external kernel
>modules?

I am talking about using Linux's ability to build objects into a different directory than where sources are. This is achieved by using make O=. The idea is that it would avoid using rsync to copy the kernel sources when using a custom build directory because this takes both unnecessary time and space to do the initial copy into build/linux-custom.
-- 
Florian
