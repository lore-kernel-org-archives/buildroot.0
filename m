From: Paul Jones <paul@pauljones.id.au>
Date: Fri, 11 Jun 2010 09:11:16 +1000
Subject: [Buildroot] Installing host packages
Message-ID: <001c01cb08f2$3c041740$b40c45c0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot- 
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Thursday, 10 June 2010 10:04 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Installing host packages
> 
> On Thu, 10 Jun 2010 21:51:17 +1000
> "Paul Jones" <paul@pauljones.id.au> wrote:
> 
> > Ok, here's a weird question: How would one go about installing a
host
> > package into the target dir?
> 
> Why would you do this ? Installing _host_ packages in the _target_
directory
> sounds a bit crazy, no ?

I'm creating a package for the Mono C# compiler. As part of it's build
process it assembles a large number of .NET libraries, but these can only be
built by the host yet they also need to be placed onto the target. The
simplest way to do that is to install the whole lot onto both the host and
target, and then later overwrite the binaries on the target with the correct
ones from the target package.
 

Paul.
