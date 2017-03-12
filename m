From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 18:54:43 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <20170312182913.0c6dc2cd@free-electrons.com>
References: <1489331191-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312151543.GC3739@free.fr>
 <20170312182913.0c6dc2cd@free-electrons.com>
Message-ID: <20170312175443.GD3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-12 18:29 +0100, Thomas Petazzoni spake thusly:
> On Sun, 12 Mar 2017 16:15:43 +0100, Yann E. MORIN wrote:
> 
> > That is not possible in all situations.
> > 
> > For example, I have a board here with a kind of co-processor of a
> > different architecture; the firmware for that co-processor is loaded
> > at runtime. It is an ELF file, and it is in target/.
> > 
> > So I don't think it is possible to check that all ELF files are for the
> > Buildroot-known target.
> > 
> > We already discussed this a while ago and came to the same conclusiong
> > back then.
> 
> I don't think I want to give up that easily on this, especially
> considering how many times we get submission for packages that are not
> actually cross-compiled.

I agree.

> Could you be more specific about these firmware files? Where are they
> located?

In theory, those kind of files may be located anywhere, but in this
specific case, it is in /lib/firmware.

The firmware files could be moved elsewhere, of course, but:

 1) /lib/firmware is the "standard" location for firmware files;

 2) a binary-only tool can be used to load the firmware and could
    expect it to be located there.

> Perhaps with a test restricted to {usr,}/{bin,sbin,lib}, we can avoid
> testing those firmware files.

I think this would be sensible, as long as /lib/firmware is excluded, as
well as /usr/lib/firmware (in case of merged /usr).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
