From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:49:36 +0200
Subject: [Buildroot] [PATCH] package/agentpp: fix build when
 BR2_PACKAGE_SNMPPP_SNMPV3 disabled
In-Reply-To: <20200714085209.14252-1-luca@lucaceresoli.net>
References: <20200714085209.14252-1-luca@lucaceresoli.net>
Message-ID: <20200714144936.41a89577@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 10:52:09 +0200
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> Agent++ 4.3.1 does not build if SNMPv3 is disabled due to incorrect #ifdef
> clauses, esulting in errors such as:
> 
>   ../include/agent_pp/notification_originator.h:232:39: error: 'snmpCommunityEntry' has not been declared
>            void set_snmp_community_entry(snmpCommunityEntry* communityEntryRef) {
>                                          ^
>   ../include/agent_pp/notification_originator.h:296:32: error: 'nlmLogEntry' has not been declared
>            void set_nlm_log_entry(nlmLogEntry* nlmLogEntryRef) {
>                                   ^
>   ../include/agent_pp/notification_originator.h:321:9: error: 'nlmLogEntry' does not name a type
>            nlmLogEntry*            _nlmLogEntry;
>            ^
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d7a5fa5ba4ab6c9da23fcc93bf766be9ca630af3/
>   http://autobuild.buildroot.net/results/40ce9bc4bed267dc762a0282a8da0ad1514ad7a8/
>   ...
> 
> Fixes: 88355e967fef ("package/agentpp: bump version to 4.3.1")
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Applied, thanks!

> +Upstream is aware, says "will fix in later version", but thinks to make v3
> +mandatory. See discussion at
> +https://forum.snmp.app/t/agent-compile-fails-if-snmp-has-disable-snmpv3/326
> +
> +Upstream status: none, upstream is not welcoming contributions.

Wow, that's an interesting concept for an open-source project.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
