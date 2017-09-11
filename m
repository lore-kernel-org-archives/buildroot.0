From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 11 Sep 2017 09:58:21 +0200
Subject: [Buildroot] [PATCH] pppd: Do not overwrite /etc/resolv.conf
In-Reply-To: <140e8e93-df14-fea5-ada5-4e1aa4636f94@mind.be>
References: <20170828155604.24229-1-jer@airfi.aero>
 <140e8e93-df14-fea5-ada5-4e1aa4636f94@mind.be>
Message-ID: <CANCHnQq=yjt4HwC8=vpQ17nv8xJMaWtU1CxxF=r9xMM4eq1uNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 August 2017 at 22:28, Arnout Vandecappelle <arnout@mind.be> wrote:

>> pppd will overwrite any existing entries when /etc/resolv.conf is used instead, which is
>> bad.
>
>  I agree that this is bad.

Thanks.

>  However, this is a regression.

1. dnsmasq(8) mentions using /etc/dhcp/resolv.conf as well as
/etc/ppp/resolv.conf.
2. On the greater Internet you can easily find plenty of examples of
people getting confused because /etc/resolv.conf does not reflect what
usepeerdns has written to the wrong file in /etc/ppp/
3. usepeerdns is not enable by default.

> People who currently have ppp as their only
> interface, or who never have ppp and ethernet running at the same time

So it's a regression for what I can only assume must be a tiny
minority of system builders who don't configure their own systems and
are powerless but to rely on a second-guessed set of defaults that you
would like to support.

Additionally, the current pppd.mk suggests /etc/ppp/resolv.conf is not
writeable (in some configurations) but you say adding an ip-up script
would solve the issue, when that ip-up script is then supposed to
write to /etc/resolv.conf, which supposedly *is* writeable.

Please enlighten me.


Kind regards,
     jer
