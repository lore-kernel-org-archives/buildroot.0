From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Nov 2016 12:22:49 +0100
Subject: [Buildroot] How to log /dev/console directly on the device
In-Reply-To: <CAGm1_ksb_gKjVwQ6S1AsnuREk439QTP9nbjRzhc7BMv7YY+y2Q@mail.gmail.com>
References: <CAGm1_ksb_gKjVwQ6S1AsnuREk439QTP9nbjRzhc7BMv7YY+y2Q@mail.gmail.com>
Message-ID: <2251bf95-8406-dd6e-6728-ad43f49a6d0b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-11-16 08:36, Yegor Yefremov wrote:
> I need to log the output from /dev/console to a file. The purpose is
> to find an application crash in a field. It is important to have all
> possible messages i.e. kernel messages and application messages.

 This is exactly what syslogd (or journald) is supposed to do. Both the kernel
and the applications send their messages to syslogd, and syslogd sends it to the
console and/or to a file.

 If you have your applications directly writing to /dev/console, there is really
nothing you can do short of hacking the kernel to do something with it. You
could take a look at netconsole, but IIRC that just sends printks to the
network, it doesn't actually redirect /dev/console.

 Regards,
 Arnout

> 
> In field there is no physical access to a console, but if connected
> the conole still should work as usual.
> 
> What options do I have?
> 
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
