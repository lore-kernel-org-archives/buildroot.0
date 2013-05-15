From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 May 2013 11:01:51 +0200
Subject: [Buildroot] [PATCH 1/2] graph-depends: ignore the
 'target-generic-dont-remount-rw' target
In-Reply-To: <20130515101604.59629ace@skate>
References: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net>
 <20130515101604.59629ace@skate>
Message-ID: <51934EFF.9080304@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed, 15 May 2013 10:11:02 +0200, Luca Ceresoli wrote:
>> The graph-depends script tries to call 'make target-generic-dont-remount-rw',
>> which doesn't exist since 'target-generic-dont-remount-rw' is not a package.
>>
>> See also the comments for commit 72bd61e5b8c2094378.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>> I guess we could compute the TARGET_EXCEPTIONS automatically and avoid the
>> need to update it every time. But it would be a longer work, so for now I
>> would just fix it manually.
> I agree. For example, target-generic-getty-sysvinit is still missing
> from the list.
>
> I see two ways to handle that automatically:
>
>   * Have all those special targets starting with "target-" and have
>     graph-depends exclude them automatically. Simple, but not nice if we
>     have a real package named "target-<something>".
>
>   * Instead of registering all packages into the make variable called
>     TARGETS, register them into a variable called PACKAGES, which will
>     get appended (at the right place) to the TARGETS variable. This way,
>     the 'show-targets' thing can be turned into a 'show-packages' that
>     will only display the value of the PACKAGES variable. This solution
>     is probably cleaner than the previous one.
>
> What do you think?

The second option looks much better to me, too.

Luca
