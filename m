From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Mar 2012 22:30:41 +0100
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <jijjsi$tuq$1@dough.gmane.org> (Grant Edwards's message of "Tue, 
 28 Feb 2012 22:18:58 +0000 (UTC)")
References: <jhub5r$smv$1@dough.gmane.org> <4F435977.1060001@lucaceresoli.net>
 <ji0b7n$2hl$1@dough.gmane.org> <201202282038.54757.arnout@mind.be>
 <jijfkp$qv0$1@dough.gmane.org> <4F4D4751.1030906@gmail.com>
 <jijhcf$a6d$1@dough.gmane.org> <4F4D4FE4.3020506@gmail.com>
 <jijjsi$tuq$1@dough.gmane.org>
Message-ID: <87ipi4p726.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> The doc says one of the options for customizing the filesystem is

 Grant>  * Create your own target skeleton. You can start with the default
 Grant>    skeleton available under fs/skeleton and then customize it to suit
 Grant>    your needs. The BR2_ROOTFS_SKELETON_CUSTOM and
 Grant>    BR2_ROOTFS_SKELETON_CUSTOM_PATH will allow you to specify the
 Grant>    location of your custom skeleton. At build time, the contents of
 Grant>    the skeleton are copied to output/target before any package
 Grant>    installation.

 Grant> I read that as meaning buildroot will use my own customized target
 Grant> skeleton instead of the default one.  Previously in the thread when
 Grant> people mentioned custom skeletons, I thought that option was what they
 Grant> were talking about.

We had support for custom target skeletons pretty much forever, and that
is still supported. What the recent discussion has been about is a
different approach to pretty much do the same. Stick with the default
skeleton, but add any customization at the END of the build sequence
using the post-build script.

Both approaches have advantages and disadvantages, it depends on how
closely your needs are to the default skeleton, and if you want to
automatically use any changes to the default skeleton when you upgrade
your buildroot version.

-- 
Bye, Peter Korsgaard
