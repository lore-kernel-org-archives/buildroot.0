From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 08:55:32 +0100
Subject: [Buildroot] [V2 1/1] package/strongswan: Install libraries to
 /usr/lib
In-Reply-To: <CAH=K+6khy3cY1KUdJc6X=jYLoDus-1u2Tjk6CyGTenSb_zQGhQ@mail.gmail.com>
References: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171021095108.0ea87545@windsurf>
 <CAH=K+6khy3cY1KUdJc6X=jYLoDus-1u2Tjk6CyGTenSb_zQGhQ@mail.gmail.com>
Message-ID: <20171129085532.47506c55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 16:55:48 -0600, Sam Voss wrote:

> On Sat, Oct 21, 2017 at 2:51 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > However, I did a test build, and I do see /usr/lib/ipsec kept in the
> > RPATH:
> >
> >  0x0000001d (RUNPATH)                    Library runpath: [/usr/lib/ipsec]  
> 
> My tests seem to be showing the same. I'm going to have to see if it
> is something we injected ourselves causing the issue.
> 
> > So, even though installing the libraries in /usr/lib is indeed better
> > for consistency, I'd like to understand why you had an issue running
> > the Strongswan program.  
> 
> I can fix the commit message if you'd still like the patch, else I'll
> leave it as is until I get some more explanation on why we had this
> issue in the first place.

I think the change does make sense (we try to have all libraries
in /usr/lib, except dlopen'ed ones). So if you could resend the patch,
but with a modified commit message, it would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
