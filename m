From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Sep 2019 19:36:15 +0200
Subject: [Buildroot] [PATCH 2/2] eventlog: remove package
In-Reply-To: <20190910193803.461857fa@windsurf>
References: <20190909095432.3935-1-judge.packham@gmail.com>
 <20190909095432.3935-2-judge.packham@gmail.com>
 <20190910193803.461857fa@windsurf>
Message-ID: <550c2986-ada0-0bff-0e45-720b2517ca7a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/09/2019 19:38, Thomas Petazzoni wrote:
> On Mon,  9 Sep 2019 21:54:32 +1200
> Chris Packham <judge.packham@gmail.com> wrote:
> 
>> Since syslog-ng 3.11.1 eventlog has been bundled with the sources.
>> Remove the separate package.
>>
>> Signed-off-by: Chris Packham <judge.packham@gmail.com>
>> ---
>>  DEVELOPERS                     |  1 -
>>  package/Config.in              |  1 -
>>  package/eventlog/Config.in     |  8 --------
>>  package/eventlog/eventlog.hash |  2 --
>>  package/eventlog/eventlog.mk   | 15 ---------------
>>  package/syslog-ng/syslog-ng.mk |  2 +-
>>  6 files changed, 1 insertion(+), 28 deletions(-)
>>  delete mode 100644 package/eventlog/Config.in
>>  delete mode 100644 package/eventlog/eventlog.hash
>>  delete mode 100644 package/eventlog/eventlog.mk
> 
> The question is whether we need Config.in.legacy handling for the
> removal of this package/option. Since it seems like the only user of
> eventlog was syslog-ng, then supposedly anyone having eventlog enabled
> also has syslog-ng enabled.

 Well, theoretically it is possible that someone is using eventlog independently
in their own software...

 Given how difficult it was to find that package, however, I doubt that this is
the case, so I'm OK with dropping legacy handling. It will make life easier for
the (undoubtedly much more numerous) users who have syslog-ng enabled.

 Regards,
 Arnout


> If that's the case, then we probably can do
> without any Config.in.legacy handling, because silently dropping the
> BR2_PACKAGE_EVENTLOG=y when Buildroot gets updated is the right thing.
> 
> Chris, Arnout, any opinion on this ?
> 
> Thomas
> 
