From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 18 Oct 2012 17:31:20 +0200
Subject: [Buildroot] export ARCH and CROSS_COMPILE for the post build
 script
In-Reply-To: <20121018153822.58509c94@skate>
References: <507F9EFB.60601@wanadoo.fr> <20121018153822.58509c94@skate>
Message-ID: <508020C8.8000700@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 18/10/2012 15:38, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Thu, 18 Oct 2012 08:17:31 +0200, Thierry Bultel wrote:
>
>> Could we make the export of PATH and CROSS_COMPILE to the post-build
>> script ?
>> This would be really useful for building an external user application
>> in one shot (and I need it in my case).
>>
>> eg something like this in the top Makefile:
>>
>> ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
>>       @$(call MESSAGE,"Executing post-build script")
>> *ARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS)*
>> $(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
>> endif
>>
>> Of course this could be implemented as an option.
>>
>> What do you think about it ?
> Why don't you create a Buildroot package to build your external
> application? It sounds much more logical.

That was my very first idea.
But I wanted to keep the Buildroot tree unchanged.

And at the time I took the decision, I did not find out how
to make such a package be built after all the others.
So "post build" sounded appropriate.

> Thomas
