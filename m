From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:43:23 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <d08e9569-ab62-3cd2-e1ab-64b5c8aa85b8@mind.be> (Arnout
 Vandecappelle's message of "Sun, 26 May 2019 11:43:47 +0200")
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
 <20190518221352.0630eaa6@windsurf>
 <e0c589d1-ce45-0132-43da-db2605b81616@micronovasrl.com>
 <74098714-11ae-9897-a5fb-71db0f04c44a@micronovasrl.com>
 <e0f46b82-02c0-7a4d-a67b-f21faa5ceda3@micronovasrl.com>
 <d08e9569-ab62-3cd2-e1ab-64b5c8aa85b8@mind.be>
Message-ID: <87imtxl9us.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> But IMHO we should proceed with dropping clapack.

 >  Why? it is maintained, and it is a dependency of armadillo...

 >  I had a deeper look, and actually lapack and clapack are the same, just
 > compiled differently: lapack is built with the fortran compiler, clapack is
 > generated with f2c (by upstream) and built with the C compiler. AFAIU, anything
 > that uses lapack should also be able to use clapack and vice versa.

 >  We have two packages like that: numpy and armadillo. They both seem to support
 > both lapack and clapack.

 >  So, it seems indeed removing clapack is the appropriate thing. Except: lapack
 > requires a fortran compiler, which is not always available. So in that sense, it
 > would actually be more appropriate to remove lapack...

 >  But maybe it would be better to normally use lapack, and only enable clapack
 > when lapack isn't available (i.e. when there's no fortran compiler).

Not knowing anything about (c)lapack (or fortran), is there any
performance advantage using lapack over clapack? Otherwise just always
using clapack seems like the simplest solution.

-- 
Bye, Peter Korsgaard
