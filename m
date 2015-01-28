From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 28 Jan 2015 10:35:21 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <87oapkx7sz.fsf@dell.be.48ers.dk>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com> <87siey4i48.fsf@dell.be.48ers.dk>
 <54C7F84D.7050006@mind.be> <87oapkx7sz.fsf@dell.be.48ers.dk>
Message-ID: <CACQ1gAhgxDtnXCQQm71b+EDVS0ZYj9enM=5OYsN0WzCOKVeiVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-27 21:55 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 25/01/15 23:20, Peter Korsgaard wrote:
>  >>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > [snip]
>  >> > I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
>  >> > BR2_STATIC_LIBS here instead.
>  >>
>  >> I agree that it would be cleaner, but the reason the explicit QT_SHARED
>  >> stuff was added was afaik a lot of systems only needed Qt in a single
>  >> application / that application only used a subset of the Qt
>  >> functionality, so having a static libQt while everything else was shared
>  >> was quite a big win in size / startup time.
>
>  >  But can't you just build with BR2_SHARED_STATIC_LIBS and link your application
>  > with --static? That's what BR2_SHARED_STATIC_LIBS was meant for, right?
>
> More or less, yes. It's not optimal if the application use other
> libraries you want to link dynamically and you need a post-build script
> to get rid of the .so files in the rootfs, but it is fairly close.
Indeed.
As you said, the rootfs has to be cleaned in postbuild, but that should work.
