From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Aug 2016 22:17:28 +0200
Subject: [Buildroot] Buildroot 2016.08-rc1 released
In-Reply-To: <20160806213621.7183038a@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 6 Aug 2016 21:36:21 +0200")
References: <87lh0a9qcr.fsf@dell.be.48ers.dk>
 <20160806120842.1574e227@free-electrons.com>
 <87h9ay9oyt.fsf@dell.be.48ers.dk>
 <20160806213621.7183038a@free-electrons.com>
Message-ID: <87mvkp8xev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 06 Aug 2016 12:22:18 +0200, Peter Korsgaard wrote:

 >> > Are you sure? According to http://autobuild.buildroot.net/stats/, there
 >> > are still 90 packages without hashes. Moreover, the hashes are
 >> > currently not checked for packages not sourced from http/ftp.  
 >> 
 >> A quick check of package/ seemed to show that the only ones missing were
 >> people with custom _SITE_METHOD, but I didn't check the other dirs.

 > Hum, quick example: the slirp package doesn't have a custom
 > _SITE_METHOD, it's just using Git. And it doesn't have a hash file.
 > Same psplash, and many other packages.

Yes, I meant packages not using the wget download method, E.G. packages
with implicit git/hg/svn/.. SITE_METHOD from geturischeme and packages
explicitly setting SITE_METHOD.

 >> So for the packages where we currently can check hashes, we are now
 >> doing it. I might clarify the description for the final release mail.

 > This is not completely correct: thanks to Yann's work, the tarballs we
 > produce locally when fetching from Git are reproducible. So technically
 > speaking, all packages fetched from Git could and should now have a
 > hash file.

True, but we haven't started doing that yet (and the git hashes
basically do the same thing). I do think it makes sense to add explicit
hash files in the future, but we have to be careful if we ever change
the way we create tarballs in the future (like our recent change for
submodules support).

-- 
Venlig hilsen,
Peter Korsgaard 
