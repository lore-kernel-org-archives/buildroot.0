From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:57:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/openal: needs gcc >= 4.9
In-Reply-To: <20200818215412.522185-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 18 Aug 2020 23:54:12 +0200")
References: <20200818215412.522185-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8mulc9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openal uses std::max_align_t since version 1.20.0 and
 > https://github.com/kcat/openal-soft/commit/585b0cf3bed7d1c5720633eb7e5358a9fca865f6

 > As a result, it is affected by
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019
 > and the build with gcc <= 4.8 will fail on:

 > /home/buildroot/autobuild/instance-2/output-1/build/openal-1.20.1/common/almalloc.cpp: In function 'void* al_malloc(size_t, size_t)':
 > /home/buildroot/autobuild/instance-2/output-1/build/openal-1.20.1/common/almalloc.cpp:20:45: error: 'max_align_t' is not a member of 'std'
 >      alignment = std::max(alignment, alignof(std::max_align_t));
 >                                              ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/589c7853ce334c7502f7cd4cdbcaaf3c6840f43b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
