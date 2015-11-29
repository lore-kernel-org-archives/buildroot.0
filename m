From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 21:45:32 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove
 HOSTCC_VERSION
In-Reply-To: <20151129185224.695095a2@free-electrons.com>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <87fuzx676p.fsf@dell.be.48ers.dk> <56536E0C.1010205@mind.be>
 <20151129185224.695095a2@free-electrons.com>
Message-ID: <565B63EC.70907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-11-15 18:52, Thomas Petazzoni wrote:
> Arnout,
> 
> On Mon, 23 Nov 2015 20:50:36 +0100, Arnout Vandecappelle wrote:
> 
>>> Ehh, no. I guess a 4.x version would make more sense. Any idea what 'x'
>>> should be? 3? 5? 7?
>>
>> We'd need to check all the host packages (plus the packages that build a host
>> tool as part of the target build, like uboot) to be sure of that. The
>> autobuilders tell us that 4.7 at least is OK.
> 
> My autobuilder instance uses gcc 4.4:
> 
> test at build:~$ gcc -v
> [...]
> gcc version 4.4.5 (Debian 4.4.5-8)
> 
> (Yes, I'm running old stuff. On purpose.)


 So, should we set it to 4.4?

 Ideally we should have a test instance on RHEL5 as well, there are definitely
still company deployments based on that. RHEL5 has gcc 4.1.

 RHEL4 has gcc 3.4 but I don't think that that is very useful.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
