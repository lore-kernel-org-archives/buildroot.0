From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:40:29 +0200
Subject: [Buildroot] [PATCH 14/23] gcc-initial, gcc-intermediate,
	gcc-final: optimize extraction
In-Reply-To: <1372620553-11416-15-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:04 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3l7nwz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Several sub-directories of the gcc code base are in fact not needed
 Thomas> for the Buildroot build: libjava/, libgo/ and gcc/testsuite/ being the
 Thomas> biggest ones. Avoiding their extraction saves quite a bit of disk
 Thomas> space, and compensates a bit the fact that we now extract three times
 Thomas> the gcc source code.

 Thomas> This requires changing the 100-uclibc-conf.patch to no longer patch
 Thomas> files from the libjava/ directory, since this directory is no longer
 Thomas> extracted.
 
 Thomas>  #
 Thomas> +# Custom extract command
 Thomas> +#

I added a short comment that this is purely a disk space optimization,
and committed - Thanks.

-- 
Bye, Peter Korsgaard
