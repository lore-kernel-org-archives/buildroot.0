From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Fri, 18 Apr 2008 08:05:50 +0100
Subject: [Buildroot] Anyone know how I can make my Buildroot filesystem
	R/W?
In-Reply-To: <4808344B.5050201@speakeasy.net>
References: <326f33790804171739s79ba1be1s929513770702d548@mail.gmail.com>
	<4808344B.5050201@speakeasy.net>
Message-ID: <200804180805.50163.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 April 2008, Sean Perry wrote:
> Arun Reddy wrote:
> > I am so happy that I have my new bootable filesystem created by
> > buildroot! But I noticed when I boot it up I can't write or change
> > anything. Does anyone know how I can make my new system R/W instead of
> > just R?
>
> you need something more than 'mount -o remount,rw /'?

BTW I've ported unionfs to buildroot; that allows to keep the root read-only, 
and make any number of changes on a root file system that appears as 
read-write. You can put the read-write delta on a small partition on a SD 
card or something... Easy to backup, easy to revert, easy to upgrade...

Michel
