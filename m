From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Tue, 11 Nov 2008 20:52:17 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081111183231.E74AC3C989@busybox.net><COL102-DS116EF30796550B219F6BD6DC150@phx.gbl>
	<20081111201051.3d03ac86@surf>
References: <20081111183231.E74AC3C989@busybox.net><COL102-DS116EF30796550B219F6BD6DC150@phx.gbl>
	<20081111201051.3d03ac86@surf>
Message-ID: <COL102-DS2E52421DC2AA67898E7E0DC150@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agreed, a patch will be posted first and the default will be no cache used.

cheers
Dan

--------------------------------------------------
From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
Sent: Tuesday, November 11, 2008 7:10 PM
To: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package

> Le Tue, 11 Nov 2008 18:46:36 -0000,
> <danieljlaird@hotmail.com> a ?crit :
>
>> I have just completed local testing of AUTO_CONFIGURE_TARGET that the
>> GIT based buildroot is using.
>
> Great !
>
>> After I get this back (tomorrow) I suspect that some
>> Makefile.autotools.in packages might not build
>> I will post some common things to try to fix these I just cant build
>> all packages before feeding this back.
>
> Can you post the patch for review before committing. It is quite an
> important change, some review will probably lead to interesting
> comments.
>
> Moreover, as it will not possible to test all packages before
> committing, I'd suggest to commit the patch with the cache disabled by
> default. People who are willing to test in their configuration can
> enable the new feature with just a simple configuration change. By
> doing so, we won't break the build of people not willing to test, while
> still increasing the testing of this nice new feature.
>
>> It has highlighted an issue with the sheer number of config options
>> that are being hardcoded for packages like GTK etc!
>> Do we really need this huge number of configure options? surely
>> configure is not that bad at sniffing values?
>> The problem is that setting these values by hand means they override
>> settings in the cache file which means for example GTK disables CXX
>> compiler, yet I have a perfectly working compiler.
>> WebKit then tries to build after GTK and says I have no CXX compiler.
>> Deleting this hardcoded config flag means the cache file works.
>
> I'm not quite sure what to do with all these changes. But some of them
> are probably necessary: the purpose of ./configure is to compile and
> run some small test programs to see if some features are available or
> not. However, in cross-compiling mode, running these test programs is
> not possible, so overriding configuration options might be necessary.
>
> However, clearly, the case of ac_cv_prog_CXX is wrong. The value of
> this option should be computed in package/Makefile.in depending on the
> configuration, and should be added to TARGET_CONFIGURE_ARGS, which is
> passed to the ./configure script thanks to the Makefile.autools.in
> machinery.
>
> Cheers,
>
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
