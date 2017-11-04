From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Nov 2017 23:05:58 +0100
Subject: [Buildroot] Parallel top-level make and multiple rootfs types
In-Reply-To: <32f8ab99-e828-f276-fc5a-61f9955db8cc@mind.be>
References: <71023202-b51d-49cb-bcf0-a49cffb7414a@cesnet.cz>
 <daa6be72-cbd0-4f65-8e48-83d1c43ddd8c@cesnet.cz>
 <32f8ab99-e828-f276-fc5a-61f9955db8cc@mind.be>
Message-ID: <20171104230558.4e785082@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Nov 2017 21:56:58 +0100, Arnout Vandecappelle wrote:

> > can I disable parallel execution of the rootfs-* build steps while still
> > building everything up to target-finalize in parallel?  
> 
>  No, that's not possible with make. I don't know if Thomas has already thought
> about this aspect of top-level parallel...

No, I haven't thought about this aspect of top-level parallel build.

>  I think the solution is to change the way we build the rootfs: instead of doing
> the fakeroot steps over and over again, do it once, save with the -s option, and
> then do the individual filesystems in a separate (readonly) fakeroot with -i to
> read the previously created fakeroot file.

I think Yann did some work in terms of parallel generation of
filesystem images, but I'm not sure exactly what he did :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
