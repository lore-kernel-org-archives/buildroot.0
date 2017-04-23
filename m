From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 23:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: ncurses progs equiv as default
In-Reply-To: <CANQCQpZ_6yXNSgpNLGmGLmNwGRsQy84EUPkDoCBMhOTuh49Jsg@mail.gmail.com>
References: <1492654408-25342-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170420040019.bjfwlwaknjvrj33c@tarshish>
 <CANQCQpZ_6yXNSgpNLGmGLmNwGRsQy84EUPkDoCBMhOTuh49Jsg@mail.gmail.com>
Message-ID: <c5cb0b01-856f-aaa6-eb45-5f6af1df8c3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-04-17 15:01, Matthew Weber wrote:
> Baruch,
> 
> On Wed, Apr 19, 2017 at 11:00 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> Hi Matt,
>>
>> On Wed, Apr 19, 2017 at 09:13:28PM -0500, Matt Weber wrote:
>>> By default, enable the busybox equivalents of the ncurses
>>> clear and reset if ncurses progs are not enabled.
>>
>> Our default busybox.config enables these applets. If the user chooses to
>> disable them in a custom config, why should we force them back on?
>>
> 
> True, I was thinking the use case of build time changing (then doing
> incremental build)if you use ncurses progs vs not and forcing the
> busybox reconfig to have it update the target folder respectively.

 This is a use case we certainly don't want to support. On the other hand, we
*do* want to support the use case where the user has a custom busybox config,
doesn't have ncurses, and doesn't want to have clear and reset in his system.

 Regards,
 Arnout

> 
> I agree this isn't' ideal for all situations, but with these being
> terminal tools, would/should you ever turn them off and the amount of
> code is small?
> 
> Other discussion related to this:
> https://patchwork.ozlabs.org/patch/750264/
> https://patchwork.ozlabs.org/patch/750721/
> 
> -Matt
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
