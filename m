From: hartleys <hartleys@visionengravers.com>
Date: Mon, 12 May 2008 12:01:07 -0400
Subject: [Buildroot] httpd question
In-Reply-To: <482555F2.3080501@Kriegisch.name>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<482555F2.3080501@Kriegisch.name>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B5F047F@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looks like I do have another process on port 80. Not sure who or how at
this point.

/ # netstat -ln | grep ":80"
tcp  0  0  0.0.0.0:80  0.0.0.0:*  LISTEN

Strange thing is I have a couple ports connected to 0.0.0.0 and in the
LISTEN state. They are 37, 7, 9, 13, 80, 19, and 13.

Right now I don't have 'lsof' installed. I tried enabling it in my
buildroot configuration but can't get the source to download. I keep
getting an "Error in server greeting." message when buildroot tries to
wget the package.

Any other ideas. Either for my problem with port 80 or how to go about
getting the lsof package?

Thanks,
Hartley

Alexander Kriegisch:
> Sounds like you have another process, probably another web server,
> listening on that port. Find out which process that is by issuing
> these commands:
>  # Is port 80 listened at?
>  netstat -ln |grep ":80"
>  # If so, by whom? (Hopefully your have 'lsof' installed)
>  lsof -i :80

> hartleys:
> > I enabled the webif package and httpd in buildroot. Everything
builds
> > ok and my system boots. But when I try to access the web interface I
> > get the following message in my browser:
> > 
> > httpd: bind: Address already in use
> > 
> > If I start the httpd service on a different port (8080) it works 
> > fine.
