From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:28:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcutl: fix build with gcc 11
In-Reply-To: <2b76e346-7c35-70de-3dd3-cfaa385f51ce@mind.be> (Arnout
 Vandecappelle's message of "Tue, 1 Jun 2021 22:00:48 +0200")
References: <20210530081404.3086770-1-fontaine.fabrice@gmail.com>
 <2b76e346-7c35-70de-3dd3-cfaa385f51ce@mind.be>
Message-ID: <87pmwuktsc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 30/05/2021 10:14, Fabrice Fontaine wrote:
 >> Add -std=c++11 to fix the following build failure with gcc 11:
 >> 
 >> In file included from shared-ptr/base.cxx:5:
 >> ../cutl/shared-ptr/base.hxx:34:41: error: ISO C++17 does not allow dynamic exception specifications
 >> 34 | operator new (std::size_t, cutl::share) throw (std::bad_alloc);
 >> |                                         ^~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/60a39d402a0d051c92aa11421b7a14f7729a0380
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
