From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 22 Dec 2015 09:18:59 +1100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151221092513.GA3454@free.fr>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr> <20151217124506.616549d9@camb691>
 <20151217180735.GA3653@free.fr> <20151221164401.4007ce33@camb691>
 <20151221092513.GA3454@free.fr>
Message-ID: <20151222091859.1b3de5c0@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2015 10:25:13 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Cyril, All,
> 
> On 2015-12-21 16:44 +1100, Cyril Bur spake thusly:
> > On Thu, 17 Dec 2015 19:07:35 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Totally agreed will address everything you mention. I should have mentioned a
> > few in more detail, my bad for not going over it in more detail before posting,
> > you're correct that a few things in there are actually non obvious.  
> 
> No problem! Things just happen to be obvious when you actually do the
> job, because everything is fresh in your memory. Patch reviews are there
> to eventually highlight that fact. So, really, that's not a problem.
> 
> [--SNIP--]
> > > > > > +SELFTESTS_INSTALL_STAGING = YES      
> > > > > Why install it in staging?    
> > > > I actually hadn't initially but I did get to a point in my work where I had
> > > > to objdump a test binary. So, since I needed it, it stayed.    
> > > But can't you objdump the binaries that are installed in target/ instead?  
> > 
> > I think I tried that initially but IIRC they get stripped when put into target/
> > which proved annoying when objdumping.  
> 
> But then, the 'original' binaries are still present in the build
> directory, where they are definitely not stripped (at least, not by
> Builroot). Isn't that enough?
> 

Doh, you're right of course they'll be in the linux build dir, I'll change that
too - I'll be sure to comment that one, even I totally forgot that haha.

Thanks

> Staging is really for libraries and headers that are to be used by
> another package. Kernel selftests are not headers, they are not
> libraries, so nothing will include/link them. So, I still believe
> there's no reason to put them in staging.
> 
> Regards,
> Yann E. MORIN.
> 
