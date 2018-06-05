From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 18:50:39 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <CALURroS4t3V6GWnZSs6GEcAFrf1=KvfU036dskH6aEM4fQXn8w@mail.gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
 <20180605161546.GE2503@scaer>
 <CALURroS4t3V6GWnZSs6GEcAFrf1=KvfU036dskH6aEM4fQXn8w@mail.gmail.com>
Message-ID: <20180605165039.GA29058@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher, All,

On 2018-06-05 09:35 -0700, Christopher McCrory spake thusly:
> Sorry for top post, on mobile.
> What about using openssl?
> [1]https://www.openssl.org/docs/manmaster/man1/openssl-passwd.html

Since we do not require that openssl be installed on the build machine,
we'd have to build our own one. We do have a host-openssl package, but
it takes quite a bit of time to build: on my relativelty fast laptop,
it adds about 32s to the build time. This is a pretty big hit...

So, not an option IMHO...

Regards,
Yann E. MORIN.

> On Tue, Jun 5, 2018, 9:15 AM Yann E. MORIN < [2]yann.morin.1998@free.fr> wrote:
> 
>   Carlos, All,
> 
>   On 2018-06-05 08:22 -0300, Carlos Santos spake thusly:
>   > > From: "Arnout Vandecappelle" < [3]arnout@mind.be>
>   > > To: "Stefan Becker" < [4]chemobejk@gmail.com>, "buildroot" < [5]buildroot@buildroot.org>
>   > > Cc: "Yann Morin" < [6]yann.morin.1998@free.fr>, "Thomas Petazzoni" < [7]thomas.petazzoni@bootlin.com>
>   > > Sent: Monday, June 4, 2018 7:21:10 PM
>   > > Subject: Re: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace host-mkpasswd with host-busybox
>   >
>   > > On 01-06-18 15:30, Stefan Becker wrote:
>   > >> host-mkpasswd was a fork from whois to provide a host version of
>   > >> mkpasswd for the build. This has caused a maintenance headache.
>   > >>
>   > >> Replace it with host-busybox which can provide "mkpasswd" functionality
>   > >> from own source code. That causes less hassle for different build
>   > >> platforms.
>   > >
>   > > Just to be clear: does everybody agree that it is a good idea to use
>   > > weakly-random numbers as salt, rather than real random numbers like whois does?
>   >
>   > Wouldn't it be better to add a host version of the whois package that
>   > installs mkpasswd, only?
> 
>   That's what I initially suggested, but whois' mkpasswd uses some
>   optional glibc features, which have been disabled in some distros,
>   like Fedora28, which can then no longer build our mkpasswd. And our
>   own mkasswd is an extract from way back then, when we did not have
>   the whois package in busybox.
> 
>   So, switching to host-whois is not an imporovement over the current
>   situation.
> 
>   Regards,
>   Yann E. MORIN.
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 223 225 172 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [8]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
>   _______________________________________________
>   buildroot mailing list
>   [9]buildroot at busybox.net
>   [10]http://lists.busybox.net/mailman/listinfo/buildroot
> 
> Links:
> 1. https://www.openssl.org/docs/manmaster/man1/openssl-passwd.html
> 2. mailto:yann.morin.1998 at free.fr
> 3. mailto:arnout at mind.be
> 4. mailto:chemobejk at gmail.com
> 5. mailto:buildroot at buildroot.org
> 6. mailto:yann.morin.1998 at free.fr
> 7. mailto:thomas.petazzoni at bootlin.com
> 8. http://ymorin.is-a-geek.org/
> 9. mailto:buildroot at busybox.net
> 10. http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
