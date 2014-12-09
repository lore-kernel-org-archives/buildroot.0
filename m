From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Tue, 09 Dec 2014 22:58:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: let init script
 cleanup stale pidfile
In-Reply-To: <54876E2C.6060208@zacarias.com.ar>
References: <1416068836-4053-1-git-send-email-jkrause@posteo.de>
 <548755B0.6020002@zacarias.com.ar> <1418160957.1422.38.camel@posteo.de>
 <54876E2C.6060208@zacarias.com.ar>
Message-ID: <1418162316.880.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2014-12-09 at 18:48 -0300, Gustavo Zacarias wrote:
> On 12/09/2014 06:35 PM, J?rg Krause wrote:
> 
> > I want to check in a script if the dnsmasq daemon is running by testing
> > for the existence of the pid file.
> 
> Generally speaking it's bad practice to just check the pidfile to know
> if some daemon is running, because if it dies unexpectedly you'll still
> have the pidfile around.
> You should probably use a double check of pidfile and match the process,
> something like (in shell):
> 
> grep dnsmasq /proc/`cat /var/run/dnsmasq.pid`/cmdline >/dev/null 2>&1 &&
> echo "YES" || echo "NO"

I thought so. I've seen it in some other scripts... Many thanks for the
advice!
