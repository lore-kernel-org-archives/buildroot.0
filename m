From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 12:09:41 -0500
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <20111005084340.204661fb@skate>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
 <20111005084340.204661fb@skate>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, October 04, 2011 11:44 PM, Thomas Petazzoni wrote:
> Le Tue, 4 Oct 2011 18:05:04 -0500,
> H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :
>
>> One other thing with pkg-stats.
>> 
>> Can you think of any way to pull the _VERSION of the packages out of
>> the *.mk files and show that information in the output html file?
>
> Yes, shouldn't be too difficult. Why would this be useful ?

It seems convenient.  Having the script output the package version would
be nicer than having to look at the various *.mk files be hand to see what
version is actually being used by Buildroot.

I have something "kind" of working right now but its output isn't very
nice for a lot of the packages.  I'm doing this in the script:

    version=""

    if grep -m1 "_VERSION" $i > /dev/null ; then
	version=`grep -m1 "_VERSION" $i | awk '{ print $NF }'`
    else
	version="unknown"
    fi

This works fine for the packages that have _VERSION defined like:

FOO_VERSION = x.y.z

But it ends up with the whole line when the spaces are missing around the
'='.  Oh well...

Regards,
Hartley
