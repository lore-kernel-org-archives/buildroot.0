From: hartleys <hartleys@visionengravers.com>
Date: Mon, 12 May 2008 12:50:24 -0400
Subject: [Buildroot] httpd question
In-Reply-To: <482555F2.3080501@Kriegisch.name>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<482555F2.3080501@Kriegisch.name>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B5F07A2@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, May 10, 2008 1:00 AM, Alexander Kriegisch wrote:
> Sounds like you have another process, probably another web server,
> listening on that port. Find out which process that is by issuing
> these commands:
>  # Is port 80 listened at?
>  netstat -ln |grep ":80"
>  # If so, by whom? (Hopefully your have 'lsof' installed)
>  lsof -i :80

Ok. Got lsof to download and compile. I had to change the ftp site.

/ # netstat -ln |grep ":80"
tcp        0      0 0.0.0.0:80              0.0.0.0:*
LISTEN
/ # lsof -i :80
COMMAND PID USER   FD   TYPE DEVICE SIZE NODE NAME
inetd   372 root   15u  inet     82       TCP *:www (LISTEN)
/ #

I'm not really sure what this output means. Can you offer any ideas?

Thanks,
Hartley
