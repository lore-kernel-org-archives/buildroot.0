From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 27 Aug 2013 13:56:28 -0500
Subject: [Buildroot] SELinux Buildroot Additions
In-Reply-To: <20130827202505.22f5ee46@skate>
References: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
 <20130827190459.1eb3e4d9@skate>	<OF340CA870.4409C997-ON86257BD4.005E13D7-86257BD4.0061A29C@rockwellcollins.com>
 <20130827202505.22f5ee46@skate>
Message-ID: <OF965741C3.D223706B-ON86257BD4.0066A1F9-86257BD4.00680C50@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 08/27/2013 
01:25:05 PM:

> Can you expand on what is the huge issue between Busybox and the
> SELinux Refpolicy? The fact that the Refpolicy doesn't include a policy
> for Busybox? If so, isn't it possible to contribute a policy that would
> be suitable for usage with Busybox? A quick Google search returns
> http://code.google.com/p/sebusybox/.

Since Busybox is one executable that runs a bunch of different commands, 
there is an issue with the SELinux type transitions happening correctly. 
Programs, including init, end up running in an incorrect context and break 
SELinux rules. A policy could probably be created to let Busybox do what 
it needs to do but then that opens up the issue of having one application 
do everything. A lot of potential security vulnerabilities can be blocked 
by having a bunch of different applications that cannot all be compromised 
at once.  It would be really easy to use busybox if it was possible to 
build separate executables for security critical applications but I don't 
think that feature is available yet.

The packages that I will be adding are all from Tresys (
http://userspace.selinuxproject.org/trac/).  I looked into the sebusybox 
stuff a while ago but it looks like no one has done any development on it 
in a while. 

Thanks,
Clayton

Clayton Shotwell
Software Engineer 
clshotwe at rockwellcollins.com
www.rockwellcollins.com 



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130827/bc0f7ca6/attachment.html>
