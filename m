From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 2 Oct 2017 17:28:47 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
 "netcat" functionality
In-Reply-To: <87k20dcp1j.fsf@dell.be.48ers.dk>
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
 <20171002211840.104aa3df@windsurf.home> <87k20dcp1j.fsf@dell.be.48ers.dk>
Message-ID: <1919404262.11955562.1506976127450.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>,
> buildroot at buildroot.org
> Sent: Monday, October 2, 2017 4:44:56 PM
> Subject: Re: [PATCH v3] nc: new virtual package providing "netcat" functionality

>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
> > What is the benefit of having a virtual package for this ?
> 
> > Virtual packages are mainly useful when several variants of a given
> > library provide the same API, but different implementations, and we
> > have N consumers of this API. In such a case, a virtual package avoids
> > having each consumer explicitly handle every possible provider of the
> > API.
> 
> > However, in the case of netcat, I don't see the point. Yes, you can
> > currently enable several packages that provide the netcat
> > functionality, and they will step on each other in some combinations.
> 
> > But you can also enable several Web servers that will try to listen on
> > port 80 at boot time, leaving only one functional, and still we're not
> > going to have a "webserver" virtual package.
> 
> > So, I don't see where the problem is, and therefore I don't think a
> > solution is necessary :-)
> 
> FYI, this is my feeling as well. The current setup afaik only has issues
> if you enable more than one package providing a nc implementation (this
> solution fixes it by not allowing such setup), but I'm not sure if
> there's really a realistic use case where somebody would want to do this
> in the first place?

I'm currenly working on porting libvirt to buildroor. It requires a
modern "nc" command (with support for unix sockets) to provide remote
access via ssh using virt-manager. Currently this is impossible with
uClibc because openbsd-netcat depends on GLIBC.

At the same time I think it's waste of space to install the full
nmap suite just to have one command.

By the way, nmap's ncat is the "nc" command used on Fedora Linux while
Debian uses openbsd-netcat by default.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
