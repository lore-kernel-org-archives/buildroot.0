From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 12:43:22 -0300
Subject: [Buildroot] [PATCH] dbus-cpp: new package
In-Reply-To: <20131226162407.2debd602@skate>
References: <1388070026-4256-1-git-send-email-gustavo@zacarias.com.ar>
 <20131226162407.2debd602@skate>
Message-ID: <52BC4E9A.9050303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/26/2013 12:24 PM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Thu, 26 Dec 2013 12:00:26 -0300, Gustavo Zacarias wrote:
>> D-Bus C++ bindings, closes bug #65.
> 
> Wow, impressive, you even go to improvement bugs, and fix them!

Yeah, that number was nagging me, a 2-digit when we are on 4-digit bugs :P
Some people want to lower the patchwork patch count, i also look at bugs ;)

> I'm not a big fan when building one package requires poking into the
> source/build tree of another package (even if it's the host variant of
> the same package). Installing the host dbus-cpp into $(HOST_DIR) isn't
> sufficient to build the target dbus-cpp?

Me neither, the problem is patching it (bin/lib separately, ditching the
src/.libs & other references) won't be upstreamable since the option is
right there now and i don't think upstream will want a variation on the
subject.
It's doable but not upstreamable i think, what do we prefer?
Regards.
