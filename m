From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Jan 2019 13:24:09 +0100
Subject: [Buildroot] [PATCH 2/2] utils/get-developers: really make it
 callable from elsewhere than the toplevel directory
In-Reply-To: <20190103105657.23751-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Jan 2019 11:56:56 +0100")
References: <20190103105657.23751-1-peter@korsgaard.com>
 <20190103105657.23751-2-peter@korsgaard.com>
Message-ID: <87ef9smx06.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit 62d5558f76a (utils/get-developers: make it callable from elsewhere
 > than the toplevel directory) tried to fix this by passing in the toplevel
 > directory when the DEVELOPERS file is parsed.

 > Unfortunately this is not enough, as E.G.  also the paths listed in the
 > patches are relative to the toplevel directory, causing it to not match the
 > entries in the DEVELOPERS file.

 > In concept this can be fixed by also passing the toplevel directory to the
 > Developers class, but the simplest solution is just to chdir to the toplevel
 > Buildroot directory before calling any of the getdeveloperlib functions.

 > This does require us to finish parsing command line arguments (which opens
 > the provided patch files) to not get into trouble with relative paths to
 > patches before chdir'ing / initializing getdeveloperlib.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
