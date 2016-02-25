From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 18:01:58 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <874mcwwxyx.fsf@dell.be.48ers.dk>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <20160225170758.1f444549@free-electrons.com>
 <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
 <874mcwwxyx.fsf@dell.be.48ers.dk>
Message-ID: <20160225180158.673b34f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 25 Feb 2016 17:34:14 +0100, Peter Korsgaard wrote:

>  > Also, for packages where the source is included with buildroot, like
>  > makedevs, FOO_SITE is empty too.
> 
> .. but those also don't define _SOURCE / _VERSION, so wget isn't called
> ;)

Yeah, but I was proposing to check for an empty FOO_SITE in the package
infrastructure itself, so we're not at the point where wget gets called.

But to answer Thomas: for cases like makedevs, we can special case such
packages (their _SOURCE is empty, or something like this).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
