From: Michael Rommel <rommel@layer-7.net>
Date: Wed, 11 Sep 2013 20:34:59 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <1378677483-2424-1-git-send-email-rommel@layer-7.net>
References: <1378677483-2424-1-git-send-email-rommel@layer-7.net>
Message-ID: <AF069D6A-BBA5-4CE4-B424-22362C2C6128@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Sep 11, 2013, at 8:07 , Arnout Vandecappelle <arnout@mind.be> wrote:

> On 08/09/13 13:39, Thomas De Schampheleire wrote:
>> I tried compiling on a powerpc target, but this unfortunately failed:
>> 
>> strip aiccu
>> strip: Unable to recognise the format of the input file `aiccu'
>> make[2]: *** [aiccu] Error 1
>> make[2]: Leaving directory
>> `/home/tdescham/repo/contrib/buildroot-review/output/build/aiccu-20070115/unix-console'
>> 
>> 
>> The aiccu/unix-console/Makefile hardcodes the 'strip' command, but
>> this should be the cross-strip, provided by buildroot through
>> TARGET_STRIP. I think that aiccu should be patched to use STRIP, which
>> defaults to 'strip', and aiccu.mk in buildroot should then pass the
>> right STRIP command.
>> This patch could then also be upstreamed...
> 
> Actually, it is better to remove the strip completely. We strip the target directory in a final step, so that you still have unstripped binaries in the build and staging directories. Most packages leave it up to the distro to strip the binaries - which makes it possible to build foo-dbg packages that have the debug symbols.
> 
> Regards,
> Arnout


Since the mailinglist was down, Arnouts comment came in after I submitted the 
latest version of the patch (I will add numbering in the future).

He proposes to make the patch leave off the strip command completely.
Since I think no upstream patches will be made, it is a matter of your 
guidance. 

@Thomas: If you too think it shall be left off, I'll send a new version.
I can follow the argument of having a debug version around in the build
tree.

Let me know and you'll get a new version (which will be v5, if I counted correctly).


@Arnout: you made comment regarding use of the toolchains from the 
autobuilders. I do not fully understand what you mean, do you refer to these:
http://autobuild.buildroot.net/toolchains/configs/free-electrons/
configurations and suggest, that I set up some of these cross compilers to
test packages I submit first, if they work under these configs? Which would be
the most important ones - I do not have so much space to accomodate them 
all, so if I must focus on 3-5, which should I take?

Thanks,

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 8, 2013, at 23:58 , Michael Rommel <rommel@layer-7.net> wrote:

> Automatic IPv6 Connectivity Configuration Utility for users of a
> IPv6 tunnel broker, developed by sixxs.net
> 
> Signed-off-by: Michael Rommel <rommel@layer-7.net>
> ---
