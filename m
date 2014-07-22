From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jul 2014 07:31:41 -0300
Subject: [Buildroot] issues without busybox
In-Reply-To: <3BB80F5F-275A-4495-8E75-40827CA53A50@whospot.com>
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
 <20140721221555.72df12ca@free-electrons.com>
 <53CD77E8.7050208@zacarias.com.ar>
 <3BB80F5F-275A-4495-8E75-40827CA53A50@whospot.com>
Message-ID: <53CE3D8D.3080704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/2014 06:35 PM, Gilles wrote:
> I don't know, there are already SO MANY alternatives to SystemV init with
> event driven init like boot scripts, initNG, launchd (my favorite), SMF, runit, syscan, upstart, einit...
> It's almost a full time job to stay on top of it all as it is.

Hi.
I'm not proposing making an init system itself, just bridging the
available options in buildroot in a consistent way.
These things could be done in separate steps:

1) Make initscript consistent.
I've been tweaking some a bit so as to use the return value and say if
it indeed started correctly instead of a blind echo.

2) Make them configurable.
Use a simple method such as sourcing /etc/default/$NAME for the default
variable assignments and /etc/config/$NAME to override for example.
Buildroot can ship /etc/default/$NAME which can be in a RO partition and
the user can (or not) have a RW partition mounted in /etc/config where
he can customize the initscript behaviour.
Easy to handle without any unification filesystem and easy to do a
factory reset.

3) Work around missing utilities like start-stop-daemon and such by
wrapping up such things in helper scripts that will call the appropiate
utility.

Something like that :)

Regards.
