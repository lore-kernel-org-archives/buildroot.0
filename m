From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jun 2017 09:18:12 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr> (Mason's message
 of "Thu, 22 Jun 2017 23:57:03 +0200")
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
 <20170622192701.GC3054@scaer>
 <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr>
Message-ID: <87a84zkw97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mason" == Mason  <slash.tmp@free.fr> writes:

Hi,

 > On freenode #linaro-tcwg, Ryan explained the Linaro toolchain
 > release process to me, which appears to be BR-LTS-compatible.

 > Toolchain releases are supported for 2 years.

 > First year in "stable" mode:
 > Bug fixes, and backports of non-invasive performance fixes for gcc.
 > One update per quarter.

 > Second year in "maintenance" mode:
 > Only bug fixes.
 > Updates when required (e.g. getaddrinfo vuln, or stack clash)

 > Individual components (gcc, glibc, newlib, binutils, gdb)
 > are updated within their respective stable branches, i.e.
 > kept at the same release (gdb is an exception).

 > So, for example, the 6.x release is in stable mode until
 > 2017.08, and in maintenance mode until 2018.08
 > (Ryan pointed out that an OOB release would be done to
 > address stack clash.)

 > See also
 > https://wiki.linaro.org/WorkingGroups/ToolChain/FAQ#What_were.2Fare_the_versions_of_toolchain_released.3F

Ok, looks good. I take it that you are asking for this update because
you have run into some of the issues fixed by later versions?

Can you please send a patch (relative to the 2017.02.x branch) bumping
the toolchains and include the above + any details of the issues you
have encountered?


 >> If as you state they are only bug-fix releases, then we could indeed
 >> bump those toolchains, yes. It imho complies with the goal of an LTS.

 > I believe it does. I don't know exactly how gcc/glibc
 > plan to address "stack clash" but I think it's important
 > for BR-LTS to include these fixes.

Agreed.


 >> Note however that we so far never bumped the gcc version in the LTS
 >> branch, but we already had 6.3 at the time we cut the LTS. So it's
 >> difficult to say if we would bump it. Probably, I'd say...

 > Isn't this the first time BR did an LTS release?

Indeed ;) I guess Yann meant that we so far haven't bumped the gcc
version in 2017.02.x (or in any other point releases).

-- 
Bye, Peter Korsgaard
