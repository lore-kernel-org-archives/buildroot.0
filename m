From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Oct 2009 13:40:00 +0200
Subject: [Buildroot] [PATCH] directfb: add host-directfb target for
	directfb-csource
In-Reply-To: <1254482922.3924.16.camel@sven> (Sven Neumann's message of "Fri\,
	02 Oct 2009 13\:28\:42 +0200")
References: <1254481869-3415-1-git-send-email-s.neumann@raumfeld.com>
	<87iqey6o89.fsf@macbook.be.48ers.dk> <1254482922.3924.16.camel@sven>
Message-ID: <8763ay6n3j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> What exactly needs this? I prefer to not add unused stuff. Could we
 >> wait until there's an actual use for this?

 Sven> directfb-csource is very similar to gdk-pixbuf-csource. It creates
 Sven> header files from images so that they can easily be embedded into the
 Sven> binary. I do make use of this in one of our packages. At some point I
 Sven> even plan to release this code under the LGPL, but for now its closed. 

 Sven> Of course I would prefer if the change could be upstream in buildroot,
 Sven> but if you don't want to add it, then we can maintain it in our branch.

Ok, fine by me - Could you please send a patch against upstream git
though?

git am -s3 /tmp/dir.patch
Applying: directfb: add host-directfb target for directfb-csource
error: patch failed: package/directfb/directfb.mk:147
error: package/directfb/directfb.mk: patch does not apply
fatal: sha1 information is lacking or useless (package/directfb/directfb.mk).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
 
 >> Is directfb-csource the only thing we could ever imagine other
 >> packages needing? What about the headers/libs for some other host
 >> tool?

 Sven> The other tools are actually useful on the target, but not likely
 Sven> useful on the host. directfb-csource is the only code-generation
 Sven> tool in there.

Ok, I was more thinking about headers/libs, if something we would need
to compile for the host uses directfb, but we can add than when/if we
need it.

-- 
Bye, Peter Korsgaard
