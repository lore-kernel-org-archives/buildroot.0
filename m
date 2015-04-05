From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 12:06:44 +0200
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <20150405112958.781b5523@free-electrons.com>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20150404195923.154d3366@free-electrons.com>
 <20150405090500.GA4134@free.fr>
 <20150405112958.781b5523@free-electrons.com>
Message-ID: <20150405100644.GD4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-05 11:29 +0200, Thomas Petazzoni spake thusly:
> On Sun, 5 Apr 2015 11:05:00 +0200, Yann E. MORIN wrote:
> > > Should we introduce a final check in target-finalize to warn about
> > > binaries having invalid rpaths, and start fixing them one by one ? Or a
> > > more brutal approach where we remove all rpaths in target-finalize ?
> > 
> > I have a series doing exactly that; I'll be sending it shortly.
> 
> There was some concern in this thread that the approach to remove the
> rpath at the end of the build was indeed making the built-in rpath
> ineffective, but still present if you did a "strings" on the binary. Is
> this something you have a solution for?

Hmm... What I do is use patch-e;f to remove it altogether, yes.

Now, if there is another reference to it in another section (e.g. .data
or .rodata) I don't know. I can do a biggish test-build with lotta
packages and do a string on there, but I'm afraid we will find it in
those data sections, if only because some tools store the build dir and
some other things in there.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
