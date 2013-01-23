From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Wed, 23 Jan 2013 15:22:56 +0000
Subject: [Buildroot] firewall or ...?
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F40E42155@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have successfully included apache into buildroot. Everything builds correctly and lands on the target and httpd loads when the target boots. Awesome.

I can wget from localhost on the target and download index.html, so httpd seems to be working. However, the web server does not respond to requests from external network clients. I wondered if the problem was on my LAN, but I was able to ping and even ssh into the target from those network clients. So the network seems to be OK.

In my admittedly limited experience this seemed like a firewall problem. But... there is no /etc/sysconfig/iptables and here's what iptables reports:

[root at buildroot sysconfig]# iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root at buildroot sysconfig]#

It looks open to me. Can anyone suggest why the web server is only serving requests from localhost?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130123/ef0f10e0/attachment.html>
