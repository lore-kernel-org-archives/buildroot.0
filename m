From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 9 Mar 2015 22:25:44 +0100
Subject: [Buildroot] [PATCH v4 1/3] pkg-cmake: allow to build package in
	a subdirectory
In-Reply-To: <20150309220544.48fafdaa@free-electrons.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <20150309220544.48fafdaa@free-electrons.com>
Message-ID: <CAHXCMM+6hyCnsSJjoDmR1YBX+GkJz6RQ2TfMXR=pjeeWD1UPtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 9, 2015 at 10:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gwenhael, Samuel,
>
> On Thu,  5 Mar 2015 12:03:19 +0100, Gwenhael Goavec-Merou wrote:
>
>> +* +LIBFOO_BUILDDIR+ may overload the default build directory when a
>> +  package prevents from in-source-tree build. For example,
>> +  FOO_BUILDDIR = $(FOO_SRCDIR)/.build, will be used to compile foo
>> +  package in .build subdirectory.
>
> Is it really useful to be able to define the path to the build
> directory? I believe we could do something simpler that consists in
> just a boolean variable saying that the package does not accept
> in-source build, like:
>
> LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO
>
> (which would default to YES)
>
> and then the CMake package infra takes care of doing the build in some
> $(@D)/buildroot-build/ directory, or something like that.
>
> Thoughts?

Sounds good too tm.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
