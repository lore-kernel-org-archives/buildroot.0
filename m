From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 26 Nov 2009 11:03:15 -0600
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAKFQufuzohdDtAK0gTSeGiIBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<20091126161313.57866352@surf>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAKFQufuzohdDtAK0gTSeGiIBAAAAAA==@cimeq.qc.ca>
Message-ID: <200911261103.17925.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu November 26 2009, Jonathan dumaresq wrote:
> Hi Thomas,
> 
> -----Message d'origine-----
> De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
> la part de Thomas Petazzoni
> Envoy??: 26 novembre 2009 10:13
> ??: buildroot at busybox.net
> Objet?: Re: [Buildroot] jffs2 multiple partition
> 
> Same opinion here. The feature ? put /usr in one filesystem and the rest
> in another filesystem ? is very, very specific. Unless we find a way to
> make it more generally useful, I don't think this belongs to Buildroot.
> 
> Yes I know That this is very specific. To be honest, this is not funny at
> all. But with the patch I just send, You can cherry pick some directory and
> fill the jffs2_partition.txt file ans list those directory (or mount point)
> in there. 
> 
> We could imagine that the user can give a text file saying which
> file/directory should go in which filesystem, so that parts could be
> put into a read-only filesystem and other parts into a read/write
> filesystem. But I'm not sure how this would work.
> 
> This can be a realy fun !!!
> 
> Thomas

Perhaps like a "makedev table"?
Used as an "install command" target re-director?
Not that much different than using exclude-from-file and include-from-file
tar command options to reorganize the output tarball in user scripting.
Sounds like re-inventing an old, well known, wheel.

Hmm... Doesn't the build system already have an option to run things
through a user provided script?

Mike
