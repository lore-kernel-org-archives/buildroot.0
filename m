From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2015 00:01:28 +0100
Subject: [Buildroot] [PATCH] move random-seed from /etc to /var/lib
In-Reply-To: <20150312002013.GA11018@vostro> (Alex Suykov's message of "Thu,
 12 Mar 2015 02:20:13 +0200")
References: <20150312002013.GA11018@vostro>
Message-ID: <8761a5hlbr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > In case / is mounted read-only, /etc is likely to be read-only
 > as well, so the seed will not be saved.

But if rootfs is RO, so will /var/lib then?

I would rather get rid of the static random_seed file instead. Seeding
all Buildroot based devices with a RO rootfs from the same 512 bytes of
data can hardly be helpful for security.

For a R/W rootfs, why would /var/lib be any better than /etc?

-- 
Bye, Peter Korsgaard
