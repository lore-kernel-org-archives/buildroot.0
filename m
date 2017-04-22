From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:34:31 +0200
Subject: [Buildroot] [PATCH v8 07/12] e2fsprogs: refactor to fix
 conflicts with busybox and util-linux
In-Reply-To: <20170422150317.576c0b54@free-electrons.com>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-8-arnout@mind.be>
 <20170422150317.576c0b54@free-electrons.com>
Message-ID: <d3b58050-8679-7eab-3b1a-ed5477f9f595@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 15:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Apr 2017 13:59:50 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +# If both e2fsprogs and busybox are selected, make certain e2fsprogs
>> +# wins the fight over who gets to have their utils actually installed
>> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>> +E2FSPROGS_DEPENDENCIES += busybox
>> +endif
> 
> We recently had a ncurses/busybox discussion, in which to solve a
> circular dependency problem we removed such a dependency on Busybox. As
> part of this discussion, we started thinking about whether we should
> stop using the solution of depending on busybox to allow a package to
> override Busybox applets, and instead make sure the corresponding
> applets in Busybox are disabled when another package will install the
> full featured version of the program.
> 
> Should we generalize this idea, and apply it to e2fsprogs as well?

 Yes, but it should be a separate patch. This patch basically preserves the
existing behaviour of overriding the busybox versions. Note that the dependency
is redundant because we already depend on util-linux which depends on busybox
(for the same reason).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
