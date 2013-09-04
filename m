From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 04 Sep 2013 13:55:29 +0200
Subject: [Buildroot] [git commit] libevas: async image preload support
	needs threads support in toolchain
In-Reply-To: <20130904133410.2f17a22f@skate> (Thomas Petazzoni's message of
 "Wed, 4 Sep 2013 13:34:10 +0200")
References: <20130904113143.AE4BC9B6EA@busybox.osuosl.org>
 <20130904133410.2f17a22f@skate>
Message-ID: <87r4d44x8u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Wed, 4 Sep 2013 13:31:19 +0200, Peter Korsgaard wrote:

 >> +# async image preload support needs threads support in toolchain
 >> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)

 Thomas> Maybe using positive logic would have been better, no?

 Thomas> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 Thomas> ...
 Thomas> endif

Perhaps. I don't really feel strongly about it, and we do have quite a
mix today:

git grep 'ifneq.*,y)' package | wc -l
164

git grep 'ifeq.*,)' package/|wc -l
85

-- 
Bye, Peter Korsgaard
