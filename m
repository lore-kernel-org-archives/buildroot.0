From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Aug 2015 15:22:27 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
	is set
In-Reply-To: <87r3mz6lba.fsf@dell.be.48ers.dk>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr> <87r3mz6lba.fsf@dell.be.48ers.dk>
Message-ID: <20150821132227.GA3753@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

[I forgot to send that one; it got stuck in my draft folder...]

On 2015-08-19 23:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Arguably, xtables-addons should be (if possible) converted over to using
>  > the kernel-modules infra, which should (will) take care of that (in the
>  > future). I'll try to see if I can convert it.
> Yeah, agreed.

I'll be working on it (not trivial from a first look).

>  > Yes, I'm thinking about it...
> 
>  > I think the plan I'll be goign with is to add a hidden Kconfig knob that
>  > packages that want to build a kernel module will have to select.
> 
> Why not just like the kernel-module infrastructure handle it like I
> proposed? I don't think it is very nice that people have to remember to
> add the select as well (and chances are they won't notice if they
> forget).

Because that would not work for packages in br2-external trees, as I
already explained.

And I do *not* want that we treat packages from br2-external differently
that the in-tree ones [*].

I know you are not using br2-external (and also do not really see the
point of it), but a lot of people find this to be a really important
feature. I also suspect some of our (corporate) users did choose
Buildroot (partly) because of br2-external.

[*] there already are a few use-cases that br2-external does not and
can't solve, because of the way Buildroot is designed, see below for an
example; let's not add arbitrary limitations that we can very easily
avoid.

>  >   - will we need to _check_ for any arbitrary kernel option to be set,
>  >     and offer packages a simple mean to do so?
> 
>  >   - will we need to _force_ (on or off) any other kernel option, and
>  >     offer packages a simple mean to do so?
> 
> Like Thomas says, we are already doing the 2nd option and I think it
> makes sense to keep on doing so - So I don't think there's a common need
> for the first.

Still, we are currently not allowing another package to set kernel
options _from_ that package's .mk file. All we have is the kernel
(de)activating options based on the presence of other packages, and that
excludes packages from br2-external. Unless Buildroot is modified
accordingly (but then br2-external looses its attractiveness for that
package).

Note: I never said we should provide a way for packages to enable or
disable arbitrary kernel options. I was just asking.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
