From: saravanan chanemouganandam <saravanan_sprt@hotmail.com>
Date: Tue, 18 Dec 2007 15:07:15 +0530
Subject: [Buildroot] modprobe: cannot parse modules.dep error
Message-ID: <BAY131-W32EA6D41FC5B236081ADF0E2630@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all, I am running into the following problem when invoking a netfilter iptables( v1.3.8) and xtables support in the buildroot's busybox (v1.7.2) system. The netfilter packet configuration and support modules are compiled and built into the linux-2.6.16 kernel image. When a 'C++' application code calls the iptables  through 
sprintf(buff, "%s -t mangle -A PREROUTING %s -j MARK --set-mark 512", Config.iptables, Config.link[i]);
system(buff);
it throws the following modprobe error. iptables -t mangle -A PREROUTING -d 88.160.215.156 -p icmp -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.depiptables -t mangle -A PREROUTING -s 88.160.215.156 -p icmp -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.depiptables -t mangle -A PREROUTING -d 88.160.215.156 -p tcp --dport http -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.dep Normally it shouldn't do module probing as all the netfilter support symbols are included in the kernel image. Can anybody tell me why the system throws the modprobe error though the netfilters supports are built into the kernel image.? ThanksSaraOsmozis
_________________________________________________________________
Post free property ads on Yello Classifieds now! www.yello.in
http://ss1.richmedia.in/recurl.asp?pid=221
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071218/b47b365b/attachment.htm 
