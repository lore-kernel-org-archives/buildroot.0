From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 3 Aug 2010 15:53:36 +0200
Subject: [Buildroot] Generate root password at build
In-Reply-To: <001701cb32fd$011fff60$035ffe20$@pauljones.id.au>
References: <4C57DB6D.20800@fpga-art.de>
	<001701cb32fd$011fff60$035ffe20$@pauljones.id.au>
Message-ID: <20100803135336.GA19727@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 03, 2010 at 09:14:11PM +1000, Paul Jones wrote:
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:buildroot-
> > bounces at busybox.net] On Behalf Of Lars Lockenvitz
> > Sent: Tuesday, 3 August 2010 7:04 PM
> > To: buildroot at uclibc.org
> > Subject: [Buildroot] Generate root password at build
> > 
> > Hello,
> > 
> > I'm looking for an option in Buildroot (version 2010.05) to set an root
> > password, that will be generate at build.
> > Is there a possibility?
> > 
> > Or does someone know a way via script?
> 
> This would be a very good feature to have in menuconfig. If I knew how to do
> it I'd implement it myself!

It should be doable using the following syntax:

config BR2_RANDOM_PASSWORD
	string
	option env=RANDOM_PASSWD


Then you need to set RANDOM_PASSWD in the shell before you start menuconfig.
The config symbol "BR2_RANDOM_PASSWD" will then have the value
as read in the environment variable RANDOM_PASSWD.

So not elegant but possible.

	Sam
