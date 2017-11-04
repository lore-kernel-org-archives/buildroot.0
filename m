From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Nov 2017 23:22:46 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <7c1fde5e-099e-7a22-4b13-4ac9e81f3d87@mind.be>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
 <20171104230331.7ee309cb@windsurf>
 <7c1fde5e-099e-7a22-4b13-4ac9e81f3d87@mind.be>
Message-ID: <20171104232246.444c7ca3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Nov 2017 23:07:01 +0100, Arnout Vandecappelle wrote:

>  Exactly. "Failure" anyway just means an error message on the console, not that
> the system fails to boot.

Sure, but some scripts currently just "exit 0" with no error message
whatsoever when the configuration file is missing.

So, let's summarize our policy:

 * Never check if the daemon executable is present, because that's
   silly, Buildroot guarantees it's there.

 * If the daemon needs a configuration file, always check if it exists,
   and if not, bail out with an error message.

But... wait, if Buildroot guarantees that it installs a configuration
file for this daemon, having the init script check its presence is
pretty much as silly as checking the presence of the daemon executable
itself.

So?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
