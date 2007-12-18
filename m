From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 18 Dec 2007 12:57:54 +0200
Subject: [Buildroot] modprobe: cannot parse modules.dep error
In-Reply-To: <BAY131-W32EA6D41FC5B236081ADF0E2630@phx.gbl>
References: <BAY131-W32EA6D41FC5B236081ADF0E2630@phx.gbl>
Message-ID: <4767A7B2.2000702@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

saravanan chanemouganandam wrote:
> Hi all, I am running into the following problem when invoking a netfilter iptables( v1.3.8) and xtables support in the buildroot's busybox (v1.7.2) system. The netfilter packet configuration and support modules are compiled and built into the linux-2.6.16 kernel image. When a 'C++' application code calls the iptables  through 
> sprintf(buff, "%s -t mangle -A PREROUTING %s -j MARK --set-mark 512", Config.iptables, Config.link[i]);
> system(buff);
> it throws the following modprobe error. iptables -t mangle -A PREROUTING -d 88.160.215.156 -p icmp -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.depiptables -t mangle -A PREROUTING -s 88.160.215.156 -p icmp -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.depiptables -t mangle -A PREROUTING -d 88.160.215.156 -p tcp --dport http -j MARK --set-mark 512modprobe: cannot parse modules.depmodprobe: cannot parse modules.dep Normally it shouldn't do module probing as all the netfilter support symbols are included in the kernel image. Can anybody tell me why the system throws the modprobe error though the netfilters supports are built into the kernel image.? ThanksSaraOsmozis

Try to do strace on iptables, may be calling modprobe is defined in iptables source.

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
