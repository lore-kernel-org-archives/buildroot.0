From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jan 2015 21:42:53 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <87siey4i48.fsf@dell.be.48ers.dk>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
 <87siey4i48.fsf@dell.be.48ers.dk>
Message-ID: <54C7F84D.7050006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/15 23:20, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
[snip]
>  > I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
>  > BR2_STATIC_LIBS here instead.
> 
> I agree that it would be cleaner, but the reason the explicit QT_SHARED
> stuff was added was afaik a lot of systems only needed Qt in a single
> application / that application only used a subset of the Qt
> functionality, so having a static libQt while everything else was shared
> was quite a big win in size / startup time.

 But can't you just build with BR2_SHARED_STATIC_LIBS and link your application
with --static? That's what BR2_SHARED_STATIC_LIBS was meant for, right?

 Regards,
 Arnout


> 
> It does complicate LGPL compliance and I don't know if the disk space
> concerns are as big these days though.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
