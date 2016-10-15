From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:05:04 +0200
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0
In-Reply-To: <874m4eosfn.fsf@dell.be.48ers.dk>
References: <20161011125423.38125-1-Vincent.Riera@imgtec.com>
 <874m4eosfn.fsf@dell.be.48ers.dk>
Message-ID: <20161015120504.2e88e2f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 11:46:52 +0200, Peter Korsgaard wrote:

>  > - With the release of BIND 9.11.0, ISC is changing the open source
>  >   license for BIND from the ISC license to the Mozilla Public License
>  >   (MPL 2.0). See release notes:
>  >   http://ftp.isc.org/isc/bind9/9.11.0/RELEASE-NOTES-bind-9.11.0.html  
> 
>  > - Explicitly enable/disable zlib support, otherwise the configure script
>  >   will fail like this:  
> 
>  >   checking for zlib library... yes
>  >   checking for library containing deflate... no
>  >   configure: error: found zlib include but not library.  
> 
> Committed, thanks.

Sorry I forgot to say it on the mailing list, but the license change is
a bit weird. Indeed, there is still a COPYRIGHT file which contains the
old license text. And this file is the one still referenced by the
LICENSE_FILES variable.

Then, there is a new file, called LICENSE, which really contains the
MPL 2.0 license text.

So:

 1/ The LICENSE_FILES variable is now wrong.

 2/ Upstream is very confusing with those two license files, and we
    should probably report that to them. It currently makes it very
    unclear if everything is under MPL2.0 or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
