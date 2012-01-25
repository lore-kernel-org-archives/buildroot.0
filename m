From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jan 2012 23:14:30 +0100
Subject: [Buildroot] Kconfig
In-Reply-To: <1327527444.19793.30.camel@hp-dhlii>
References: <1327518856.21058.53.camel@hp-dhlii>
 <201201252221.21220.yann.morin.1998@free.fr>
 <1327527444.19793.30.camel@hp-dhlii>
Message-ID: <201201252314.30754.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On Wednesday 25 January 2012 22:37:24 David Lynch Jr. wrote:
> So how did you work things out for your project ?

You mean about the kconfig-frontends?

> By tearing an existing setup apart or is there actually docs somewhere ?

I copied the source code, and hammered it hard enough until it compiled.
So far, there is only one trivial patch that needs to be applied to the
gconf frontend.

> I think I am pretty competent with the Kconfig structures - though I do
> nto recall every having seen them documented, there are plent of
> examples for how to do things inside the linux kernel source. 
> All the sub makefiles are pretty trivial. 

So, I am a bit puzzled... Are you speaking about the, Kconfig configuration
language, or about the Kbuild build system?

> I think i am reasonably competent with Makefiles - though I think
> complex makefiles are a Write only language. 
> But i will confess that more than trivial changes to the Linux
> (buildroot, ...) Makefiles are pushing my limits.

Looks like you are speaking more about Kbuild than about Kconfig...

> I have done very little with autoconf, and was no aware that it had
> anything to do with the Kconfig build scheme. 

Now, it seems you are confusing Kbuild and Kconfig...

Kconfig : the configuration language, used to define the options, their
types (eg. bool, tristate, strings...), their dependencies (eg. foo
depends on bar), how they are presented to the user (prompt).

Kbuild : how source files should be compiled, their dependencies...

> But again, I think it is a wonderful means of managing something that
> needs myriads of possible build permutations, but I have never seen any
> real documentation. 

In your favourite Linux kernel source tree:
    Documentation/kbuild/

Granted, it's sometime a bit recondite, but all the info I ever needed,
I found there.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
