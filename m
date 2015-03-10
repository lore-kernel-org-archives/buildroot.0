From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Mar 2015 22:43:10 +0100
Subject: [Buildroot] [PATCH v5 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <20150310185612.10d9db1d@free-electrons.com>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <CAHXCMMK00FKgwO0iHs3J3kguRsFvMD5hfBgUUJ8dKcdKw0CDSQ@mail.gmail.com>
 <20150310185612.10d9db1d@free-electrons.com>
Message-ID: <54FF656E.1030400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/15 18:56, Thomas Petazzoni wrote:
> Dear Samuel Martin,
> 
> On Tue, 10 Mar 2015 18:35:21 +0100, Samuel Martin wrote:
> 
>>> +ifeq ($$($(2)_SUPPORTS_IN_SOURCE_BUILD), no)
>> s/, no/,no/
> 
> Actually it should be 'NO' and not 'no'. All other package infra
> variables have upper-case values.
> 
> I know I suggested the SUPPORTS_IN_SOURCE_BUILD name, but what worries
> me a bit is that if one day we want to make the default to build things
> out of tree, a variable named <pkg>_SUPPORTS_IN_SOURCE_BUILD would not
> make much sense anymore. It would have to be named
> <pkg>_REQUIRES_IN_SOURCE_BUILD, set to NO by default in the package
> infra, and that can be overridden to YES by those packages that don't
> support out of tree build.
> 
> So I'm not sure what to do know. Go with <pkg>_SUPPORTS_IN_SOURCE_BUILD
> for the moment, and change that when time comes?

 I'm all for building in a subirectory by default and only do it directly in the
tree when necessary.

 And in fact, I would not even introduce the _REQUIRES_IN_SOURCE_BUILD variable
until it is proven to be necessary. BTW, Thomas, did you introduce something
like that in your out-of-source-build branch?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
