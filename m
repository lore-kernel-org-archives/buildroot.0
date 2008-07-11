From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 11 Jul 2008 01:56:59 -0700 (PDT)
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <20080711081729.GB11051@mx.loc>
References: <18377517.post@talk.nabble.com>
	<87y74aqiyy.fsf@macbook.be.48ers.dk>
	<20080711081729.GB11051@mx.loc>
Message-ID: <18399520.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Bernhard Fischer-6 wrote:
> 
> On Thu, Jul 10, 2008 at 09:47:01AM +0200, Peter Korsgaard wrote:
>>>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:
>>
>>Hi,
>>
>> Daniel> This is only a problem as I have not deleted patches
>> Daniel> associated with an old version.  However I wanted to raise
>> Daniel> the issue in case it was originally planned that you could
>> Daniel> have multiple patches in the directory for different versions
>> Daniel> and it would apply only those patches that match.
>>
>>Yes, the Makefile.autotools.in is kinda half baked still.
>>
>> Daniel> Perhaps we could have a PKG_STRICT_PATCH variable.  That if
>> Daniel> set to true would only apply patches that match the version
>> Daniel> string, if not set it would apply all patches.
>>
>>That or put the patches in version specific sub directories like
>>openembedded does.
> 
> What's the point in keeping patches for multiple versions again?
> 
> We usually "svn mv" affected patches (or should anyway). There really
> are very, very few packages where it makes sense to keep multiple
> versions. Except toolchain/* only the kernel comes to mind, the rest
> should just have exactly 1 version, but that one should build and work
> fine.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
The reason for this is making it more flexible and also more stable.
For example the current buildroot uses pango 1.19.3 I am testing locally an
upgrade to 1.21.3.
To do this we overlay buildroot with local modifications and build.
The problem is that the 1.19.3 patches get applied to the 1.21.3 code which
fail.
I cannot easily test all packages that use pango and check they work as well
as previously.
I could however create a patch-VERSION dir and put the 1.19.3 patches into
it.
I could then do the same with 1.21.3.
I think this is more flexible, more suitable to production environments and
is not that much extra maintenance.  
I like to be as close to buildroot mainline as possible to get as much
help/support as possible.  But some changes just do not work and as such the
ability to go back to previously working versions more easily is desirable.
I believe it is also similar to OpenEmbedded
-- 
View this message in context: http://www.nabble.com/Makefile.autotools.in-problems-tp18377517p18399520.html
Sent from the BuildRoot mailing list archive at Nabble.com.
