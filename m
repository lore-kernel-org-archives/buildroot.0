From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 13:13:31 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <201311221358.29661.fatih.asici@gmail.com>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
 <201311221358.29661.fatih.asici@gmail.com>
Message-ID: <20131122131331.70220520@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 22 Nov 2013 13:58:29 +0200, Fatih A??c? wrote:
> On Friday 22 November 2013 10:14:11 Thomas Petazzoni wrote:
> > >        arm |           qt5declarative-5.1.1 | NOK |
> > >http://autobuild.buildroot.net/results/82bb89d5b29dc6bd40f840bc04845b6c87
> > >157985/
> > 
> > Weird thing. It's having problems when building things for the host...
> > but it uses target headers when building for the host. Someone needs to
> > look closely into this. Fatih ? :-)
> 
> All those headers belong to Qt. Qt does not install headers into host prefix. 
> This might be intentional. It doesn't sound like a problem to me.

It does to me. Headers correspond to libraries. And therefore, headers
installed in $(STAGING_DIR) match libraries installed in
$(STAGING_DIR), and so built for the target. Including headers from
$(STAGING_DIR) to build native tools seems wrong.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
