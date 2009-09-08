From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Wed, 09 Sep 2009 09:51:32 +1200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
References: <4AA775760200006C0000A21D@gwia.alliedtelesyn.co.nz>
	<4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
Message-ID: <4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Sven> Hi,
>  Sven> On Wed, 2009-09-09 at 07:54 +1200, angus salkeld wrote:
> 
>  >> Another suggestion would be to completely separate out the toolchain
>  >> into a new package "buildcross.git" that only builds the cross
>  >> toolchain and then buildroot always uses the external toolchain.
>  >> It would make buildroot's toolchain setup simpler (one toolchain mode).
>  >> And make sharing toolchains more obvious.
> 
>  Sven> I like that idea. Can't really judge if it would be a success, but it
>  Sven> seems like a nice solution that has the potential to simplify things.
> 
> I have been thinking about it myself. *REALLY* supporting toolchains for
> all the different architectures / variants, uclibc and (e)glibc and
> following up on compiler bugs takes quite some effort (and noone seems
> willing to do it for buildroot), so maybe the best long term solution is
> simply to deprecate the toolchain building stuff and just recommend
> crosstool-ng instead?
> 
> This would make BR less selfcontained / one-stop-shop though.
> 
Well you could treat crosstool-ng as just another package that is
available to build.
So if you select crosstool-ng, buildroot automatically sets up the
correct external toolchain options.

Regards
Angus Salkeld
