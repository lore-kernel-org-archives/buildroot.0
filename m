From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 10:31:26 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <521ED985.9050705@mind.be>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
 <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
 <521ED985.9050705@mind.be>
Message-ID: <20130829103126.7bcbf18a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 07:17:57 +0200, Arnout Vandecappelle wrote:

> > That was the problem. Thanks!
> 
>   Right. Maybe we should just rename target/ to 
> THIS_IS_NOT_YOUR_ROOT_FILESYSTEM instead of just creating the file. The 
> latter is obviously not enough.
> 
>   What was the reason we didn't do that in the first place?

I personally find it a bit ugly. Moreover, having a file allows to add
contents to explain *why* it is not the root filesystem, while a
directory cannot contain an explanation :)

Since we've added the THIS_IS_NOT_YOUR_ROOT_FILESYSTEM file, this is
the *first* time we have a new report of people using output/target
directly for NFS mounting. At this point, with a file with such a name,
and the contents of the file explaining how to do NFS mounting, I think
there's not much else we can do except pointing users at this file
which documents why what they are doing cannot work.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
