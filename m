From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 19 Sep 2013 09:28:11 -0500
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
References: <patchbomb.1379587632@argentina>	<246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
 <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
Message-ID: <OF255A0DB6.0256D3EC-ON86257BEB.004C84DB-86257BEB.004F7C41@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 09/19/2013 
08:30:25 AM:
> On Thu, Sep 19, 2013 at 1:43 PM, Samuel Martin <s.martin49@gmail.com> 
wrote:
> > Thomas, all,
> >
> [..]
> >
> > To generate the pdf manual, you need dblatex too.
> 
> dblatex was installed by default, it seems, on my Ubuntu-based system.
> How would you like to check this? We can add it to the proposed
> manual-check-dependencies rule, but this means that even if you're
> only interested in the text manual you need to install dblatex.
> Alternatively, we can add an explicit dependency like:
> manual-pdf: manual-check-pdf-dependency
> but this kind of conflicts with the generic gendoc principle currently 
used.

I was also going to to add to the documentation the versions of the Ubuntu
packages that I got the manual to build with. Ubuntu version + package 
version so that way in the manual we can give a reference system 
configuration that we say builds the manual. For Ubuntu 10.04 I was having
issues building the manual but with Ubuntu 12.04 I could successfully 
build
everything. 

I haven't had a chance to get around to doing this yet so I don't know if
you want to add your Ubuntu configuration as a reference configuration for
generating the manual under Section 3.2? Maybe this warrants a subsection 
(3.2.1) in manual for generating the manual? If you don't get around to
doing this, I will when I get around to adding some documentation to the
regarding SELinux and information about patch reviews.

> > Also, to update the lists of the manual, you need python with argparse
> > package.
> >
> 
> For python, should we check and bail out, or rather skip the package
> list generation? In fact, why is the package list generation coupled
> to the manual?
> If we do want to check for python, should we simply check for the
> python version 2.7+ or 3.2+ in which argparse was introduced, or are
> you thinking about a more elaborate check on argparse?
> 
> Thanks,
> Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/44b897bc/attachment.html>
