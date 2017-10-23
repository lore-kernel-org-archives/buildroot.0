From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 23 Oct 2017 18:36:22 +0200
Subject: [Buildroot] [RFC v2 2/4] package/pkg-golang: new package
	infrastructure
In-Reply-To: <20171021215501.3b3e269f@windsurf>
References: <1508173728-29181-1-git-send-email-angelo.compagnucci@gmail.com>
 <1508173728-29181-2-git-send-email-angelo.compagnucci@gmail.com>
 <20171021215501.3b3e269f@windsurf>
Message-ID: <CA+TH9Vnmev=8sFC8hNoW-JjCBKOxKiZ7BkZYwajmtBWi1air1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-10-21 21:55 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 16 Oct 2017 19:08:46 +0200, Angelo Compagnucci wrote:
>> This patch adds a new infrastructure for golang based packages.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> As Christian said, it seems that this infrastructure isn't "general"
> enough to really be useful. We would to see it applied to several
> packages and see that there is a real benefit to several packages to
> apply it.
>
> So I'd be happy to take a go package infrastructure, but it needs to be
> usable by more than one package in a useful way.
>
>> +# Target packages need the Go compiler on the host.
>> +$(2)_DEPENDENCIES += host-go
>> +
>> +#
>> +# go install command doesn't work well when cross compilation is enabled,
>> +# we set the executable output of the compilation to a specific location.
>> +# We set this variable here to be used by packages if needed.
>> +#
>> +$(2)_EXECUTABLE = $$(@D)/gopath/bin/$(1)
>
> This seems to make the assumption that a given package can only install
> a single executable, and that this executable is named after the
> package. It is true for flannel, but what about other Go packages ?

It will be addressed in the respin of the series.

>
>> +# Source files in Go should be uncompressed in a precise folder in the
>> +# hiearchy of GOPATH. It usually resolves around domain/vendor/software.
>> +#
>> +$(1)_src_path ?= $$(call domain,$($(2)_SITE))/$$(firstword $$(subst /, ,$$(call notdomain,$($(2)_SITE))))
>> +$(2)_SRC_PATH  = $$(@D)/gopath/src/$$($(1)_src_path)/$(1)
>
> We don't use lower-case variables in Buildroot, especially if there is
> a variable with the same name upper-case.

Fixed, thanks!

>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
