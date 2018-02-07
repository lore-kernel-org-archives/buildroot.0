From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 7 Feb 2018 10:51:10 +0100
Subject: [Buildroot] [PATCH 1/4] openjdk: new package
In-Reply-To: <29b7df93-fa74-d453-aa0f-7d21a33ed719@mind.be>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
 <20180206143952.12332-2-thomas.de_schampheleire@nokia.com>
 <20180206145203.GD20598@australia.be.alcatel-lucent.com>
 <29b7df93-fa74-d453-aa0f-7d21a33ed719@mind.be>
Message-ID: <20180207095110.GJ20598@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 06, 2018 at 11:15:14PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 06-02-18 15:52, Thomas De Schampheleire wrote:
> > 
> > Note: I also added following lines in the top-level Buildroot Makefile to avoid
> > interference from the user's environment:
> > 
> > unexport PLATFORM
> > unexport JAVA_HOME
> > unexport OS
> 
>  You can achieve this locally by adding...
> 
> [snip]
> >> +OPENJDK_MAKE_ENV += X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes \
> >> +		    PULSE_NOT_NEEDED=yes \
> 		PLATFORM= JAVA_HOME= OS= \
> >> +		    BUILD_LD="$(HOSTCC)"

For JAVA_HOME this indeed makes perfect sense.

However, OS and PLATFORM are more generic variables that may conflict with
various packages. I have seen issues with 'OS' for other (proprietary 3rd party)
packages as well, I think likewise for PLATFORM.

So, perhaps the change for OS and PLATFORM could become a separate patch for
inclusion in Buildroot? Would you agree?

/Thomas
