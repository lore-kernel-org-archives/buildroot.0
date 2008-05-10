From: Alexander Kriegisch <Alexander@Kriegisch.name>
Date: Sat, 10 May 2008 09:59:46 +0200
Subject: [Buildroot] httpd question
In-Reply-To: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
Message-ID: <482555F2.3080501@Kriegisch.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds like you have another process, probably another web server,
listening on that port. Find out which process that is by issuing these
commands:
  # Is port 80 listened at?
  netstat -ln |grep ":80"
  # If so, by whom? (Hopefully your have 'lsof' installed)
  lsof -i :80

Regards
-- 
Alexander Kriegisch
Certified ScrumMaster
http://scrum-master.de


hartleys:
> I enabled the webif package and httpd in buildroot. Everything builds
> ok and my system boots. But when I try to access the web interface I
> get the following message in my browser:
> 
> httpd: bind: Address already in use
> 
> If I start the httpd service on a different port (8080) it works 
> fine.
