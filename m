From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 13 May 2008 10:45:48 +1000
Subject: [Buildroot] httpd question
In-Reply-To: <1CF6EDDF0820924DA43C9A52FE7325950B5F07A2@MI8NYCMAIL17.Mi8.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<482555F2.3080501@Kriegisch.name>
	<1CF6EDDF0820924DA43C9A52FE7325950B5F07A2@MI8NYCMAIL17.Mi8.com>
Message-ID: <20080513004548.GB7473@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 12, 2008 at 12:50:24PM -0400, hartleys wrote:
> On Saturday, May 10, 2008 1:00 AM, Alexander Kriegisch wrote:
> > Sounds like you have another process, probably another web server,
> > listening on that port. Find out which process that is by issuing
> > these commands:
> >  # Is port 80 listened at?
> >  netstat -ln |grep ":80"
> >  # If so, by whom? (Hopefully your have 'lsof' installed)
> >  lsof -i :80
> 
> Ok. Got lsof to download and compile. I had to change the ftp site.
> 
> / # netstat -ln |grep ":80"
> tcp        0      0 0.0.0.0:80              0.0.0.0:*
> LISTEN
> / # lsof -i :80
> COMMAND PID USER   FD   TYPE DEVICE SIZE NODE NAME
> inetd   372 root   15u  inet     82       TCP *:www (LISTEN)
> / #
> 
> I'm not really sure what this output means. Can you offer any ideas?

It means you have an http service configured in /etc/inetd.conf. Post
your inetd.conf to this list if you need assistance.

cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
