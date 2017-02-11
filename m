From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 23:28:01 +0100
Subject: [Buildroot] [PATCH 1/6] support/scripts: add script to test a
 package
In-Reply-To: <CAAXf6LVR03z=HfgkN8QNpawG4G0WYvFmjswiexSCX2icw1dzvQ@mail.gmail.com>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
 <70e8.589b94e3.db816@xdna.net> <20170211160824.GA20146@free.fr>
 <CAAXf6LVR03z=HfgkN8QNpawG4G0WYvFmjswiexSCX2icw1dzvQ@mail.gmail.com>
Message-ID: <20170211222801.GG20146@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-11 22:19 +0100, Thomas De Schampheleire spake thusly:
> On Sat, Feb 11, 2017 at 5:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> Here is a feature request, but only if it does not add much
> complexity: I was expecting the script to accept this:
> 
> echo "BR2_PACKAGE_BUSYBOX=y" | support/scripts/test-pkg -p busybox -c -
> 
> i.e. let '-' indicate that the config snippet is to be taken from
> standard input, a principle supported by many unix tools already.
> The 'echo' could be more complex in someone else's use case, for
> example a concatenation of several pre-existing snippets.

Which means that we'd have to manage a temporary file internally. Well,
we can do without it, at the cost of some complexity in the script.

What would be the use-case that would prevent on to do:

    $ printf "Bla\nBle\n" >foo.cfg
    $ ./support/scripts/test-pkg -p busybox -c foo.cfg
    $ rm foo.cfg

instead?

But yes, that's doable. Lt's just post-pone that "enhancement" for
later...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
