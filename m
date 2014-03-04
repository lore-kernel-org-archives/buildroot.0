From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Mar 2014 00:11:35 +0100
Subject: [Buildroot] [PATCH v5 2/4] Makefile: export PATH including the
 Buildroot host bindirs
In-Reply-To: <20140304225234.164382f9@skate>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
 <1393703951-7059-3-git-send-email-s.martin49@gmail.com>
 <53160821.9080907@mind.be> <20140304225234.164382f9@skate>
Message-ID: <CAHXCMML5Q+w=9g=Wqsu3EJGUMWs8__fL4cYrTUPHsXyc-HH49w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, all,

On Tue, Mar 4, 2014 at 10:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 04 Mar 2014 18:06:41 +0100, Arnout Vandecappelle wrote:
>> On 01/03/14 20:59, Samuel Martin wrote:
>> > This patch exports the PATH variable containing the factorized content
>> > of TARGET_PATH and HOST_PATH (because they were fairly similar).
>> >
>> > TARGET_PATH and HOST_PATH are now set using only the PATH variable.
>> >
>> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>>  Looks good to me.
>>
>>  Except... I'm having second thoughts about the principle of this patch.
>> When debugging failing builds, I often copy&paste the build command line
>> if I want to drill down to the details of the error. But if PATH is
>> exported (and TARGET_PATH is removed, in 4/4), it is no longer visible on
>> the command line... So I have to remember to set it myself...
>
> True. I also do that very often.

... and I use that too!

>
> I personally dislike exporting the PATH globally, as it means that
> we're "magically" passing some stuff into the commands we are running,
> which are not explicit when looking at the commands being executed.

The main argument in favor of exporting the PATH is having it
correctly set when executing the post-{build,image} scripts; things
that could set when calling these scripts (the same way we set it in
the environment when build the packages).

I think I made the wrong call ;-)
So, I'll go for another round.

>
>>  A workaround would be to add a 'make shell' target, that drops you into
>> an interactive shell. I don't really like it very much, but it would
>> solve other issues with exported variables.
>
> Not a big fan either :/

Regards,

-- 
Samuel
