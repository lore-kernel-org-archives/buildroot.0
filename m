From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 23:20:18 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: CodeSourcery AArch64 2014.11
 does not contain libatomic
In-Reply-To: <20210109225814.2fa774ab@windsurf.home>
References: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
 <20210109225814.2fa774ab@windsurf.home>
Message-ID: <20210109222018.GE3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2021-01-09 22:58 +0100, Thomas Petazzoni spake thusly:
> On Sat,  9 Jan 2021 13:33:37 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> > output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-amd-linux-gnu/4.9.1/../../../../aarch64-amd-linux-gnu/bin/ld:
> >  cannot find -latomic
[--SNIP--]
> So I see two options here:
> 
>  (1) What you propose, which will just fix the problem for this
>      particular toolchain, but not any other toolchain potentially built
>      without libatomic.
> 
>  (2) Really detect the availability of libatomic, just like we do for
>      other toolchain features.
> 
> I would have normally preferred (2), but here I believe the vast
> majority of modern toolchains will have libatomic included, so it
> bothers me a bit to introduce more complexity for a situation that is
> uncommon today, and is going to become more and more uncommon.
> 
> What do others think ?

When I saw Bernd's patch, I was not very happy with that hack. So I
started (more or less) working on implementing option 2. But it is quite
a bit of work...

And then, we have only this one toolchain, pretty old now, which we may
as well get rid of, soon enough at least. So this little one-off
workaround is just good-enough...

So, after seeing the reply from Thomas, and after a bit of back-n-forth
in my head and with Thomas on IRC, I decided that this was just not worth
the effort to go for option 2.

I am still not very happy with option 1, which I find not very
satisfying... But oh well, this is really "Just-Good-Enough ?".

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
