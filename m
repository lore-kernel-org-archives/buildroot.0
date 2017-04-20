From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Apr 2017 08:01:30 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: ncurses progs equiv as default
In-Reply-To: <20170420040019.bjfwlwaknjvrj33c@tarshish>
References: <1492654408-25342-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170420040019.bjfwlwaknjvrj33c@tarshish>
Message-ID: <CANQCQpZ_6yXNSgpNLGmGLmNwGRsQy84EUPkDoCBMhOTuh49Jsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, Apr 19, 2017 at 11:00 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Matt,
>
> On Wed, Apr 19, 2017 at 09:13:28PM -0500, Matt Weber wrote:
>> By default, enable the busybox equivalents of the ncurses
>> clear and reset if ncurses progs are not enabled.
>
> Our default busybox.config enables these applets. If the user chooses to
> disable them in a custom config, why should we force them back on?
>

True, I was thinking the use case of build time changing (then doing
incremental build)if you use ncurses progs vs not and forcing the
busybox reconfig to have it update the target folder respectively.

I agree this isn't' ideal for all situations, but with these being
terminal tools, would/should you ever turn them off and the amount of
code is small?

Other discussion related to this:
https://patchwork.ozlabs.org/patch/750264/
https://patchwork.ozlabs.org/patch/750721/

-Matt
