From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 19:38:53 +0100
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <200911261103.17925.minimod@morethan.org> (Michael S. Zick's
	message of "Thu\, 26 Nov 2009 11\:03\:15 -0600")
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<20091126161313.57866352@surf>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAKFQufuzohdDtAK0gTSeGiIBAAAAAA==@cimeq.qc.ca>
	<200911261103.17925.minimod@morethan.org>
Message-ID: <878wdt872a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> Perhaps like a "makedev table"?  Used as an "install command"
 Michael> target re-director?  Not that much different than using
 Michael> exclude-from-file and include-from-file tar command options to
 Michael> reorganize the output tarball in user scripting.  Sounds like
 Michael> re-inventing an old, well known, wheel.

Yes, exactly. It also shouldn't be jffs2 specific - E.G. you might want
the base system to be on squashfs, and "extra" stuff on jffs2.

 Michael> Hmm... Doesn't the build system already have an option to run things
 Michael> through a user provided script?

It does (BR2_ROOTFS_POST_BUILD_SCRIPT) - But that runs *BEFORE* the
target fs'es are created. You can ofcause do something like this
outside BR from the tarball target.

-- 
Bye, Peter Korsgaard
