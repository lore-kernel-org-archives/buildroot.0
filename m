From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:41:45 +0100
Subject: [Buildroot] Parallel top-level make and multiple rootfs types
In-Reply-To: <20171104230558.4e785082@windsurf>
References: <71023202-b51d-49cb-bcf0-a49cffb7414a@cesnet.cz>
 <daa6be72-cbd0-4f65-8e48-83d1c43ddd8c@cesnet.cz>
 <32f8ab99-e828-f276-fc5a-61f9955db8cc@mind.be>
 <20171104230558.4e785082@windsurf>
Message-ID: <20171105084145.GE2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2017-11-04 23:05 +0100, Thomas Petazzoni spake thusly:
> On Sat, 4 Nov 2017 21:56:58 +0100, Arnout Vandecappelle wrote:
> > > can I disable parallel execution of the rootfs-* build steps while still
> > > building everything up to target-finalize in parallel?  
> > 
> >  No, that's not possible with make. I don't know if Thomas has already thought
> > about this aspect of top-level parallel...
> 
> No, I haven't thought about this aspect of top-level parallel build.
> 
> >  I think the solution is to change the way we build the rootfs: instead of doing
> > the fakeroot steps over and over again, do it once, save with the -s option, and
> > then do the individual filesystems in a separate (readonly) fakeroot with -i to
> > read the previously created fakeroot file.
> 
> I think Yann did some work in terms of parallel generation of
> filesystem images, but I'm not sure exactly what he did :)

Quite a lot, in fact... See:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/fs-3

I wanted to send it earlier, but I did not yet find time to completely
test it...

The runtime-tests infra needed a few tweaks to make it work correctly,
and it also caught a few regressions that I already fixed, but it really
needs a bit more testing I think...

Hopefully I get some time to respin it at the bginning iof next cycle...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
