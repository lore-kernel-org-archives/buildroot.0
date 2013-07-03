From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:45:59 +0200
Subject: [Buildroot] [PATCH 14/23] gcc-initial, gcc-intermediate,
 gcc-final: optimize extraction
In-Reply-To: <87k3l7nwz6.fsf@dell.be.48ers.dk>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k3l7nwz6.fsf@dell.be.48ers.dk>
Message-ID: <20130703234559.663f27b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 03 Jul 2013 23:40:29 +0200, Peter Korsgaard wrote:

>  Thomas> Several sub-directories of the gcc code base are in fact not
>  Thomas> needed for the Buildroot build: libjava/, libgo/ and
>  Thomas> gcc/testsuite/ being the biggest ones. Avoiding their
>  Thomas> extraction saves quite a bit of disk space, and compensates
>  Thomas> a bit the fact that we now extract three times the gcc
>  Thomas> source code.
> 
>  Thomas> This requires changing the 100-uclibc-conf.patch to no
>  Thomas> longer patch files from the libjava/ directory, since this
>  Thomas> directory is no longer extracted.
>  
>  Thomas>  #
>  Thomas> +# Custom extract command
>  Thomas> +#
> 
> I added a short comment that this is purely a disk space optimization,
> and committed - Thanks.

Besides the disk space optimization, I am also hoping that it reduces a
little bit the time to extract the tarball, but I haven't made
measurements to check if it was really the case.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
