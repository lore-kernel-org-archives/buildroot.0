From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Feb 2018 17:44:44 +0100
Subject: [Buildroot] Start daemon from eudev with Busybox init system
In-Reply-To: <AM3PR02MB312173A6AF15DE4EB01D15AEFCE0@AM3PR02MB312.eurprd02.prod.outlook.com>
References: <AM3PR02MB312173A6AF15DE4EB01D15AEFCE0@AM3PR02MB312.eurprd02.prod.outlook.com>
Message-ID: <e4ecd1ae-090e-90b8-3546-ef1cc29353ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-02-18 16:47, Remco Poelstra wrote:
> Hi all,
> 
> ?
> 
> I need to start a daemon when the ?hci0? device becomes available, but (e)udev
> can?t be used to run long-lasting processes.
> 
> All solutions on the internet seem to use systemd to solve this problem, but I?m
> using the busybox init system.
> 
> Does busybox/buildroot have some kind of provision for this?

 Of course :-) You can just start it the same way as you would start any daemon
in /etc/init.d. You can use start-stop-daemon -b to start a process in the
background. Probably the easiest is to make a proper init script with a 'start'
and 'stop' and 'restart' command, so you can also call it manually. You can put
that script in /etc/init.d, just make sure its name doesn't start with S, then
it will not be called automatically at boot time.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
