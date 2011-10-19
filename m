From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Date: Wed, 19 Oct 2011 18:59:57 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <20111019145934.68b77389@skate>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <201110182339.00295.arnout@mind.be> <1319011959.325.2.camel@sven>
 <201110191135.53268.arnout@mind.be> <20111019145934.68b77389@skate>
Message-ID: <4E9F020D.80201@eukrea.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 19/10/2011 14:59, Thomas Petazzoni a ?crit :
> Le Wed, 19 Oct 2011 11:35:52 +0200, Arnout Vandecappelle<arnout@mind.be>  a
> ?crit :
>
>> The recent kernel.org horror has convinced me that some form of
>> verification is needed, though.
>
> Having hashes in Buildroot will not necessarily provide an additional
> security. Consider the following scenario:
>
> 1. The world exists. 2. Project foo releases foo-2.1.tar.bz2 3. A BR
> packager bumps package foo to 2.1. He downloads the new tarball, generates
> locally its hash and adds this hash to the foo.mk. 4. The BR packager patch
> is merged in Buildroot.
>
> Having hashes in the foo.mk will warn you if the foo website has been
> cracked after step 3. But if it has been cracked between 2) and 3), then
> you're doomed: the BR packager will assume foo-2.1.tar.bz2 is correct. This
> packager will quite probably never check a GPG signature or do any kind of
> additional security check when bumping foo to 2.1.
>
> Therefore, I fear that this mechanism would give an *impression* of higher
> security, but would in fact provide no additional security compared to not
> verifying the hashes.
>
apart from security, the hash feature gives the user the opportunity to be 
sure that he is using the sources which were used by the initial package 
creator and thus are the one which are supposed to have been validated at 
least once.
This can be useful when projects are changing the source archive without 
changing the version number (example : qt 4.7.4 archive which was regenerated 
after the first release) or for project where the source archive with a 
version number is a symbolic link to a source archive with an other version 
number (example : binutils x.y.z which is now x.y.za).
Without a hash check you won't notice these changes (and thus can't analyse 
the impact they may have on your build).

Eric
