From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 09:38:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <CAKAx1chfSwdhSnyWud4fqMj5hh6pjAZLLcTQL2HppRoHs529tQ@mail.gmail.com>
References: <1429623019-12174-1-git-send-email-lionel.orry@gmail.com>
 <20150421153349.715c50f7@free-electrons.com>
 <CAKAx1cg4csBWbVi5wKKKPcTBkocTQuf08G2YEMeZHTT686e+8g@mail.gmail.com>
 <5536B0BA.2070100@mind.be>
 <CAKAx1chfSwdhSnyWud4fqMj5hh6pjAZLLcTQL2HppRoHs529tQ@mail.gmail.com>
Message-ID: <20150422093827.0031bb70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 22 Apr 2015 08:01:50 +0200, Lionel Orry wrote:

> I did, on libzmq repository:
> 
> git show 9daf6 > 0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
> 
> And tested this patch. Is this correct ?

Yes, this is OK. You could also do something like:

	git checkout -b buildroot 4.0.5
	git cherry-pick 9daf6
	git format-patch HEAD^

This will "rebase" the patch on top of 4.0.5, which will allow to avoid
the 20 lines offset. You can also edit the patch to add the upstream
commit ID.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
