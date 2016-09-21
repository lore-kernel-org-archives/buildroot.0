From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 11:00:42 +0200
Subject: [Buildroot] [PATCH 1/1] libfastjson: Was referencing
	non-existing files
In-Reply-To: <CAA=pTTRQKB0S0uz7xqHwUz4pw5__+e5Ws-xV_OjnpFL+Gyfy5g@mail.gmail.com>
References: <1474018609-2610-1-git-send-email-fpa@sbtaqua.com>
 <20160916185559.23a41621@free-electrons.com>
 <CAA=pTTRC8oK_GkwHYca3+ky2nRvyvGKS=RyOK1qogYmYGjptPA@mail.gmail.com>
 <87y42m1vzq.fsf@dell.be.48ers.dk>
 <CAA=pTTRQKB0S0uz7xqHwUz4pw5__+e5Ws-xV_OjnpFL+Gyfy5g@mail.gmail.com>
Message-ID: <20160921110042.538663cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 08:44:23 +0000, Frederik Peter Aalund wrote:

> > <pkgname>-<version>.tar.gz is the default name of the tarball, so it
> > sounds like you have a LIBFASTJSON_SOURCE = .. somewhere - Please double
> > check.  
> 
> That must have been the culprit. Even though I deleted the external
> libfastjson.mk file,
> the value of LIBFASTJSON_SOURCE must still have been cached somewhere. There
> were no errors after i purged the entire buildroot folder. Thanks for
> investigating.

There is no cache anywhere in Buildroot for such variables. So it must
have been *defined* somewhere explicitly, due to a modification you had
done.

> > Nice, so you are using Buildroot on the sensors?  
> 
> Yes, and I'm really liking it so far. `make legal-info` in particular is
> very handy when aggregating programs in a distribution.

Glad to hear this is a useful functionality!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
