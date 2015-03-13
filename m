From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2015 07:20:33 +0100
Subject: [Buildroot] [PATCH] move random-seed from /etc to /var/lib
In-Reply-To: <20150313002017.GA11581@vostro> (Alex Suykov's message of "Fri,
 13 Mar 2015 02:20:17 +0200")
References: <20150312002013.GA11018@vostro> <8761a5hlbr.fsf@dell.be.48ers.dk>
 <20150313002017.GA11581@vostro>
Message-ID: <87wq2lfmfi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 >> > In case / is mounted read-only, /etc is likely to be read-only
 >> > as well, so the seed will not be saved.
 >> 
 >> But if rootfs is RO, so will /var/lib then?
 > Common (I think?) setup is to have ro / and rw /var on some
 > kind of persistent storage. This way /etc typically remains
 > a part of read-only root.

I don't know how common this is. Projects I've worked with have done the
opposite (RO rootfs with a R/W overlay on top of /etc).

 >> I would rather get rid of the static random_seed file instead. Seeding
 >> all Buildroot based devices with a RO rootfs from the same 512 bytes of
 >> data can hardly be helpful for security.

> Agreed. Currently the initial file is only used to check for rw filesystem.
 > That's not necessary, and easy to fix. Sending a patch.

Not only that - If you have a RO /etc then the system gets initialized
with the "our" seed on every boot.

-- 
Bye, Peter Korsgaard 
