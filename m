From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Oct 2017 23:32:46 +0100
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <d7e6d392-b7d1-7bdc-5048-d88fc6f0ab79@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer> <20171029101249.19a91e32@windsurf>
 <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
 <20171029181251.GI2899@scaer>
 <d7e6d392-b7d1-7bdc-5048-d88fc6f0ab79@gmail.com>
Message-ID: <20171030223246.GC3150@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2017-10-29 20:27 -0700, Florian Fainelli spake thusly:
> Le 10/29/17 ? 11:12, Yann E. MORIN a ?crit?:
> > On 2017-10-29 10:26 -0700, Florian Fainelli spake thusly:
> >> package/linux-headers/linux-headers.mk:134: *** LINUX_HEADERS_SITE
> >> cannot be empty when LINUX_HEADERS_SOURCE is not.  Stop.
> >> Makefile:79: recipe for target '_all' failed
> >> make: *** [_all] Error 2
> >> zsh: exit 2     make
> > 
> > Hmm... Even when you keep the kernel version to its default value?
> 
> That was also because I had set the "custom kernel version" to an empty
> string, which could have indicated "don't care" but was still needed.
> This is also probably fine to set to anything once you set your kernel
> headers to a particular version.
> 
> It seems like we should not prompted any kernel version in case since we
> use a local kernel directory, or, the version should be derived directly
> from the kernel  directory so it does not have to be manually specified
> at all but that's a tad more complicated.

But in truth, the override-srcdir mechanism is just that: an _override_
of the configured values, to be used only for development.

So, the premise is that you start off from a "known" configuration, and
override just that one or two packages you are working on.

> Thanks for your help, it's been pretty interesting to use another build
> system thus far :)

I was rather surprised (in a good sense!) to see you here, yes. Trying
the Dark Side of the Force, are we? ;-]

See ya!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
