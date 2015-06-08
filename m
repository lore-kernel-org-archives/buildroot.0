From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:35:52 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <20150608233300.677fe6d8@free-electrons.com>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
 <55760493.1070807@mind.be> <20150608212519.GC3590@free.fr>
 <20150608233300.677fe6d8@free-electrons.com>
Message-ID: <20150608213552.GG3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-08 23:33 +0200, Thomas Petazzoni spake thusly:
> On Mon, 8 Jun 2015 23:25:19 +0200, Yann E. MORIN wrote:
> > > > +# Build the kernel module(s)
> > > > +define $(2)_KERNEL_MODULES_BUILD
> > > > +	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
> > > > +		@$$(call MESSAGE,"Building kernel module '$$(d)'")$$(sep) \
> > > 
> > >  I think that "Building kernel module '.'" looks a bit weird... But again, I
> > > can't think of an alternative.
> > 
> > Neither do I. I'll see if I can do something about that...
> 
> Just don't show a message for each subdir, only one for the overall
> build command:
> 
> 	$$(call MESAGE,"Building kernel module(s)")

Yep, I was going to do so. Thanks for confirming! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
