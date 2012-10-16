From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Oct 2012 21:41:04 +0200
Subject: [Buildroot] [PATCH] macchanger: new package
In-Reply-To: <CAHt8ZCNDNa8vL20Zc6he4UP5rffnqaCEx9qJ98TiyZN5vMmVpQ@mail.gmail.com>
References: <1350412488-17233-1-git-send-email-spdawson@gmail.com>
 <507DAD97.6090003@mind.be>
 <CAHt8ZCNDNa8vL20Zc6he4UP5rffnqaCEx9qJ98TiyZN5vMmVpQ@mail.gmail.com>
Message-ID: <201210162141.04997.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, All,

On Tuesday 16 October 2012 Simon Dawson wrote:
> On 16 October 2012 19:55, Arnout Vandecappelle <arnout@mind.be> wrote:
> >  Just for my info, what does this do that 'ip link set address
> > xx:xx:xx:xx:xx:xx'
> > doesn't?
> 
> In addition to setting a specific MAC address, the tool can also be
> used to set a random address. I don't think you can do that using ip.

Not with 'ip' only, but still possible:
  # MAC="$(dd if=/dev/urandom bs=6 count=1 2>/dev/null \
           |hexdump -e '5/1 "%0x:" "%0x"' )"
  # printf "%s\n" "${MAC}"
  b9:41:54:af:d9:f0
  # ip link set address "${MAC}"

UNIX-powa! And it's probably not the only possibility. ;-)

But yes, it's a bit more involved than simply calling a single executable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
