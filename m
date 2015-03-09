From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Mar 2015 00:19:11 +0100
Subject: [Buildroot] [PATCH v4 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <20150309220544.48fafdaa@free-electrons.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <20150309220544.48fafdaa@free-electrons.com>
Message-ID: <54FE2A6F.7000207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/15 22:05, Thomas Petazzoni wrote:
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

 Or build in a subdirectory unconditionally...


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
