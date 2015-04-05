From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Apr 2015 11:13:30 +0200
Subject: [Buildroot] [git commit] ipmiutil: only make available for x86
In-Reply-To: <20150405110508.6077a06a@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 5 Apr 2015 11:05:08 +0200")
References: <20150404224203.64C81818DE@busybox.osuosl.org>
 <20150405110508.6077a06a@free-electrons.com>
Message-ID: <87619bndj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > It actually does build fine on ARM, though I agree it probably doesn't
 > make a lot of sense to have ipmiutil on something else than x86/x86-64.

Yes, some archs do have sys/io.h and some kind of inb() / outb()
implementation, but given the purpose of ipmiutil I found it
safer&simpler to just disable it.

We have the same issue for acpid, presumably there will be arm servers
where it makes sense to use it in the future (if these will be using
buildroot is then another question).

 > Thanks for fixing this!

You're welcome.

-- 
Venlig hilsen,
Peter Korsgaard 
